package learning.languageimplementationpatterns.core.visualbasic6;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.IdentifierContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParserBaseListener;
import br.com.recatalog.util.NodeExplorer;
import br.com.recatalog.util.PropertyList;
import learning.languageimplementationpatterns.core.ContextData;
import learning.languageimplementationpatterns.core.Scope;
import learning.languageimplementationpatterns.core.Symbol;
import learning.languageimplementationpatterns.core.SymbolFactory;
import learning.languageimplementationpatterns.core.SymbolTable;
import learning.languageimplementationpatterns.core.SymbolTableVB6;

public class VisualBasic6ResolveSymbol extends VisualBasic6CompUnitParserBaseListener {
	
	SymbolTable st;
	PropertyList properties;
	Deque<Scope> scopes;
	Scope moduleScope;
	Scope globalScope;
	ParseTree compUnitTree;
	SymbolFactory symbolFactory;
	Map<String,Integer> controlArrays;
	
	public VisualBasic6ResolveSymbol(PropertyList properties) {
		Map<String,Integer> controlArrays = new HashMap<>();

		this.properties = properties;
		this.st = (SymbolTable) this.properties.mustProperty("SYMBOL_TABLE");
		this.compUnitTree = (ParseTree) this.properties.mustProperty("ASTREE");
		symbolFactory = st.getSymbolFactory();
		scopes = new ArrayDeque<Scope>();
		globalScope = st.getGlobalScope();
		moduleScope = (Scope)st.getTreeToModule().get(compUnitTree);
	}
//
//	@Override
//	public void enterExprMemberAccessOp(VisualBasic6CompUnitParser.ExprMemberAccessOpContext ctx) {
//		System.err.println(ctx.getText() + " - line " + ctx.getStart().getLine());
//        ArrayList<ParseTree> ids = NodeExplorer.getDepthAllChildClass(ctx, IdentifierContext.class.getSimpleName());
//        for(ParseTree p : ids) {
//        	System.err.println("identifier :" + p.getText());
//        }
//	}
	
	@Override
	public void enterExpr(VisualBasic6CompUnitParser.ExprContext ctx) {
//		System.err.println(ctx.getText() + " -  expr line " + ctx.getStart().getLine());
//        ArrayList<ParseTree> ids = NodeExplorer.getDepthAllChildClass(ctx, IdentifierContext.class.getSimpleName());
//        for(ParseTree p : ids) {
//        	System.err.println("identifier :" + p.getText());
//        }
	}
	
	@Override
	public void enterExprMemberAccessOp(VisualBasic6CompUnitParser.ExprMemberAccessOpContext ctx) {
//		System.err.println(ctx.getText() + " -  exprMemberOp line " + ctx.getStart().getLine());
        List<ParseTree> identifierMember =  NodeExplorer.getDepthAllChildClass(ctx, IdentifierContext.class.getSimpleName());
        ParserRuleContext ctxIdentifierScope = (ParserRuleContext)identifierMember.get(0);
        ContextData ctxData = st.getContextData(ctxIdentifierScope);
		Scope scope = ctxData.getScope();
		PropertyList properties = new PropertyList();
        properties.addProperty("NAME_TO_RESOLVE",ctx.getText());
        properties.addProperty("MODULE_NAME",getModuleScope().getName());
        properties.addProperty("CONTEXT",ctx);

		Symbol sym = scope.resolve(properties);
		if(sym != null) {
//			System.err.println("Resolved symbol: " + ctx.getText() + " - " + sym.getName());
		}
		else {
//			System.err.println("Unresolved symbol: " + ctx.getText() );
		}
		
		//        ArrayList<ParseTree> ids = NodeExplorer.getDepthAllChildClass(ctx, IdentifierContext.class.getSimpleName());
//        for(ParseTree p : ids) {
//        	System.err.println("identifier :" + p.getText());
//        }
	}
	
	@Override
	public void enterIdentifier(VisualBasic6CompUnitParser.IdentifierContext ctx) {
//		System.err.println(ctx.getText() + " -  Identifier line " + ctx.getStart().getLine());
//        ArrayList<ParseTree> ids = NodeExplorer.getDepthAllChildClass(ctx, IdentifierContext.class.getSimpleName());
//        for(ParseTree p : ids) {
//        	System.err.println("identifier :" + p.getText());
//        }
	}	
	
	private Scope getModuleScope() {
		return moduleScope;
	}
	
	public static void main(String[] args) {

		// Parsing source file e generates AST
		PropertyList properties = new PropertyList();
//		properties.addProperty("FILE_PATH", "C:\\workspace\\antlr\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\R1FAB004.FRM");

		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\main\\resources\\input\\method_variable.frm");
//		properties.addProperty("FILE_PATH", "C:\\workspace\\workspace_desenv_java8\\visualbasic6\\antlr4.vb6\\input\\R1PAB0\\GECOMS01.CLS");
//		properties.addProperty("FILE_PATH", "C:\\workspace\\workspace_desenv_java8\\visualbasic6\\antlr4.vb6\\input\\R1PAB0\\GECOEX01.CLS");

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

        VisualBasic6ResolveSymbol visualBasic6ResolveSymbol = new VisualBasic6ResolveSymbol(properties);
        walker.walk(visualBasic6ResolveSymbol, tree);        // walk parse tree 
        
	}	
}