package learning.languageimplementationpatterns.core;

import java.io.File;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.core.ContextTreeData;
import br.com.recatalog.core.Language;
import br.com.recatalog.core.visualbasic6.LanguageVb6;
import br.com.recatalog.util.PropertyList;
import learning.languageimplementationpatterns.core.visualbasic6.ParserRegexVisualBasic6;
import learning.languageimplementationpatterns.core.visualbasic6.VisualBasic6CompUnitInventory_OLD;
import learning.languageimplementationpatterns.core.visualbasic6.VisualBasic6ParserCompUnit;
import learning.languageimplementationpatterns.core.visualbasic6.VisualBasic6StatisticsCompUnit;
import learning.languageimplementationpatterns.util.ModuleProperty;

public class SymbolTableBuilder {
	
	String language;
	SymbolFactoryVb6 st;
	List<String> sourceFiles;
	
	IdentityHashMap<String, ArrayList<ContextTreeData>> whereUsedByName; 
	IdentityHashMap<Symbol, ArrayList<ContextTreeData>> whereUsedBySymbol;
	
	Map<String,PropertyList> moduleProperties;
	
	Map<String, ArrayList<ContextTreeData>> unResolvedSymbolList;
	
	public SymbolTableBuilder(PropertyList properties) {
		language = (String) properties.getProperty("LANGUAGE");
		sourceFiles = (List<String>) properties.getProperty("SOURCE_FILES");

		st = new SymbolFactoryVb6();
		
		moduleProperties = new LinkedHashMap<String,PropertyList>();
		
		run();
	}

	private void run() {
		parser(sourceFiles);
//tbd		def();
//tbd		ref();
	}
	
	public void parser(List<String> filesToParse) {
		for(String filePath : filesToParse ) {
			parser(filePath);
		}
		
		/**
		 * Lambda não pega (catch) exception
		 */
//		filesToParse.forEach((filePath) -> parsing(filePath));
	}
	
	public void parser(String filePath) {
		PropertyList props = new PropertyList();
		props.addProperty("FILE_PATH", filePath);
		 
		ModuleProperty module = new ModuleProperty(filePath);
		String moduleName = module.getName();
		
		System.err.println("... Parsing module: " + moduleName + " on file " + filePath);
		
		VisualBasic6ParserCompUnit parseVisualBasic6CompUnit = new VisualBasic6ParserCompUnit(props);

		moduleProperties.put(moduleName, new PropertyList());
		PropertyList propmodule = moduleProperties.get(moduleName);
		propmodule.addProperty("ASTREE", (ParseTree) props.mustProperty("ASTREE"));
		propmodule.addProperty("FILE_PATH", filePath);
		propmodule.addProperty("OPTION_EXPLICIT", module.isOptionExplicit());
		if(module.isClassModule()) {
			propmodule.addProperty("IS_CLASS", true);
		}
		
        if(parseVisualBasic6CompUnit.getNumErrors() > 0 ) {
        	System.err.println(String.format("PARSING FAILED  with %d ERRORS", parseVisualBasic6CompUnit.getNumErrors()) );
        	System.err.println(parseVisualBasic6CompUnit.getProperties().mustProperty("EXCEPTION"));
        	propmodule.addProperty("PARSING_ERRORS", parseVisualBasic6CompUnit.getNumErrors());
        	propmodule.addProperty("EXCEPTION", parseVisualBasic6CompUnit.getProperties().mustProperty("EXCEPTION"));
        }
       	else {
        	System.err.print(String.format("SUCCESSFULLY PARSING  in %f seconds", parseVisualBasic6CompUnit.getElapsedTime()));
        	propmodule.addProperty("PARSING_TIME", parseVisualBasic6CompUnit.getElapsedTime());
       	}
		
		parserUnitTest((ParseTree)propmodule.getProperty("ASTREE"), new File(filePath));
	}	
	
	public void parserUnitTest(ParseTree tree, File file) {
		VisualBasic6StatisticsCompUnit visualBasic6StatisticsCompUnit = new VisualBasic6StatisticsCompUnit();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(visualBasic6StatisticsCompUnit, tree);        // walk parse tree 
        
        if(visualBasic6StatisticsCompUnit.getException() != null) {
        	System.err.println(visualBasic6StatisticsCompUnit.getException());
        }
        
  	     ParserRegexVisualBasic6 parseRegex = new ParserRegexVisualBasic6(file);
  	     boolean ok = visualBasic6StatisticsCompUnit.getStatistics().getStatistics().equals(parseRegex.getInventory().getInventory());
  	     if(!ok) {
  	    	visualBasic6StatisticsCompUnit.getStatistics().print();
             parseRegex.getInventory().print();
  	     }
//  	   String unitTest = visualBasic6InventoryCompUnit.getInventory().getInventory().equals(parseRegex.getInventory().getInventory())
//  			             == true ? "Succeed" : "Failed";
  	   boolean unitTest = visualBasic6StatisticsCompUnit.getStatistics().getStatistics().equals(parseRegex.getInventory().getInventory()); 
  	   System.err.println(String.format("Unit Test: %s%n", unitTest == true ? "Succeeded" : "Failed"));		
  	   if(!unitTest) {
  		   String msg = System.lineSeparator()+ visualBasic6StatisticsCompUnit.getStatistics().getStatistics().toString();
  		   msg = msg + System.lineSeparator()+ parseRegex.getInventory().getInventory().toString();
  	   }
	}
	
	public Map<String,PropertyList> getModuleProperties(){
		return moduleProperties;
	}
	
	private void def() {
		defSymbol();
		defTypeSymbol();
	}
	
	private void defSymbol() {
		
	}
	
	private void defTypeSymbol() {
		
	}
	
	private void ref() {
		
	}
	
	public static void main(String[] args) {
    	
		List<String> files = new ArrayList<String>() {{

			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB001.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB002.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB003.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB004.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB005.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB006.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB007.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB008.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB009.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB010.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB011.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB012.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB013.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB014.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB015.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1FAB016.FRM");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GECOEX01.CLS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GECOMS01.CLS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMGVK01.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOAJU1.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOAMB1.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOCOR1.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOEX01.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOMB01.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOSY01.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOTXT1.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMOVR01.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\GEMVBAPI.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\PEGFNZ01.CLS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1CAB016.CLS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\RXGCMG01.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\WNGWN005.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB001.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB002.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB003.BAS");
			add("C:\\workspace\\arcatalog\\vb6\\antlr4\\input\\R1PAB0\\R1MAB004.BAS");
		}};	
		
    	Language language = new LanguageVb6();
    	PropertyList properties = new PropertyList();
    	properties.addProperty("LANGUAGE", null);
    	properties.addProperty("SOURCE_FILES", files);
    	SymbolTableBuilder builder = new SymbolTableBuilder(properties);
    	System.err.println("----- Printing Module Properties");
    	for(Entry<String, PropertyList> module : builder.getModuleProperties().entrySet()) {
			System.err.println();
    		System.err.println(module.getKey() + "- " + module.getValue().toString());
    		for(Entry<String, Object> e : module.getValue().getEntries()) {
    			System.err.println(e.getKey() + ": " + e.getValue().toString());
    		}
    	}
//    	System.err.println(st.getBuiltinScope().toString());
//    	System.err.println(st.getGlobalScope().toString());
	}
}
