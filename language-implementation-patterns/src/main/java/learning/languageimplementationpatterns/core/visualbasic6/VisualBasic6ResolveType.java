package learning.languageimplementationpatterns.core.visualbasic6;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser.IdentifierContext;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParserBaseListener;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.NodeExplorer;
import br.com.recatalog.util.PropertyList;
import learning.languageimplementationpatterns.core.Scope;
import learning.languageimplementationpatterns.core.Symbol;
import learning.languageimplementationpatterns.core.SymbolFactory;
import learning.languageimplementationpatterns.core.SymbolTable;
import learning.languageimplementationpatterns.core.SymbolTableVB6;
import learning.languageimplementationpatterns.core.Type;

public class VisualBasic6ResolveType extends VisualBasic6CompUnitParserBaseListener {
	
	SymbolTable st;
	PropertyList properties;
	Deque<Scope> scopes;
	Scope moduleScope;
	Scope globalScope;
	ParseTree compUnitTree;
	SymbolFactory symbolFactory;
	Map<String,Integer> controlArrays;
	
	public VisualBasic6ResolveType(PropertyList properties) {
		Map<String,Integer> controlArrays = new HashMap<>();

		this.properties = properties;
		this.st = (SymbolTable) this.properties.mustProperty("SYMBOL_TABLE");
		this.compUnitTree = (ParseTree) this.properties.mustProperty("ASTREE");
		symbolFactory = st.getSymbolFactory();
		scopes = new ArrayDeque<Scope>();
		globalScope = st.getGlobalScope();
		moduleScope = (Scope)st.getTreeToModule().get(compUnitTree);
	}

	@Override
	public void enterFormDefinitionBlock(VisualBasic6CompUnitParser.FormDefinitionBlockContext ctx) {
		Scope scope = st.getContextData(ctx).getScope();
		Symbol sym = st.getContextData(ctx).getSymbol();
		String NAME_TO_RESOLVE = (String) sym.getProperty("TYPE");
		PropertyList prop = new PropertyList();
		prop.addProperty("NAME_TO_RESOLVE", NAME_TO_RESOLVE);

		Type typeSymbol = (Type) scope.resolve(prop);
		
		if(typeSymbol == null) {
			BicamSystem.printLog("WARNING", "Symbol not found: " + NAME_TO_RESOLVE);
		}
		
		sym.setTypeSymbol(typeSymbol);
		
		ArrayList<ParseTree> typeListCtx = NodeExplorer.getDepthAllChildClass(((Symbol)typeSymbol).getContext(), IdentifierContext.class.getSimpleName());
		
		
		// ... continuar daqui 
		for(ParseTree ptree : typeListCtx) {
			ParserRuleContext prCtx = (ParserRuleContext)ptree;
			st.addUsedSymbol(sym, prCtx);
			sym.addUsedSymbol(prCtx);
		}
	}
	
	@Override
	public void enterVariableStmt(VisualBasic6CompUnitParser.VariableStmtContext ctx) {
		if(st.getContextData(ctx) == null) {
			BicamSystem.printLog("WARNING", " Conxtext Data not defined"
					           + " module: " + getModuleScope().getName()
					           + " na linha " + ctx.getStart().getLine());
			return;
		}
		
		Scope scope = st.getContextData(ctx).getScope();
		Symbol sym = st.getContextData(ctx).getSymbol();
		
		if(sym.getProperties().hasProperty("TYPE")){
			String NAME_TO_RESOLVE = (String) sym.getProperty("TYPE");
			PropertyList prop = new PropertyList();
			prop.addProperty("NAME_TO_RESOLVE", NAME_TO_RESOLVE);
			
			Type type = (Type) scope.resolve(prop);
			
			if(type == null) {
				BicamSystem.printLog("WARNING", "Symbol not found: " + NAME_TO_RESOLVE);
			}
			
			sym.setTypeSymbol(type);
		}
		else if(sym.getProperties().hasProperty("INIT_VALUE")) {
			Type type = typeCalculation((String)sym.getProperties().getProperty("INIT_VALUE"),  scope);
			if(type != null) {
				BicamSystem.printLog("DEBUG", "Symbol type, calculated from initial Value: " + sym.getName()
	            + "  module: " + getModuleScope().getName()
	            + "  linha: " + ctx.getStart().getLine()
				+ "  initial value: " + sym.getProperties().getProperty("INIT_VALUE")
				+ "  type caculaded: " + type.getName());
			}
			else {
				BicamSystem.printLog("DEBUG", "Symbol has no type, but has initial value without type: " + sym.getName()
	            + "  module: " + getModuleScope().getName()
	            + "  linha: " + ctx.getStart().getLine()
				+ "  initial value: " + sym.getProperties().getProperty("INIT_VALUE"));
			}
		}
		else {
			BicamSystem.printLog("DEBUG", "Symbol has no type: " + sym.getName()
			                     + "  module: " + getModuleScope().getName()
			                     + "  linha: " + ctx.getStart().getLine());
		}
	}
	
