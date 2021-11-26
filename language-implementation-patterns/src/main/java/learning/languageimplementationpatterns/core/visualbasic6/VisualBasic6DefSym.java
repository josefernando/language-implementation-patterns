package learning.languageimplementationpatterns.core.visualbasic6;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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

public class VisualBasic6DefSym extends VisualBasic6CompUnitParserBaseListener {
	
	SymbolTable st;
	PropertyList properties;
	Deque<Scope> scopes;
	Scope moduleScope;
	Scope globalScope;
	ParseTree compUnitTree;
	SymbolFactory symbolFactory;
	Map<String,Integer> controlArrays;
	Language language;
	
	public VisualBasic6DefSym(PropertyList properties) {
		
//		Map<String,Integer> controlArrays = new HashMap<String,Integer>();

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
	
	// Marca escopo para ser utilizado na resolução em VisualBasic6Resolve
	@Override
	public void enterIdentifier(VisualBasic6CompUnitParser.IdentifierContext ctx) {
		ContextData contextData = new ContextData(ctx);
		contextData.setScope(getCurrentScope());
	}

	@Override
	public void enterModifier(VisualBasic6CompUnitParser.ModifierContext ctx) {
		ParserRuleContext explicitDeclarationCtx = NodeExplorer.getAncestorClass(ctx, ExplicitDeclarationContext.class.getSimpleName());
		List<String> modifierList = st.getModifierMap().get(explicitDeclarationCtx);
		if(modifierList == null) {
			modifierList = new ArrayList<>();
			st.getModifierMap().put(explicitDeclarationCtx, modifierList);
		}
//		else {
//			BicamSystem.printLog("DEBUG"
//					, "Modifiers: " 
//							+ modifierList.get(0) 
//							+ "," 
//							+ ctx.getText() + " , module: "
//							+ moduleScope.getName() + " ,na linha: "
////							+ ((Symbol)moduleScope).getContext().getStart().getLine());
//							+ ctx.getStart().getLine());
//		}
		modifierList.add(ctx.getText());
	}	
	
	@Override
	public void enterMethodDefStmt(VisualBasic6CompUnitParser.MethodDefStmtContext ctx) {
		String name = ctx.Name.getText();
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "PROCEDURE_" + ctx.Type.getText().toUpperCase().replaceAll(" ", "_"));
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
		if(ctx.asTypeClause() != null) {
			symbolProperties.addProperty("TYPE", ctx.asTypeClause().type().getText());
		}
		symbolProperties.addProperty("MODIFIER", getModifier(ctx));
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");           // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "PROCEDURE");          // 
		symbolProperties.addProperty("SUB_CATEGORY", ctx.Type.getText().toUpperCase());
		symbolProperties.addProperty("NAME", name);
		symbolProperties.addProperty("LANGUAGE", language);
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		
		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);	
		
