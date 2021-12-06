package learning.languageimplementationpatterns.core.visualbasic6;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.Map;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.ArrayDefContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.AsTypeClauseContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.ExplicitDeclarationContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.FieldLengthContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.IdentifierContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.InitialValueContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.ModifierContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.TypeContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.VariableListContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.VariableStmtContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParserBaseListener;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.NodeExplorer;
import br.com.recatalog.util.PropertyList;
import learning.languageimplementationpatterns.core.ContextData;
import learning.languageimplementationpatterns.core.Language;
import learning.languageimplementationpatterns.core.Scope;
import learning.languageimplementationpatterns.core.Symbol;
import learning.languageimplementationpatterns.core.SymbolFactory;
import learning.languageimplementationpatterns.core.SymbolTable;
import learning.languageimplementationpatterns.core.SymbolTableVB6;

public class VisualBasic6DefPredefinedSym extends VisualBasic6CompUnitParserBaseListener {
	
	SymbolTable st;
	PropertyList properties;
	Deque<Scope> scopes;
	Scope moduleScope;
	Scope globalScope;
	ParseTree compUnitTree;
	SymbolFactory symbolFactory;
	Map<String,Integer> controlArrays;
	Language language;
	
	public VisualBasic6DefPredefinedSym(PropertyList properties) {

		this.properties = properties;
		this.st = (SymbolTable) this.properties.mustProperty("SYMBOL_TABLE");
		this.compUnitTree = (ParseTree) this.properties.mustProperty("ASTREE");
		symbolFactory = st.getSymbolFactory();
		scopes = new ArrayDeque<Scope>();

		globalScope = st.getGlobalScope();
		pushScope(st.getGlobalScope());	
		
		moduleScope = (Scope)st.getTreeToModule().get(compUnitTree);
		language = (Language)st.getProperties().mustProperty("LANGUAGE");
		pushScope(moduleScope);	
	}

	@Override
	public void enterModifier(VisualBasic6CompUnitParser.ModifierContext ctx) {
		ParserRuleContext ctxExplicitDeclaration = NodeExplorer.getAncestorClass(ctx, ExplicitDeclarationContext.class.getSimpleName());
		List<String> modifierList = st.getModifierMap().get(ctxExplicitDeclaration);
		if(modifierList == null) {
			modifierList = new ArrayList<>();
			st.getModifierMap().put(ctxExplicitDeclaration, modifierList);
		}
		modifierList.add(ctx.getText());
	}	

	@Override
	public void enterFormalParameter(VisualBasic6CompUnitParser.FormalParameterContext ctx) {
		VariableStmtContext varCtx = (VariableStmtContext) NodeExplorer.getChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		PropertyList variableProperties = new PropertyList();
		variableProperties.addProperty("SUB_CATEGORY", "FORMAL_PARAMETER");
		
		createVariableSymbol(varCtx,variableProperties);
	}	
	
	// Alterado enterVariableDeclaration para exitVariableDeclaration
	// porque na "descida" marca tipo e modifier compartilhados como em: Dim Tamanho, I  As Integer
	// e na "subida" define as variáveis
	// 
	// IMPORTANTE: precisa ser no "EXIT" e não no "ENTER" porque já teria passado
	//             pelo sharedModifier e sharedType como em: "Dim Tamanho1, Tamanho2 As Integer
	@Override
	public void exitVariableDeclaration(VisualBasic6CompUnitParser.VariableDeclarationContext ctx) {
//		VariableStmtContext varCtx = (VariableStmtContext) NodeExplorer.getChildClass(ctx, "VariableStmtContext");
//		createVariableSymbol(varCtx, new PropertyList());
		
		List<ParseTree> ctxVariableStmtContextList = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());

		PropertyList createVariableProperties = new PropertyList();
//		createVariableProperties.addProperty("SCOPE", getCurrentScope());	
		
