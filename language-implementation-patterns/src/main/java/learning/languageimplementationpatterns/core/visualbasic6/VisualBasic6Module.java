package learning.languageimplementationpatterns.core.visualbasic6;

import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParserBaseListener;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.PropertyList;
import learning.languageimplementationpatterns.core.Symbol;
import learning.languageimplementationpatterns.core.SymbolTable;
import learning.languageimplementationpatterns.core.SymbolTableVB6;

public class VisualBasic6Module extends VisualBasic6CompUnitParserBaseListener {
	 PropertyList properties;
	 private String moduleName;
	 private SymbolTable st;
	 
	 public VisualBasic6Module(PropertyList _properties) {
		 this.properties = _properties;
		 this.st = (SymbolTable) _properties.mustProperty("SYMBOL_TABLE");
	 }
	 
	 public VisualBasic6Module() {
		 this.properties = new PropertyList();
	 }
	 
	 public PropertyList getProperties() {
		 return properties;
	 }
	 
	 public String getModuleName() {
		 return (String)properties.mustProperty("NAME");
	 }
	
	public void enterAttributeStmt(VisualBasic6CompUnitParser.AttributeStmtContext ctx) {
		if(ctx.Name.getText().equalsIgnoreCase("VB_NAME")) {
			moduleName = ctx.Values.getText().replace("\"", "");
		}
	}
	
	public void exitStartRule(VisualBasic6CompUnitParser.StartRuleContext ctx) {
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TABLE", st);

		if(moduleName == null) {
			BicamSystem.printLog("ERROR", "Module name not found on source file: " 
		                          + properties.getProperty("FILE_PATH"));
		}
		else {
			properties.addProperty("NAME", moduleName);
		}
		
		if(((String)properties.mustProperty("FILE_PATH")).toUpperCase().endsWith("CLS")) {
			properties.addProperty("MODULE_TYPE", "CLS");
			symbolFactoryProperties.addProperty("SYMBOL_TYPE", "MODULE_CLS");
		}
		if(((String)properties.mustProperty("FILE_PATH")).toUpperCase().endsWith("FRM")) {
			properties.addProperty("MODULE_TYPE", "FRM");
			symbolFactoryProperties.addProperty("SYMBOL_TYPE", "MODULE_FRM");
		}
		if(((String)properties.mustProperty("FILE_PATH")).toUpperCase().endsWith("BAS")) {
			properties.addProperty("MODULE_TYPE", "BAS");
			symbolFactoryProperties.addProperty("SYMBOL_TYPE", "MODULE_BAS");

		}
		
		PropertyList symbolProperties = properties;
		symbolProperties.addProperty("SCOPE", st.getGlobalScope());
		symbolProperties.addProperty("CONTEXT", null);
		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "EXPLICIT");     // IMPLICIT, EXPLICIT, BUILTIN
		symbolProperties.addProperty("CATEGORY", "MODULE");        // TYPE, LIB, CLASS
		symbolProperties.addProperty("SUB_CATEGORY", "APPLICATION");  // SYSTEM	
		symbolProperties.addProperty("NAME", moduleName);
		symbolProperties.addProperty("LANGUAGE", st.getProperties().getProperty("LANGUAGE"));


		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		Symbol sym = st.getSymbolFactory().getSymbol(symbolFactoryProperties);
		st.addModuleToTree(moduleName, (ParseTree)properties.getProperty("ASTREE"));
		st.addTreeToModule((ParseTree)properties.getProperty("ASTREE"), sym);
	}
	
	public static void main(String[] args) {

		// Parsing source file e generates AST
		PropertyList properties = new PropertyList();
		properties.addProperty("FILE_PATH", "C:\\workspace\\workspace_desenv_java8\\visualbasic6\\antlr4.vb6\\input\\R1PAB0\\GECOMS01.CLS");
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
        
        st.addModuleToTree(visualBasic6module.getModuleName(), tree);
        
        st.getModuleToTree().get(visualBasic6module.getModuleName());
        
        System.err.println("Symbol recuperado: " + st.getTreeToModule().get(tree).getName());
        
        System.err.println(properties.toString());
        
        System.err.println(st.getTreeToModule());
        System.err.println(st.getModuleToTree());
        System.err.println(st.toString());
	}
}