		pushScope(scopeMethod);
	}
	
	@Override
	public void enterLabel(VisualBasic6CompUnitParser.LabelContext ctx) {
		String name =  ctx.LABEL().getText().replace(":", "");
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "LABEL");
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");           // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "LABEL");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "NAME");
		symbolProperties.addProperty("NAME", name);
		symbolProperties.addProperty("LANGUAGE", language);
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		
		Symbol sym = symbolFactory.getSymbol(symbolFactoryProperties);	
		

		st.addContextData(ctx);
		st.getContextData(ctx).setSymbol(sym);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.addDefinedSymbol(sym);
	}
	
	@Override
	public void enterLineNumber(VisualBasic6CompUnitParser.LineNumberContext ctx) {
		String number = ctx.LINENUMBER().getText();
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "LABEL_LINE_NUMBER");
		
		PropertyList symbolProperties = new PropertyList();              // usado para cria os simbolos
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");           // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "LABEL");              // 
		symbolProperties.addProperty("SUB_CATEGORY", "LINE_NUMBER");
		symbolProperties.addProperty("NAME", number);
		symbolProperties.addProperty("LANGUAGE", language);
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		
		Symbol sym = symbolFactory.getSymbol(symbolFactoryProperties);	

		st.addContextData(ctx);
		st.getContextData(ctx).setSymbol(sym);
		st.getContextData(ctx).setScope(getCurrentScope());
		
		st.addDefinedSymbol(sym);
	}

	@Override
	public void exitMethodDefStmt(VisualBasic6CompUnitParser.MethodDefStmtContext ctx) {
		popScope();
	}

	@Override
	public void enterFormalParameter(VisualBasic6CompUnitParser.FormalParameterContext ctx) {
		VariableStmtContext varCtx = (VariableStmtContext) NodeExplorer.getChildClass(ctx, "VariableStmtContext");
		createVariableSymbol(varCtx);
	}	

	@Override
	public void exitFormalParameter(VisualBasic6CompUnitParser.FormalParameterContext ctx) {
	}

	@Override
	public void enterVariableDeclaration(VisualBasic6CompUnitParser.VariableDeclarationContext ctx) {
		VariableStmtContext varCtx = (VariableStmtContext) NodeExplorer.getChildClass(ctx, "VariableStmtContext");
		createVariableSymbol(varCtx);
	}		
	
	@Override
	public void enterDeclareStmt(VisualBasic6CompUnitParser.DeclareStmtContext ctx) {
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "DECLARED_" + ctx.methodType().getText().toUpperCase());
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("NAME", ctx.Name.getText());
		symbolProperties.addProperty("SYMBOL_TYPE", "DECLARED_" + ctx.methodType().getText().toUpperCase());
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
		if(ctx.asTypeClause() != null) {
			symbolProperties.addProperty("TYPE", ctx.asTypeClause().getText());
		}
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "DECLARED");          // 
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
        
        pushScope(scope);
	}
	
	@Override
	public void exitDeclareStmt(VisualBasic6CompUnitParser.DeclareStmtContext ctx) {
		popScope();
	}

	@Override
	public void enterFormDefinitionBlock(VisualBasic6CompUnitParser.FormDefinitionBlockContext ctx) {
			
			PropertyList symbolFactoryProperties = new PropertyList();
			PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
			symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);

			if(ctx.Type.getText().equalsIgnoreCase("VB.FORM")) {
				symbolFactoryProperties.addProperty("SYMBOL_TYPE", "FORM");
				symbolProperties.addProperty("SCOPE", globalScope);
			}
			else { 
				symbolFactoryProperties.addProperty("SYMBOL_TYPE", "FORM_CONTROL");
				symbolProperties.addProperty("SCOPE", moduleScope);
			}
			
			symbolProperties.addProperty("NAME", ctx.Name.getText());

			symbolProperties.addProperty("ENCLOSING_SCOPE", getCurrentScope());

			symbolProperties.addProperty("CONTEXT", ctx);
			symbolProperties.addProperty("TYPE", ctx.Type.getText());
			symbolProperties.addProperty("DEF_MODE", "EXPLICIT");         // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
			symbolProperties.addProperty("CATEGORY", "GUI");          // 
			symbolProperties.addProperty("SUB_CATEGORY", ctx.Type.getText());
			symbolProperties.addProperty("LANGUAGE", language);

			Scope scope = (Scope)symbolFactory.getSymbol(symbolFactoryProperties);
			Symbol sym = (Symbol)scope;
			
			st.addContextData(ctx.Type);
			st.addContextData(ctx);
			st.getContextData(ctx).setSymbol(sym);
			st.getContextData(ctx).setScope(getCurrentScope());	
			
			pushScope(scope);
	}	

	@Override
	public void exitFormDefinitionBlock(VisualBasic6CompUnitParser.FormDefinitionBlockContext ctx) {
		popScope();
	}	

	@Override
	public void enterGuiAttribute(VisualBasic6CompUnitParser.GuiAttributeContext ctx) {
		getCurrentScope().getProperties()
			.addProperty(ctx.Property.getText(), ctx.Value.getText());
		
		if(ctx.Property.getText().equalsIgnoreCase("Index")) {
			BicamSystem.printLog("DEBUG", "MÓDULO: " + getModuleScope().getName());
			BicamSystem.printLog("DEBUG", "CONTROLES DE FORM COM O MESM O NOME");
		}
	}

	@Override
	public void enterGuiProperty(VisualBasic6CompUnitParser.GuiPropertyContext ctx) {
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "GUI_PROPERTY");
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);

		symbolProperties.addProperty("NAME", ctx.Name.getText());
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");         // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "GUI");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "GUI_PROPERTY");
		symbolProperties.addProperty("LANGUAGE", language);

		Scope scope = (Scope)symbolFactory.getSymbol(symbolFactoryProperties);
		
		if(ctx.curlyLiteral() != null) {
			scope.getProperties().addProperty("CHAVE", ctx.curlyLiteral().getText());
		}
		
		getCurrentScope().getProperties()
			.addProperty(ctx.Name.getText(), scope);
		
		pushScope(scope);		
	}

	@Override
	public void exitGuiProperty(VisualBasic6CompUnitParser.GuiPropertyContext ctx) {
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
		symbolProperties.addProperty("CONTEXT", ctx);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "STRUCTURE");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "TYPE");
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);	
		pushScope(scopeMethod);		
		
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		Map<String,Scope> scopes = new HashMap<>();
		scopes.put("PARENT_SCOPE", getCurrentScope());
		scopes.put("SCOPE", getModuleScope());

		for(ParseTree var : variables) {
			createVariableSymbol((VariableStmtContext)var, scopes);
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
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("NAME", name);
		symbolProperties.addProperty("SYMBOL_TYPE", "ENUM");
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "ENUM");          // 
		symbolProperties.addProperty("SUB_CATEGORY", null);
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);	
		pushScope(scopeMethod);		
		
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		for(ParseTree var : variables) {
			createVariableSymbol((VariableStmtContext)var);
		}
	}
	
	@Override
	public void exitEnumDefStmt(VisualBasic6CompUnitParser.EnumDefStmtContext ctx) {
		popScope();
	}
	

	@Override
	public void enterEventDefStmt(VisualBasic6CompUnitParser.EventDefStmtContext ctx) {
		
		String name = ctx.Name.getText();
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "EVENT");
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("NAME", name);
		symbolProperties.addProperty("SYMBOL_TYPE", "EVENT");
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "EVENT");          // 
		symbolProperties.addProperty("SUB_CATEGORY", null);
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);	
		pushScope(scopeMethod);		
		
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		for(ParseTree var : variables) {
			createVariableSymbol((VariableStmtContext)var);
		}
	}
	
	@Override
	public void exitEventDefStmt(VisualBasic6CompUnitParser.EventDefStmtContext ctx) {
		popScope();
	}	
	
	private void createVariableSymbol(VariableStmtContext varCtx, Map<String,Scope> ..._scopes) {
		String name = varCtx.Name.getText();
		
		if(   name.endsWith("!")
		   || name.endsWith("@")
		   || name.endsWith("#")
		   || name.endsWith("$")
		   || name.endsWith("%")
		   || name.endsWith("&")) {
			name = name.substring(0,name.length()-1);
		}
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "VARIABLE_FORMAL_PARAMETER");
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);

		symbolProperties.addProperty("NAME", name);
		
		if(_scopes.length > 0) {
			Map<String,Scope> scopes = _scopes[0];
			for(Entry<String,Scope> entry : scopes.entrySet()) {
				symbolProperties.addProperty(entry.getKey(), entry.getValue());
			}
		}
		else {
			symbolProperties.addProperty("SCOPE", getCurrentScope());
		}
		
		symbolProperties.addProperty("CONTEXT", varCtx);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "VARIABLE");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "FORMAL_PARAMETER");
		
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
		
		FieldLengthContext fieldLengthCtx = varCtx.fieldLength();
		if(fieldLengthCtx != null) {
			symbolProperties.addProperty("FIELD_LENGTH", fieldLengthCtx.getText());
		}		
				
		InitialValueContext initialValueCtx = varCtx.initialValue();
		if(initialValueCtx != null) {
			symbolProperties.addProperty("INIT_VALUE"
					       , initialValueCtx.getText().substring(1)); // ignora o "="
		}
		
		Symbol sym = symbolFactory.getSymbol(symbolFactoryProperties);
		