		for(ParseTree ctxVarStmt : ctxVariableStmtContextList) {
			createVariableSymbol((VariableStmtContext)ctxVarStmt, createVariableProperties);
		}
	}
	
	@Override
	public void enterVariableList(VisualBasic6CompUnitParser.VariableListContext ctx) {
		List<ParseTree> ctxVariableContetStmtList = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		if(ctxVariableContetStmtList.size() > 1) { // Mais de uma varável declarada na mesma declaração
			setSharedModifierAndType(ctx);         // salva Modifier e Type se alguma das
		}                                          // variáveis declaradas não tiver explicitamente
	}	                                           // o tipo declarado. Ex: "Dim Tamanho1, Tamanho2 As Integer" 
	
	private void setSharedModifierAndType(VisualBasic6CompUnitParser.VariableListContext ctx) {
		ModifierContext ctxModifier = (ModifierContext) NodeExplorer.getSibling(ctx, ModifierContext.class.getSimpleName());
		TypeContext ctxType = (TypeContext) NodeExplorer.getDepthFirstChildClass(ctx, TypeContext.class.getSimpleName());
		
		ContextData ctxData = null;
		
		if(ctxModifier != null ) {
			ctxData = st.addContextData(ctx);
			ctxData.setScope(getCurrentScope());
			ctxData.getProperties().addProperty("SHARED_MODIFIER", ctxModifier.getText());
		}
		
		if(ctxType != null ) {
			if(ctxData == null) {
				ctxData = st.addContextData(ctx);
			}
			ctxData.getProperties().addProperty("SHARED_TYPE", ctxType.getText());
		}		
	}
	
	@Override
	public void enterDeclareStmt(VisualBasic6CompUnitParser.DeclareStmtContext ctx) {
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "DECLARE_" + ctx.methodType().getText().toUpperCase());
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("NAME", ctx.Name.getText());
		symbolProperties.addProperty("SYMBOL_TYPE", "DECLARED_" + ctx.methodType().getText().toUpperCase());
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
		if(ctx.asTypeClause() != null) {
			symbolProperties.addProperty("TYPE", ctx.asTypeClause().getText());
		}
		symbolProperties.addProperty("DEF_MODE", "EXPLICITY");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "DECLARE");          // 
		symbolProperties.addProperty("SUB_CATEGORY", ctx.methodType().getText().toUpperCase());
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

        Scope scope = (Scope)symbolFactory.getSymbol(symbolFactoryProperties);
        
        if(ctx.alias() != null) {
        	scope.getProperties().addProperty("ALIAS", ctx.alias().getText().replace("\"", ""));
        }
        if(ctx.library() != null) {
        	scope.getProperties().addProperty("LIB", ctx.library().getText().replace("\"", ""));
        }

		st.addContextData(ctx);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.getContextData(ctx).setSymbol((Symbol)scope);
		st.addDefinedSymbol((Symbol)scope);        
        
        pushScope(scope);
	}
	
	@Override
	public void exitDeclareStmt(VisualBasic6CompUnitParser.DeclareStmtContext ctx) {
		popScope();
	}

	@Override
	public void enterTypeDefStmt(VisualBasic6CompUnitParser.TypeDefStmtContext ctx) {
		
		String name = ctx.Name.getText();
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "TYPE");
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("NAME", name);
		symbolProperties.addProperty("SYMBOL_TYPE", "TYPE");
		symbolProperties.addProperty("SCOPE", getCurrentScope());

		if(modifierScope(ctx).indexOf("PUBLIC") > -1
				|| modifierScope(ctx).indexOf("GLOBAL") > -1) {
			symbolProperties.addProperty("SCOPE", globalScope);
		}
		
		symbolProperties.addProperty("CONTEXT", ctx);
		symbolProperties.addProperty("DEF_MODE", "EXPLICITY");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "STRUCTURE");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "TYPE");
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);
		
		st.addContextData(ctx);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.getContextData(ctx).setSymbol((Symbol)scopeMethod);
		st.addDefinedSymbol((Symbol)scopeMethod);
		
		pushScope(scopeMethod);		
		
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());

		PropertyList createVariableProperties = new PropertyList();
		createVariableProperties.addProperty("PARENT_SCOPE", getCurrentScope());
		createVariableProperties.addProperty("SCOPE", getModuleScope());

		for(ParseTree var : variables) {
			createVariableSymbol((VariableStmtContext)var, createVariableProperties);
		}
		

	}
	
	@Override
	public void exitTypeDefStmt(VisualBasic6CompUnitParser.TypeDefStmtContext ctx) {
		popScope();
	}

	@Override
	public void enterEnumDefStmt(VisualBasic6CompUnitParser.EnumDefStmtContext ctx) {
		String name = ctx.Name.getText();
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "ENUM");
		
		PropertyList symbolProperties = new PropertyList();        // usado para cria os simbolos
		symbolProperties.addProperty("NAME", name);
		symbolProperties.addProperty("SYMBOL_TYPE", "ENUM");
		symbolProperties.addProperty("SCOPE", getCurrentScope());

		if(modifierScope(ctx).indexOf("PUBLIC") > -1
				|| modifierScope(ctx).indexOf("GLOBAL") > -1) {
			symbolProperties.addProperty("SCOPE", globalScope);
		}	
		
		symbolProperties.addProperty("CONTEXT", ctx);
		symbolProperties.addProperty("DEF_MODE", "EXPLICITY");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "STRUCTURE");          
		symbolProperties.addProperty("SUB_CATEGORY", "ENUM");
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);
		
