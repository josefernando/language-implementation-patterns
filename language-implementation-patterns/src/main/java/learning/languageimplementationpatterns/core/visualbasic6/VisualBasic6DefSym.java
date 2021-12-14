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
	// Porque no exit? : nas definições os identificadores são marcados com o
	// contextData. Se um identificador na saída não estiver marcado com o contextData significa
	// que não pertence a nenhuma definição e por isso não foi marcado.
	@Override
	public void exitIdentifier(VisualBasic6CompUnitParser.IdentifierContext ctx) {
		ContextData contextData = st.getContextData(ctx);
		if(contextData == null) {
			contextData = st.addContextData(ctx);
			contextData.setScope(getCurrentScope());
		}
	}

	@Override
	public void enterModifier(VisualBasic6CompUnitParser.ModifierContext ctx) {
// (explicitDeclaration (variableDeclaration (modifier (scopeModifier Global)) (variableList (variableStmt (identifier Achou%)))))		
		ParserRuleContext ctxExplicitDeclaration = NodeExplorer.getAncestorClass(ctx, ExplicitDeclarationContext.class.getSimpleName());
		List<String> modifierList = st.getModifierMap().get(ctxExplicitDeclaration);
		if(modifierList == null) {
			modifierList = new ArrayList<>();
			st.getModifierMap().put(ctxExplicitDeclaration, modifierList);
		}
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

		st.addContextData(ctx);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.getContextData(ctx).setSymbol((Symbol)scopeMethod);
		st.addDefinedSymbol((Symbol)scopeMethod);	
		
		// Marca identifier com o contextData
		st.addContextData((ParserRuleContext)ctx.Name.getRuleContext());
		st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setScope(getCurrentScope());
		st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setSymbol((Symbol)scopeMethod);

		pushScope(scopeMethod);
	}
	

	@Override
	public void exitMethodDefStmt(VisualBasic6CompUnitParser.MethodDefStmtContext ctx) {
		popScope();
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
			symbolProperties.addProperty("TYPE", ctx.asTypeClause().type().getText());
		}
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
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
		
		st.addContextData((ParserRuleContext)ctx.Name.getRuleContext());
		st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setScope(getCurrentScope());
		st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setSymbol((Symbol)scope);
        
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
			symbolProperties.addProperty("CATEGORY", "FORM");          // 
			symbolProperties.addProperty("SUB_CATEGORY", ctx.Type.getText());
			symbolProperties.addProperty("LANGUAGE", language);

			Scope scope = (Scope)symbolFactory.getSymbol(symbolFactoryProperties);
			Symbol sym = (Symbol)scope;
			
			st.addContextData(ctx.Type);
			st.addContextData(ctx);
			st.getContextData(ctx).setSymbol(sym);
			st.getContextData(ctx).setScope(getCurrentScope());	
			st.addDefinedSymbol(sym);
			
			st.addContextData((ParserRuleContext) ctx.Name.getRuleContext());
			st.getContextData((ParserRuleContext) ctx.Name.getRuleContext()).setScope((Scope)sym);
			st.getContextData((ParserRuleContext) ctx.Name.getRuleContext()).setSymbol(sym);

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
//			BicamSystem.printLog("DEBUG", "MÓDULO: " + getModuleScope().getName());
//			BicamSystem.printLog("DEBUG", "CONTROLES DE FORM COM O MESMO (ARRAY): " + getCurrentScope().getName() );
			Integer attributeLen = Integer.parseInt(ctx.Value.getText());
			Integer actualLen = 0;
			if(getCurrentScope().getProperties().getProperty("ARRAY") != null) {
				actualLen =  Integer.parseInt((String)getCurrentScope().getProperties().getProperty("ARRAY"));
			}
            
			if(attributeLen > actualLen)
				getCurrentScope().getProperties().addProperty("ARRAY", ctx.Value.getText());
		}
	}

	// GuiProperty, exemplo: "Font" definido como escopo
	// para acomodar mais facilmente as propriedades, como no caso de "Font"
	
	@Override
	public void enterGuiProperty(VisualBasic6CompUnitParser.GuiPropertyContext ctx) {
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "GUI_PROPERTY");
		
		PropertyList symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);

		symbolProperties.addProperty("NAME", ctx.Name.getText());
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("CONTEXT", ctx);
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
		
		// property "SCOPE" pode ser substituido dependendo se é "Public" ou não
		symbolProperties.addProperty("SCOPE", getCurrentScope());
		symbolProperties.addProperty("ENCLOSING_SCOPE", getCurrentScope());

		if(modifierScope(ctx).indexOf("PUBLIC") > -1
				|| modifierScope(ctx).indexOf("GLOBAL") > -1) {
			symbolProperties.addProperty("SCOPE", globalScope);
		}
		
		symbolProperties.addProperty("CONTEXT", ctx);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY","TYPE");           // 
		symbolProperties.addProperty("SUB_CATEGORY", "STRUCTURE");
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

		Symbol symbolType = symbolFactory.getSymbol(symbolFactoryProperties);
		
		st.addContextData(ctx);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.getContextData(ctx).setSymbol(symbolType);
		st.addDefinedSymbol(symbolType);
		
		// Não tem modifier : Public, Static, Private ...
		if(ctx != ctx.Name.getRuleContext()) {
			st.addContextData((ParserRuleContext)ctx.Name.getRuleContext());
			st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setScope(getCurrentScope());
			st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setSymbol(symbolType);
		}
		pushScope((Scope)symbolType);		
		
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());

		PropertyList createVariableProperties = new PropertyList();
		createVariableProperties.addProperty("PARENT_SCOPE", getCurrentScope());
		createVariableProperties.addProperty("CATEGORY", "VARIABLE");          
		createVariableProperties.addProperty("SUB_CATEGORY", "TYPE_MEMBER");

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
		symbolProperties.addProperty("CONTEXT", ctx);
		
		// property "SCOPE" pode ser substituido dependendo se é "Public" ou não
		symbolProperties.addProperty("SCOPE", getCurrentScope());

		if(modifierScope(ctx).indexOf("PUBLIC") > -1
				|| modifierScope(ctx).indexOf("GLOBAL") > -1) {
			symbolProperties.addProperty("SCOPE", globalScope);
		}

		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "TYPE");          
		symbolProperties.addProperty("SUB_CATEGORY", "ENUM");
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

		Symbol scopeEnum = symbolFactory.getSymbol(symbolFactoryProperties);	
		
		st.addContextData(ctx);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.getContextData(ctx).setSymbol(scopeEnum);
		st.addDefinedSymbol(scopeEnum);
		
		// veja definição de Type
		if(ctx != ctx.Name.getRuleContext()) {
			st.addContextData((ParserRuleContext)ctx.Name.getRuleContext());
			st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setScope(getCurrentScope());
			st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setSymbol(scopeEnum);
		}
		
		pushScope((Scope)scopeEnum);		
		
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		PropertyList varProperties = new PropertyList();
		varProperties.addProperty("PARENT_SCOPE", getCurrentScope());
		varProperties.addProperty("SCOPE", getModuleScope());
		varProperties.addProperty("CATEGORY", "VARIABLE");          
		varProperties.addProperty("SUB_CATEGORY", "ENUM_MEMBER");
		
		// valor default atribuído aos membros enumerations
		Integer enumValue = 0;
		for(ParseTree var : variables) {
			varProperties.addProperty("INIT_VALUE",enumValue++);
			createVariableSymbol((VariableStmtContext)var, varProperties);
		}
	}
	
	@Override
	public void exitEnumDefStmt(VisualBasic6CompUnitParser.EnumDefStmtContext ctx) {
		popScope();
	}
	
	// Exemplo
	// https://www.developer.com/microsoft/visual-basic/declaring-and-raising-events-in-visual-basic-6/
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
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "EVENT");          // 
		symbolProperties.addProperty("SUB_CATEGORY", null);
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		symbolProperties.addProperty("LANGUAGE", language);

		Scope scopeMethod = (Scope) symbolFactory.getSymbol(symbolFactoryProperties);	
		
		st.addContextData(ctx);
		st.getContextData(ctx).setScope(getCurrentScope());
		st.getContextData(ctx).setSymbol((Symbol)scopeMethod);
		st.addDefinedSymbol((Symbol)scopeMethod);	
		
		// Veja definição de Type
		if(ctx != ctx.Name.getRuleContext()) {
			st.addContextData((ParserRuleContext)ctx.Name.getRuleContext());
			st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setScope(getCurrentScope());
			st.getContextData((ParserRuleContext)ctx.Name.getRuleContext()).setSymbol((Symbol)scopeMethod);
		}
		
		pushScope(scopeMethod);		
		
		// Declaração de formal parameters
		List<ParseTree> variables = NodeExplorer.getDepthAllChildClass(ctx, VariableStmtContext.class.getSimpleName());
		
		for(ParseTree var : variables) {
			createVariableSymbol((VariableStmtContext)var, new PropertyList());
		}
	}
	
	@Override
	public void exitEventDefStmt(VisualBasic6CompUnitParser.EventDefStmtContext ctx) {
		popScope();
	}	
	
	@Override
	public void enterIdentifier(VisualBasic6CompUnitParser.IdentifierContext ctx) {
		if(st.getContextData(ctx) == null) {
			st.addContextData(ctx);
			st.getContextData(ctx).setScope(getCurrentScope());
		}
	}	
	
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
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
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
				symbolProperties.addProperty("TYPE_CLAUSE", "IMPLICIT");
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
		
		//Os context de varCtx e VarCtx.Name são iguais quando o identificador é o
		// primeiro element da definicação da variável. 
		// Exemplo:  "var_A As Integer" e não quando "dim var_A As Integer"
		if(varCtx.getRuleContext() != varCtx.Name.getRuleContext()) {
			st.addContextData((ParserRuleContext)varCtx.Name.getRuleContext());
			st.getContextData((ParserRuleContext)varCtx.Name.getRuleContext()).setScope(getCurrentScope());
			st.getContextData((ParserRuleContext)varCtx.Name.getRuleContext()).setSymbol(sym);
		}
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
			if(moduleType.equalsIgnoreCase("BAS")) {
				modifierList.add("PUBLIC");
			}
		}
		modifierList.replaceAll(String::toUpperCase);
    	return modifierList;
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
		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\R1FAB004.FRM");
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
        
        //---------------------  DEF SYMBOL --------------------------

        VisualBasic6DefSym visualBasic6DefSym = new VisualBasic6DefSym(properties);
        walker.walk(visualBasic6DefSym, tree);        // walk parse tree 
        
        System.err.println(st.toString());
        
        System.err.println();
        
//        for(Entry<Symbol,ContextData> e : st.getWhereDefined().entrySet()) {
//        	System.err.println("Symbol: " + e.getKey().getName()
//        			           + e.getKey().location());
////        	System.err.println("---- context data");
////        	System.err.println(e.getValue().toString());
//        }
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