package learning.languageimplementationpatterns.core.visualbasic6;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.antlr.v4.runtime.ParserRuleContext;

import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.ParserInventory;
import br.com.recatalog.util.PropertyList;
import learning.languageimplementationpatterns.core.Scope;
import learning.languageimplementationpatterns.core.Symbol;

public class VisualBasicPreDefinedSym {

	enum Token {
		LIB, CLASS, ENUM, SYMBOL, PARENT, PROPERTY, FUNCTION, SUB, CONST;
	}
	
	ParserInventory inventory;
	Path path;                                // file name     
	URL url;
    URLConnection urlConnection;
	Map<Integer,String> namedGroups; 
	
	Scope currentScope;
	Scope parent;
    Scope globalScope;
	
	Set<String> commands;
	String formalParameters;

	BufferedReaderforRegex2 br;
	
	String line ;
	
	Map<String,List<String>> elementsRegex;    // DEFVAR, DEFMETHDOC, STMT, etc...
	
	/**Exemplos: Attribute objEvento.VB_VarHelpID = -1
		         Attribute VB_VarHelpID = -1
	*/

	final String ATTRIBUTE_REGEX = "(?:(?i)^ATTRIBUTE\\s*(?<attribute>\\S+)\\s*=\\s*[^$]+)";
	final String ATTRIBUTE = "ATTRIBUTE";
	
	final String COMMAND = "COMMAND";
	
	/**(?:(?i)^\s*?EVENT\s*?(?<eventName>\w+)\s*?\((?<parameters>.*(?=\)))\)\s*$)
	 * ----------------------------------------------------------xx-----
	 * utilizei o greedy ".*", para buscar o mÃ¡ximo de caracteres para finalizar com ")"
	 * mais, veja em:
	 * https://mariusschulz.com/blog/why-using-the-greedy-in-regular-expressions-is-almost-never-what-you-actually-want#targetText=The%20Dot%3A%20Matching%20(Almost)%20Arbitrary%20Characters&targetText=Outside%20of%20a%20character%20class,and%20matches%20the%20dot%20character.
	 * */
	
	public VisualBasicPreDefinedSym(File file, Scope globalScope) {
		this.br = new BufferedReaderforRegex2(file);
		this.globalScope = globalScope;
		run();
	}
	
	public void run() {
		line = br.nextLine();
		
		while(line != null) {
			Token token = Token.valueOf(line.split(" ")[0]);
			
			switch(token) {
			case LIB:
			case CLASS:
			case ENUM:
			case SYMBOL:
				createSymbol();
				break;
			case PARENT:
				setScope();
				break;
			case PROPERTY:
				addProperty();
				break;
				default:
				try {
					throw new 
					IllegalArgumentException("Invalid input: " + token);
				} 
				catch(IllegalArgumentException e) {
					
				}
			}
			
			line = br.nextLine();
		}
	}
	/*
	private void createSymbol() {
//===================================================================
		String name = line.split(" ")[1];
		String symbol_type = line.split(" ")[0].toUpperCase();
		
		PropertyList symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", symbol_type);
		
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
//===================================================================		
	}
	*/
	
	private void createSymbol() {
		
	}
	private void addProperty() {
		
	}
	
	private void setScope() {
		
	}
	
	private void def(String line) {
		/**
		 * (?) - case insensitive
		 * ^ - star line
		 * (?<=Library[ ]) - lookbehind
		 * Descrição 
		 * Encontre a sequência de caracteres, que não contenham 
		 *  espaço( ), newline(\n) ou carriage return (\r),
		 *  e que seja precedida da palavra "Library" seguida de espaço ([ ])
		 *  Esse mesmo regex poderia de escrito:
		 *  "(?i)^Library\\s+([^ \\n\\r]+)"
		 */
//		String xregex = "(?i)^.*(?<=Library[ ])([^ \\n\\r]+)";
		String xregex = "(?i)^Library\\s+([^ \\n\\r]+)";

		 Pattern p = Pattern.compile(xregex);
		 Matcher m = p.matcher(line);
//		 boolean mfind = m.find();
		
		 try {
			 if(m.find()) {
				 if(m.start() > -1) {
					 String c = m.group().trim();
				 }
			 }
		 }catch (Exception e) {
			 e.printStackTrace();
			 System.err.println();
		 }
	}
	  