//		ExplicitDeclarationContext ctxExplicitDeclaration =
//				(ExplicitDeclarationContext) NodeExplorer.getAncestorClass(ctx, ExplicitDeclarationContext.class.getSimpleName());
//		List<String> modifiers = st.getModifierMap().get(ctxExplicitDeclaration);
//		
//		for(String mod : modifiers) {
//			if(mod.equalsIgnoreCase("PUBLIC")) symbolProperties.addProperty("SCOPE", globalScope);
//			if(mod.equalsIgnoreCase("GLOBAL")) symbolProperties.addProperty("SCOPE", globalScope);
//			if(mod.equalsIgnoreCase("PRIVATE")) symbolProperties.addProperty("SCOPE", getModuleScope());
//		}

		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);	
		
		st.addContextData(ctx);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.getContextData(ctx).setSymbol((Symbol)scopeMethod);
		st.addDefinedSymbol((Symbol)scopeMethod);
		
		pushScope(scopeMethod);		
		
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		PropertyList varProperties = new PropertyList();
		
//		varProperties.addProperty("SCOPE", globalScope);
		if(modifierScope(ctx).indexOf("PUBLIC") > -1
				|| modifierScope(ctx).indexOf("GLOBAL") > -1) {
			varProperties.addProperty("SCOPE", globalScope);
		}		
		
		varProperties.addProperty("PARENT_SCOPE", getCurrentScope());
		varProperties.addProperty("CATEGORY", "VARIABLE");          
		varProperties.addProperty("SUB_CATEGORY", "ENUM_MEMBER");
		
		for(ParseTree var : variables) {
			createVariableSymbol((VariableStmtContext)var, varProperties);
		}
	}
	
	@Override
	public void exitEnumDefStmt(VisualBasic6CompUnitParser.EnumDefStmtContext ctx) {
		popScope();
	}

