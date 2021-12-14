package learning.languageimplementationpatterns.core.visualbasic6;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import br.com.recatalog.core.VerboseListener;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitLexer;
import br.com.recatalog.languageimplementationpatterns.parser.visualbasic6.VisualBasic6CompUnitParser;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.PropertyList;
import learning.languageimplementationpatterns.core.SymbolTable;
import learning.languageimplementationpatterns.core.SymbolTableVB6;

public class VisualBasic6ParserCompUnit {
	PropertyList properties;
	List<PropertyList> propertyList;
	
	public VisualBasic6ParserCompUnit(List<PropertyList> _propertyList) {
		this.propertyList = _propertyList;
		runParser();
	}

	public VisualBasic6ParserCompUnit(PropertyList properties) {
		this.properties = properties;
		run();
	}
	
	public String getFilePath(){
		return (String)properties.getProperty("FILE_PATH");
	}

	public ParseTree getAstree(){
		return (ParseTree)properties.getProperty("ASTREE");
	}	

	public int getNumErrors(){
		return (Integer)properties.getProperty("NUM_SYNTAX_ERRORS");
	}

	public Double getElapsedTime(){
		return (Double)properties.getProperty("ELAPSED_TIME");
	}
	
	public Double getParsingTime(){
		return (Double)properties.getProperty("PARSING_TIME");
	}

	public PropertyList getProperties(){
		return properties;
	}

	public List<PropertyList> getPropertyList(){
		return propertyList;
	}
	
	private void run() {
		String filePath = (String) properties.mustProperty("FILE_PATH");
//		ModuleProperty moduleProperties = new ModuleProperty(filePath);
//		BicamSystem.printLog("INFO", String.format("Parsing module: %s, file: %s", moduleProperties.getName(), filePath));

		InputStream is = null;
		try {
			is = BicamSystem.toInputStreamUTF8(filePath);
		} catch (IOException e3) {
			e3.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			e3.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}
		
		CharStream cs = null;
		try {
			cs = CharStreams.fromStream(is);
		} catch (IOException e1) {
			e1.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			e1.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}

		VisualBasic6CompUnitLexer lexer = new VisualBasic6CompUnitLexer(cs);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		VisualBasic6CompUnitParser parser = new VisualBasic6CompUnitParser(tokens);

		parser.removeErrorListeners();
		parser.addErrorListener(new VerboseListener());

		Path pathFile = null;
		File tempFile = null;
//		PrintStream err = null;

		try {
			pathFile = Files.createTempFile("tempfile", ".tmp");
			tempFile = pathFile.toFile();
//			err = new PrintStream(tempFile);

//			System.setErr(err);
		} catch (Exception e) {
//			System.setErr(err);
			e.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			e.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}

//		parser.getInterpreter().setPredictionMode(PredictionMode.SLL);
		try {
			ParseTree astree = parser.startRule();
			
			properties.addProperty("ASTREE", astree);
			BufferedReader in = new BufferedReader(new FileReader(tempFile));
			String line = in.readLine();
			while(line != null)
			{
//			  System.out.println(line);
			  line = in.readLine();
			}
			in.close();

		} catch (Exception ex) {
			ex.printStackTrace();
			StringWriter exceptionStackError = new StringWriter();
			ex.printStackTrace(new PrintWriter(exceptionStackError));
			properties.addProperty("EXCEPTION", exceptionStackError.toString());
		}

		int numSyntaxErrors = parser.getNumberOfSyntaxErrors();
		
		properties.addProperty("NUM_SYNTAX_ERRORS",numSyntaxErrors);

		if (parser.getNumberOfSyntaxErrors() > 0) {
			try {
				throw new Exception();
			} catch (Exception e) {
				e.printStackTrace();

				StringWriter exceptionStackError = new StringWriter();
				e.printStackTrace(new PrintWriter(exceptionStackError));
				properties.addProperty("EXCEPTION", exceptionStackError.toString());
				StringBuilder sb = new StringBuilder();

				try {
					FileInputStream fis = new FileInputStream(tempFile);
					byte[] buffer = new byte[10];
					while (fis.read(buffer) != -1) {
						sb.append(new String(buffer));
						buffer = new byte[10];
					}
					fis.close();
					properties.addProperty("EXCEPTION",
							sb.toString() + System.lineSeparator() + exceptionStackError.toString());
				} catch (Exception e2) {
					e2.printStackTrace();
					StringWriter exceptionStackError2 = new StringWriter();
					e2.printStackTrace(new PrintWriter(exceptionStackError2));
					properties.addProperty("EXCEPTION", exceptionStackError2.toString());
					return ;
				}
			}
		}
		
		properties.addProperty("ELAPSED_TIME", parser.getTotalElapsedTime()); // Compatibility only
		properties.addProperty("PARSING_TIME", parser.getTotalElapsedTime());

		StringBuilder sb = new StringBuilder();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(tempFile);

		byte[] buffer = new byte[10];
		while (fis.read(buffer) != -1) {
			sb.append(new String(buffer));
			buffer = new byte[10];
		}
		fis.close();
//		System.err.println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<PropertyList> runParser() {
		for(PropertyList properties : propertyList) {
			VisualBasic6ParserCompUnit parser = new VisualBasic6ParserCompUnit(properties);
			System.err.println(properties.getProperty("FILE_PATH"));
			System.err.println("Total time: " + parser.getElapsedTime());
			System.err.println("Total Errors: " + parser.getNumErrors());
			System.err.println();			
		}
		return propertyList;
	}
	
// Unit test	
	public static void main(String[] args) {
//		PropertyList properties = new PropertyList();
//		properties.addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB001.FRM");
//		VisualBasic6ParserCompUnit parser = new VisualBasic6ParserCompUnit(properties);
//		System.err.println("Total time: " + parser.getElapsedTime());
//		System.err.println("Total Errors: " + parser.getNumErrors());
		List<PropertyList> propertyList = new ArrayList<PropertyList>();
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\PREDEFINED_SYMBOLS\\PREDEFINED.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\Users\\josez\\git\\language-implementation-patterns\\language-implementation-patterns\\src\\test\\resources\\LANGUAGE.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GECOEX01.CLS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GECOMS01.CLS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMGVK01.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOAJU1.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOAMB1.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOCOR1.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOEX01.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOMB01.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOSY01.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOTXT1.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMOVR01.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\GEMVBAPI.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\PEGFNZ01.CLS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1CAB016.CLS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB001.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB002.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB003.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB004.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB005.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB006.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB007.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB008.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB010.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB011.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB012.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB013.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB014.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB015.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1FAB016.FRM"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1MAB001.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1MAB002.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1MAB003.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\R1MAB004.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\RXGCMG01.BAS"));
		propertyList.add(new PropertyList().addProperty("FILE_PATH", "C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\R1PAB001\\WNGWN005.BAS"));