//		ArrayList<ParseTree> identifierCtxList = NodeExplorer.getDepthAllChildClass(varCtx, IdentifierContext.class.getSimpleName());
		ParserRuleContext identifierCtx = (ParserRuleContext) NodeExplorer.getDepthFirstChildClass(varCtx, IdentifierContext.class.getSimpleName());

//		if(identifierCtxList.size() == 1) {
//			ParserRuleContext identifierCtx = (ParserRuleContext) identifierCtxList.get(0);
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
	
	private List<String> getModifier(ParserRuleContext dclCtx) {
		ExplicitDeclarationContext explicitCtx = (ExplicitDeclarationContext) NodeExplorer.getAncestorClass(dclCtx, ExplicitDeclarationContext.class.getSimpleName());
		return st.getModifierMap().get(explicitCtx);
	}
	
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
//		properties.addProperty("FILE_PATH", "C:\\workspace\\antlr\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\R1FAB004.FRM");
//		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\GECOEX01.CLS");
		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\RXGCMG01.BAS");
		
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
        
        //---------------------  DEF SYMBOL --------------------------

        VisualBasic6DefSym visualBasic6DefSym = new VisualBasic6DefSym(properties);
        walker.walk(visualBasic6DefSym, tree);        // walk parse tree 
        
        System.err.println(st.toString());
        
        System.err.println();
        
        for(Entry<Symbol,ContextData> e : st.getWhereDefined().entrySet()) {
        	System.err.println("Symbol: " + e.getKey().getName()
        			           + e.getKey().location());
//        	System.err.println("---- context data");
//        	System.err.println(e.getValue().toString());
        }
	}	
	