//	@Override
//	public void enterEventDefStmt(VisualBasic6CompUnitParser.EventDefStmtContext ctx) {
//		
//		String name = ctx.Name.getText();
//		
//		PropertyList symbolFactoryProperties = new PropertyList();
//		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "EVENT");
//		
//		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
//		symbolProperties.addProperty("NAME", name);
//		symbolProperties.addProperty("SYMBOL_TYPE", "EVENT");
//		symbolProperties.addProperty("SCOPE", getCurrentScope());
//		symbolProperties.addProperty("CONTEXT", ctx);
////		symbolProperties.addProperty("TYPE", null);
//		symbolProperties.addProperty("DEF_MODE", "EXPLICITY");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
//		symbolProperties.addProperty("CATEGORY", "EVENT");          // 
//		symbolProperties.addProperty("SUB_CATEGORY", null);
//		
//		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
//		symbolProperties.addProperty("LANGUAGE", language);
//
//		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);	
//		
//		st.addContextData(ctx);
//		st.getContextData(ctx).setScope(getCurrentScope());
//		st.getContextData(ctx).setSymbol((Symbol)scopeMethod);
//		st.addDefinedSymbol((Symbol)scopeMethod);		
//		
//		
//		pushScope(scopeMethod);		
//		
//		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
//		
//		for(ParseTree var : variables) {
//			createVariableSymbol((VariableStmtContext)var, new PropertyList());
//		}
//	}
//	
//	@Override
//	public void exitEventDefStmt(VisualBasic6CompUnitParser.EventDefStmtContext ctx) {
//		popScope();
//	}	
	
	private void createVariableSymbol(VariableStmtContext varCtx, PropertyList _properties) {
		String name = varCtx.Name.getText();
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		PropertyList symbolFactoryProperties = new PropertyList();
		
		if(   name.endsWith("!")  // Single
		   || name.endsWith("@")  // Currency
		   || name.endsWith("#")  // Double
		   || name.endsWith("$")  // String
		   || name.endsWith("%")  // Integer
		   || name.endsWith("&")) // Long
		{ 
			String typeIndicator = name.substring(name.length()-1);
			name = name.substring(0,name.length()-1);
			symbolProperties.addProperty("TYPE_INDICATOR", typeIndicator);
			String type = null;
			if(typeIndicator.equals("!")) type = "Integer";
			if(typeIndicator.equals("@")) type = "Currency";
			if(typeIndicator.equals("#")) type = "Double";
			if(typeIndicator.equals("$")) type = "String";
			if(typeIndicator.equals("%")) type = "Integer";
			if(typeIndicator.equals("&")) type = "Long";
			symbolProperties.addProperty("TYPE",type );
		}
		
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "VARIABLE");
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);

		symbolProperties.addProperty("NAME", name);
		
		symbolProperties.addProperty("CONTEXT", varCtx);
		symbolProperties.addProperty("DEF_MODE", "EXPLICITY");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "VARIABLE");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "DEFINITION");
		symbolProperties.addProperty("SCOPE", getCurrentScope());	
		
		symbolProperties.addProperty("LANGUAGE", language);
		symbolProperties.addProperty("MODULE", getModuleScope().getName());
		
		ArrayDefContext arrayCtx = varCtx.arrayDef();
		if(arrayCtx != null) {
			symbolProperties.addProperty("ARRAY", arrayCtx.getText());
		}
		
		AsTypeClauseContext asTypeClauseCtx = varCtx.asTypeClause();
		if(asTypeClauseCtx != null) {
			symbolProperties.addProperty("TYPE_CLAUSE", asTypeClauseCtx.getText());
			symbolProperties.addProperty("TYPE", asTypeClauseCtx.type().getText());
		}
		else {
			String type = hasSharedType(varCtx);
			if(type != null) {
				symbolProperties.addProperty("TYPE_CLAUSE", "SHARED");
				symbolProperties.addProperty("TYPE", type);
			}
			else {
				symbolProperties.addProperty("TYPE_CLAUSE", "IMPLICITY");
				symbolProperties.addProperty("TYPE", "Variant");
			}
		}
		
		FieldLengthContext fieldLengthCtx = varCtx.fieldLength();
		if(fieldLengthCtx != null) {
			symbolProperties.addProperty("FIELD_LENGTH", fieldLengthCtx.getText());
		}		
				
		InitialValueContext initialValueCtx = varCtx.initialValue();
		if(initialValueCtx != null) {
			symbolProperties.addProperty("INIT_VALUE"
					       , initialValueCtx.getText().substring(1)); // ignora o "="
		}
		
		symbolProperties.appendProperties(_properties);

		
		Symbol sym = symbolFactory.getSymbol(symbolFactoryProperties);
		
		ParserRuleContext identifierCtx = (ParserRuleContext) NodeExplorer.getDepthFirstChildClass(varCtx, IdentifierContext.class.getSimpleName());

		if(identifierCtx != null) {
			identifierCtx = (ParserRuleContext) identifierCtx;

			ArrayList<ParseTree> identifierCtxList = NodeExplorer.getDepthAllChildClass(identifierCtx, IdentifierContext.class.getSimpleName());			

			if(identifierCtxList.size() > 0) {
				BicamSystem.printLog("WARNING", "Definição de variável com nome composto: "
		                 + sym.location());				
			}
			st.addContextData(identifierCtx);
			st.getContextData(identifierCtx).setSymbol(sym);
			st.getContextData(identifierCtx).setScope(getCurrentScope());
		}
		else {
			BicamSystem.printLog("WARNING", "Variável não identificada na definicção: "
					                 + sym.location());
		}

		st.addContextData(varCtx);
		st.getContextData(varCtx).setSymbol(sym);
		st.getContextData(varCtx).setScope(getCurrentScope());
		st.addDefinedSymbol(sym);
	}
	
	private String hasSharedType(ParserRuleContext ctx) {
		VariableListContext ctxVariableList = (VariableListContext) NodeExplorer.getAncestorClass(ctx, VariableListContext.class.getSimpleName());
		ContextData contextData = st.getContextData(ctxVariableList);
		if(contextData != null) {
		return (String)contextData.getProperties().getProperty("SHARED_TYPE");
		}
		else return null;
	}
	
	
	private List<String> modifierScope(ParserRuleContext ctx ){
		ExplicitDeclarationContext ctxExplicitDeclaration = (ExplicitDeclarationContext) NodeExplorer.getAncestorClass(ctx, ExplicitDeclarationContext.class.getSimpleName());
		List<String> modifierList = st.getModifierMap().get(ctxExplicitDeclaration);

		if(modifierList == null) {
			modifierList = new ArrayList<String>();
			String moduleType = (String) moduleScope.getProperties().mustProperty("MODULE_TYPE");
			if(moduleType.equalsIgnoreCase("CLS") 
					|| moduleType.equalsIgnoreCase("BAS")) {
				modifierList.add("PUBLIC");
			}
		}
		modifierList.replaceAll(String::toUpperCase);
    	return modifierList;
	}
	
	