  public static void main(String args[]) {
	  File f = null;
	  try {
		f = BicamSystem.toFileUTF8("C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\VB_LIBRARY\\AllLibs.vblib");
	} catch (IOException e) {
		e.printStackTrace();
	}
	  Scope s = null;
	  VisualBasicPreDefinedSym parse = new VisualBasicPreDefinedSym(f, s);
  }
}

  class BufferedReaderforRegex2 {
	BufferedReader br;
	final String LINE_SEPARATOR = System.lineSeparator();
	List<String> lines;
	int linesRead;
	String lineToContinue;
	
	public BufferedReaderforRegex2(Object source) {
		lines = new ArrayList<String>();

		if(source instanceof URI) open((URI)source);
		else if(source instanceof File) open((File)source);
		else if(source instanceof String) open((String)source);
		else try {
			throw new InvalidParameterException("Must be 'URL' or 'File' ");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Integer getCurrentLine() {
		return linesRead;
	}
	
	public String nextLine() {
		String line = null;
		try {
			if(lines.size() > 0) {
				line = lines.get(0);
				lines.remove(0);				
			}
			else {
				line = br.readLine();
				linesRead++;
			}
			
			if(line == null) {
			  close();
			  return null;
			}
	 /**
	 * (?:(?i)(?<stringliteral>\\\"[^\"]*\"))|(?:(?i)(?<comment>\\s*'.*$))|(?:(?i)(?<label>^\\w+:))|(?:(?i)(?<newCmdInLine>: ))
	 * 
	 * https://regex101.com
	 * (?:(?i)(?<stringliteral>"[^"]*"))|(?:(?i)(?<comment>\s*'.*$))|(?:(?i)(?<label>^\w+:))|(?:(?i)(?<newCmdInLine>: ))
	 * 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456
	 * 1. (?:....) - mandadório para comando "find()"
	 * 4. (?i) flag modifier para case insensitive
	 * 8. (?<groupName> identifica group name
	 * 32. ) fecha "group name"
	 * 33. ) fecha paren que abriu em 1.
	 * 
	 * 34. indica outra opção para busca do find
	 * 
	 * Pattern p = Pattern.compile(newCmdInLine);
	 * Matcher m = p.matcher(line);
	 * m.find(), se true m.start()
	 */			
		if(lineToContinue != null) {
			line = lineToContinue + line;
			lineToContinue = null;
		}
			
		 String newCmdInLine = "(?:(?i)(?:\"[^\"]*\"))|(?:(?i)(?<comment>\\s*'.*$))|(?:(?i)(?<label>^\\w+:))|(?:(?i)(?<newCmdInLine>: ))|(?:(?i)(?<lineContinuation> _$))|(?:(?i)^(?<lineNumber>\\d+))|(?:(?i)then(?<thenInLine>(?=\\s+[a-zA-Z]\\w*)(?:.(?!ELSE))+))|(?:(?i)else(?<elseInLine>(?=\\s+[a-zA-Z]\\w*)(?:.(?!$))+))";
		 Pattern p = Pattern.compile(newCmdInLine);
		 Matcher m = p.matcher(line);
		 line = splitCmdInLine(line,m);
		 if(line == null) line = nextLine();		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return line;
	}
	
	private String splitCmdInLine(String line, Matcher m) {
		try {
			while(m.find()) {
				if(m.start("comment") > -1) {
					lines.add(line.substring(0,m.start("comment")));
					line = null;
					 break;
				}
				if(m.start("label") > -1) {
					lines.add(line.substring(m.group("label").length()));
					line =  null;
					break; 
				}
				if(m.start("lineNumber") > -1) {
					lines.add(line.substring(m.group("lineNumber").length()));
					line =  null;
					break; 
				}
				if(m.start("newCmdInLine") > -1) {
					 lines.add(line.substring(0,m.start("newCmdInLine")));
					 lines.add(line.substring(m.start("newCmdInLine")+1));
					 line = null;
					 break;
				 }
				if(m.start("lineContinuation") > -1) {
					lineToContinue = line.substring(0,m.start("lineContinuation"));
					line = null;
					 break;
				}
	/**
	 * linha: 'If Digits = 1 then exit  Else MyString = "More than one"' 

	 * linha1 = 'If Digits = 1'
	 * linha2 = 'exit'
	 * linha3 = 'MyString = "More than one"'
	 * 
	 * */
				
				
	/**
	 * cria uma nova linha a partir do "then" do "if" in line
	 * */
				boolean hasThenInLine = false;
				if(m.start("thenInLine") > -1) {
					 lines.add(line.substring(0,m.start("thenInLine")));
					 lines.add(line.substring(m.start("thenInLine")));
					 hasThenInLine = true;
				}
				if(m.start("elseInLine") > -1) {
					if(hasThenInLine) lines.add(line.substring(0,m.start("elseInLine")));
					 lines.add(line.substring(m.start("elseInLine")));
					 line = null;
					 break;
				}
				if(hasThenInLine) {
                    line = null;
					break;
				}
			 }
		} catch(StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			int i = 0;
			int c = 2;
			i = 0 + c;
			
		}
			return line;
	}
	
	private void open(URI uri) {
	  try {
		  br = new BufferedReader(new InputStreamReader(uri.toURL().openConnection().getInputStream()));
	  } catch(Exception e) {
		e.printStackTrace();
	  }
	}
    
	private void open(File file) {
				Path path = null;
				try {
					path = Paths.get(file.getCanonicalPath());
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			
		  try {
			  br = Files.newBufferedReader(path); // Para ler UTF8 - default Java 8
		  } catch(Exception e) {
			e.printStackTrace();
		  }
	}
	
	private void open(String pathFile) {
		  try {
			  open(new File(pathFile));
		  } catch(Exception e) {
			e.printStackTrace();
		  }
	}
	
	private void close() {
		  try {
			  br.close();
		  } catch(Exception e) {
			e.printStackTrace();
		  }
	}	
}