//	public static void runDefSymbol(PropertyList Properties) {
//		ParseTree astree = (ParseTree)Properties.mustProperty("ASTREE");
//		SymbolTableBuilder st = (SymbolTableBuilder)Properties.mustProperty("SYMBOL_TABLE");
//
//		VisualBasic6DefSymCompUnit defVisualBasic6CompUnit = new VisualBasic6DefSymCompUnit(Properties);
//        ParseTreeWalker walker = new ParseTreeWalker();
//        walker.walk(defVisualBasic6CompUnit, astree);        // walk parse tree 
//        
//        System.err.println(st.getGlobalScope().toString());		
//	}
//	
//	public  static void main(String[] args) {
//		PropertyList props = new PropertyList();
//		props.addProperty("FILE_PATH", "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
//        System.err.println("Parsing: " + "C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
//		VisualBasic6ParserCompUnit parseVb6CompUnit = new VisualBasic6ParserCompUnit(props);
//		
//		SymbolTableBuilder st = new SymbolTableBuilder(new LanguageVb6());
//		PropertyList defProp = new PropertyList();
//		defProp.addProperty("FILE_PATH", parseVb6CompUnit.getFilePath());
//		defProp.addProperty("SYMBOL_TABLE", st);
//		defProp.addProperty("ASTREE", parseVb6CompUnit.getAstree());
//
//		VisualBasic6DefSymCompUnit defVisualBasic6CompUnit = new VisualBasic6DefSymCompUnit(defProp);
//        ParseTreeWalker walker = new ParseTreeWalker();
//        walker.walk(defVisualBasic6CompUnit, parseVb6CompUnit.getAstree());        // walk parse tree 
//        
//        System.err.println(st.getGlobalScope().toString());	
//	}
}