//	private List<String> getModifier(ParserRuleContext dclCtx) {
//		ExplicitDeclarationContext explicitCtx = (ExplicitDeclarationContext) NodeExplorer.getAncestorClass(dclCtx, ExplicitDeclarationContext.class.getSimpleName());
//		return st.getModifierMap().get(explicitCtx);
//	}
	
	private Scope getModuleScope() {
		return moduleScope;
	}
	
	private Scope getCurrentScope() {
		return scopes.peek();
	}
	
	private void pushScope(Scope scope) {
		 scopes.push(scope);
	}
	
	private void popScope() {
		 scopes.pop();
	}
	
	public static void main(String[] args) {
		// Parsing source file e generates AST
		PropertyList properties = new PropertyList();
		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\PREDEFINED_SYMBOLS\\PREDEFINED.BAS");
//		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\LANGUAGE.BAS");
//		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\GECOEX01.CLS");
//		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\RXGCMG01.BAS");
		
//		properties.addProperty("FILE_PATH", "C:\\workspace\\antlr\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\GEMVBAPI.BAS");
//		properties.addProperty("FILE_PATH", "C:\\workspace\\workspace_desenv_java8\\visualbasic6\\antlr4.vb6\\input\\R1PAB0\\GECOMS01.CLS");
// C:\workspace\antlr\language-implementation-patterns\src\test\resources\R1PAB0\R1FAB004.FRM
		VisualBasic6ParserCompUnit parser = new VisualBasic6ParserCompUnit(properties);
		System.err.println("Total time: " + parser.getElapsedTime());
		System.err.println("Total Errors: " + parser.getNumErrors());

		// walking AST
//		ParseTree tree = parser.getAstree();
		ParseTree tree = (ParseTree) parser.getProperties().mustProperty("ASTREE");
        ParseTreeWalker walker = new ParseTreeWalker();
        
        SymbolTable st = new SymbolTableVB6();
        properties.addProperty("SYMBOL_TABLE", st);

        VisualBasic6Module visualBasic6module = new VisualBasic6Module(properties);
        walker.walk(visualBasic6module, tree);        // walk parse tree 
        
        System.err.println("Module name: " + visualBasic6module.getModuleName());
        
//        System.err.println(st.toString());
        
        //---------------------  DEF PREDEFINED SYMBOL --------------------------

        VisualBasic6DefPredefinedSym visualBasic6DefPredefinedSym = new VisualBasic6DefPredefinedSym(properties);
        walker.walk(visualBasic6DefPredefinedSym, tree);        // walk parse tree 
        
        System.err.println(st.toString());
        
        System.err.println();
	}	
}