	private Type typeCalculation(String _type, Scope _scope) {
		if(isString( _type)) {
			PropertyList prop = new PropertyList();
			prop.addProperty("NAME_TO_RESOLVE", "String");
			return (Type) _scope.resolve(prop);
		}
		else if (isInteger( _type)) {
			PropertyList prop = new PropertyList();
			prop.addProperty("NAME_TO_RESOLVE", "Integer");
			return (Type) _scope.resolve(prop);			
		}
//		else if (isBoolean( _type)) {
//			PropertyList prop = new PropertyList();
//			prop.addProperty("NAME_TO_RESOLVE", "Boolean");
//			return (Type) _scope.resolve(prop);				
//		}
		else if (isBoolean( _type)) {
			PropertyList prop = new PropertyList();
			prop.addProperty("NAME_TO_RESOLVE", "Boolean");
			return (Type) _scope.resolve(prop);				
		}
		return null;
	}
	
	private boolean isString(String _type) {
		if(_type.startsWith("\"") && _type.endsWith("\"")) {
			return true;
		}
		return false;
	}
	
	// do exemplo: https://stackoverflow.com/questions/5439529/determine-if-a-string-is-an-integer-in-java
	public  boolean isInteger(String s) {
	    if(s.isEmpty()) return false;
	    for(int i = 0; i < s.length(); i++) {
	        if(i == 0 && s.charAt(i) == '-') {
	            if(s.length() == 1) return isHexadecimal(s);
	            else continue;
	        }
	        if(Character.digit(s.charAt(i),10) < 0) return isHexadecimal(s);
	    }
	    return true;
	}	
	
	private  boolean isHexadecimal(String _type) {
		if(_type.startsWith("&H")) {
			return true;
		}
		return false;
	}	
	
	private boolean isBoolean(String _type) {
		return Pattern.compile(Pattern.quote("Or"), Pattern.CASE_INSENSITIVE).matcher(_type).find();
	}	
	
	private Scope getModuleScope() {
		return moduleScope;
	}
	
	public static void main(String[] args) {

		// Parsing source file e generates AST
		PropertyList properties = new PropertyList();
//		properties.addProperty("FILE_PATH", "C:\\workspace\\antlr\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\R1FAB004.FRM");

		properties.addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\R1PAB0\\GEMVBAPI.BAS");
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

        
        //---------------------  DEF SYMBOL --------------------------

        VisualBasic6DefSym visualBasic6DefSym = new VisualBasic6DefSym(properties);
        walker.walk(visualBasic6DefSym, tree);        // walk parse tree 
        
 //       System.err.println(st.toString());
        
        //---------------------  RESOLVE_TYPE SYMBOL --------------------------

        VisualBasic6ResolveType visualBasic6ResolveType = new VisualBasic6ResolveType(properties);
        walker.walk(visualBasic6ResolveType, tree);        // walk parse tree 
        
        System.err.println(st.toString());        

	}	
}