//========================================  PARSER =========================================

		VisualBasic6ParserCompUnit parser = new VisualBasic6ParserCompUnit(propertyList);
		propertyList = parser.getPropertyList();

//=====================================  SYMBOL_TABLE ========================================

		SymbolTable st = new SymbolTableVB6();

//=====================================  MODULE  ========================================

		for(PropertyList properties : propertyList) {
			ParseTree tree = (ParseTree) properties.mustProperty("ASTREE");
	        ParseTreeWalker walker = new ParseTreeWalker();

	        properties.addProperty("SYMBOL_TABLE", st);

	        VisualBasic6Module visualBasic6module = new VisualBasic6Module(properties);
	        walker.walk(visualBasic6module, tree);        // walk parse tree 
	        System.err.println("Module name: " + visualBasic6module.getModuleName());			
		}
//=====================================  PRE DEF SYMBOL ========================================
//
//				for(PropertyList properties : propertyList) {
//					ParseTree tree = (ParseTree) properties.mustProperty("ASTREE");
//			        ParseTreeWalker walker = new ParseTreeWalker();
//
//			        properties.addProperty("SYMBOL_TABLE", st);
//
//			        VisualBasic6DefPredefinedSym visualBasic6DefPredefinided = new VisualBasic6DefPredefinedSym(properties);
//			        walker.walk(visualBasic6DefPredefinided, tree);        // walk parse tree 
//				}		
//				
//				System.err.println(st.toString());
//				
		
//=====================================  DEF SYMBOL ========================================

		for(PropertyList properties : propertyList) {
			ParseTree tree = (ParseTree) properties.mustProperty("ASTREE");
	        ParseTreeWalker walker = new ParseTreeWalker();

	        properties.addProperty("SYMBOL_TABLE", st);

	        VisualBasic6DefSym visualBasic6DefSymbol = new VisualBasic6DefSym(properties);
	        walker.walk(visualBasic6DefSymbol, tree);        // walk parse tree 
		}		
		
		System.err.println(st.toString());
		
//=====================================  RESOLVE TYPE ========================================

		for(PropertyList properties : propertyList) {
			ParseTree tree = (ParseTree) properties.mustProperty("ASTREE");
	        ParseTreeWalker walker = new ParseTreeWalker();

	        properties.addProperty("SYMBOL_TABLE", st);

	        VisualBasic6ResolveType visualBasic6ResolveType = new VisualBasic6ResolveType(properties);
	        walker.walk(visualBasic6ResolveType, tree);        // walk parse tree 
		}		
		System.err.println(st.toString());
		
//=====================================  RESOLVE SYMBOL ========================================

				for(PropertyList properties : propertyList) {
					ParseTree tree = (ParseTree) properties.mustProperty("ASTREE");
			        ParseTreeWalker walker = new ParseTreeWalker();

			        properties.addProperty("SYMBOL_TABLE", st);

			        VisualBasic6ResolveSymbol visualBasic6ResolveSymbol = new VisualBasic6ResolveSymbol(properties);
			        walker.walk(visualBasic6ResolveSymbol, tree);        // walk parse tree 
				}		
				System.err.println(st.toString());		
	}
}