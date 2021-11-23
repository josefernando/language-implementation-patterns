package learning.languageimplementationpatterns.core;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.recatalog.util.PropertyList;

/*
 * Definições:
 * Scope , EnclosingScope e ParentScope
 * 
 * Scope: Visão do símbolo
 * 
 * EnclosingScope: Grupo ou estrutura no qual o símbolo é definido
 * 
 * ParentScope: Numa estrutura ou classe em qual classe ou item de grupo o símbolo pertence
 *  
 */

public class LanguageVb6 extends Language {
	
	PropertyList symbolFactoryProperties;
	PropertyList symbolProperties;

	public LanguageVb6(PropertyList _properties) {
		super(_properties);
		properties.addProperty("NAME", "VB6");
	}
	
	protected void setSymbols() {
		setPrimitiveTypes();
		setLibs();
	}
	
	private void setLibs() {
		setSystemLib(); 
		setOthersLib();
	}
	
	protected void setPrimitiveTypes() {
		List<String> symbols = new ArrayList<String>() {
			{   add("Any");
			    add("Numeric");
				add("Byte");
				add("Integer");
				add("Long");
				add("String");
				add("Single");
				add("Double");
				add("Currency");
				add("Date");
				add("Boolean");
				add("Object");
				add("Variant");
				add("Void");
			}
		};
		
		symbolFactoryProperties = new PropertyList();
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "PRIMITIVE_TYPE");
		
		symbolProperties = new PropertyList();
		symbolProperties.addProperty("SCOPE", symbolTable.getGlobalScope());
		symbolProperties.addProperty("ENCLOSING_SCOPE", symbolTable.getGlobalScope());
		symbolProperties.addProperty("CONTEXT", null);
		symbolProperties.addProperty("DEF_MODE", "BUILTIN");     // IMPLICIT, EXPLICIT, BUILTIN
		symbolProperties.addProperty("CATEGORY", "TYPE");        // TYPE, LIB, CLASS
		symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");  // SYSTEM
		symbolProperties.addProperty("LANGUAGE", this);  
		
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		for(String name : symbols) {
			symbolProperties.addProperty("NAME", name);
				symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);
		}
	}
	
	protected void setSystemLib() {

		Map<String,List<String>> libClasses = new HashMap<String,List<String>>();

// Classes in VB Lib ===================================================
		List<String> vbClasses = new ArrayList<String>() {
			{ add("Form");	
			  add("Image");
			  add("TextBox");
			  add("Label");
			  add("ComboBox");
			}
		};
		libClasses.put("VB",vbClasses);	
		
		symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("SCOPE", symbolTable.getGlobalScope());
		symbolProperties.addProperty("ENCLOSING_SCOPE", null);
		symbolProperties.addProperty("PARENT_SCOPE", null);
		symbolProperties.addProperty("LANGUAGE", this);  

		symbolProperties.addProperty("CONTEXT", null);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "BUILTIN");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "LIB");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
		symbolProperties.addProperty("NAME", "VB");
		
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "LIB");
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);

		Scope parentScope =  (Scope) symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);

		for(String clazz : vbClasses) {
			symbolProperties = new PropertyList(); // usado para cria os simbolos
			symbolProperties.addProperty("SCOPE", null);
			symbolProperties.addProperty("ENCLOSING_SCOPE", null);
			symbolProperties.addProperty("LANGUAGE", this);  

			symbolProperties.addProperty("PARENT_SCOPE", parentScope);
			symbolProperties.addProperty("CONTEXT", null);
//			symbolProperties.addProperty("TYPE", null);
			symbolProperties.addProperty("DEF_MODE", "BUILTIN");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
			symbolProperties.addProperty("CATEGORY", "CLASS");       // 
			symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
			symbolProperties.addProperty("NAME", clazz);
			
			symbolFactoryProperties.addProperty("SYMBOL_TYPE", "FORM_CONTROL");
			symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
			
			symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);
		}
		

// ====================================================================
		
// Classes in Threed Lib
		List<String> threedClasses = new ArrayList<String>() {
			{ add("SSCommand");	
			  add("SSPanel");
			  add("SSOption");
			  add("SSCheck");
			  add("SSFrame");
			}
		};
		libClasses.put("Threed",threedClasses);	
		
		symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("SCOPE", symbolTable.getGlobalScope());
		symbolProperties.addProperty("ENCLOSING_SCOPE", null);
		symbolProperties.addProperty("LANGUAGE", this);  

		symbolProperties.addProperty("PARENT_SCOPE", null);
		
		symbolProperties.addProperty("CONTEXT", null);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "INCLUDED");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "LIB");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
		symbolProperties.addProperty("NAME", "Threed");
		
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "LIB");
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		
		parentScope = (Scope) symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);

		for(String clazz : threedClasses) {
			symbolProperties = new PropertyList(); // usado para cria os simbolos
//			symbolProperties.addProperty("SCOPE", parentScope);
			symbolProperties.addProperty("SCOPE", null);
			symbolProperties.addProperty("ENCLOSING_SCOPE", null);
			symbolProperties.addProperty("LANGUAGE", this);  

			symbolProperties.addProperty("PARENT_SCOPE", parentScope);
			symbolProperties.addProperty("CONTEXT", null);
//			symbolProperties.addProperty("TYPE", null);
			symbolProperties.addProperty("DEF_MODE", "INCLUDED");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
			symbolProperties.addProperty("CATEGORY", "CLASS");       // 
			symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
			symbolProperties.addProperty("NAME", clazz);
			
			symbolFactoryProperties.addProperty("SYMBOL_TYPE", "FORM_CONTROL");
			symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
			
			symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);
		}		
		
// ====================================================================
		
// Classes in MSGrid Lib
		List<String> mSGridClasses = new ArrayList<String>() {
			{ add("Grid");	
			}
		};
		libClasses.put("MSGrid",mSGridClasses);		

		symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("SCOPE", symbolTable.getGlobalScope());
		symbolProperties.addProperty("ENCLOSING_SCOPE", null);
		symbolProperties.addProperty("PARENT_SCOPE", null);
		symbolProperties.addProperty("LANGUAGE", this);  

		symbolProperties.addProperty("CONTEXT", null);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "INCLUDED");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "LIB");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
		symbolProperties.addProperty("NAME", "MSGrid");

		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "LIB");
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		
		parentScope = (Scope)symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);

		for(String clazz : mSGridClasses) {
			symbolProperties = new PropertyList(); // usado para cria os simbolos
			symbolProperties.addProperty("SCOPE", null);
			symbolProperties.addProperty("ENCLOSING_SCOPE", null);
			symbolProperties.addProperty("LANGUAGE", this);  

			symbolProperties.addProperty("PARENT_SCOPE", parentScope);
			symbolProperties.addProperty("CONTEXT", null);
//			symbolProperties.addProperty("TYPE", null);
			symbolProperties.addProperty("DEF_MODE", "INCLUDED");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
			symbolProperties.addProperty("CATEGORY", "CLASS");       // 
			symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
			symbolProperties.addProperty("NAME", clazz);
			
			symbolFactoryProperties.addProperty("SYMBOL_TYPE", "FORM_CONTROL");
			symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
			
			symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);
		}
// ====================================================================
		
// Classes in MSFlexGridLib Lib
		List<String> mSFlexGridLibClasses = new ArrayList<String>() {
			{ add("MSFlexGrid");	
			}
		};
		libClasses.put("MSFlexGridLib",mSFlexGridLibClasses);					

		symbolProperties = new PropertyList(); // usado para cria os simbolos
		symbolProperties.addProperty("SCOPE", symbolTable.getGlobalScope());
		symbolProperties.addProperty("ENCLOSING_SCOPE", null);
		symbolProperties.addProperty("PARENT_SCOPE", null);
		symbolProperties.addProperty("LANGUAGE", this);  

		symbolProperties.addProperty("CONTEXT", null);
//		symbolProperties.addProperty("TYPE", null);
		symbolProperties.addProperty("DEF_MODE", "INCLUDED");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
		symbolProperties.addProperty("CATEGORY", "LIB");          // 
		symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
		symbolProperties.addProperty("NAME", "MSFlexGridLib");
		
		symbolFactoryProperties.addProperty("SYMBOL_TYPE", "LIB");
		symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
		
		parentScope = (Scope)symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);

		for(String clazz : mSFlexGridLibClasses) {
			symbolProperties = new PropertyList(); // usado para cria os simbolos
			symbolProperties.addProperty("SCOPE", null);
			symbolProperties.addProperty("ENCLSING_SCOPE", null);
			symbolProperties.addProperty("PARENT_SCOPE", parentScope);
			symbolProperties.addProperty("CONTEXT", null);
//			symbolProperties.addProperty("TYPE", null);
			symbolProperties.addProperty("DEF_MODE", "INCLUDED");     // CRIA CLASSES E OBJECTOS IMPLICITAMENTO
			symbolProperties.addProperty("CATEGORY", "CLASS");       // 
			symbolProperties.addProperty("SUB_CATEGORY", "SYSTEM");
			symbolProperties.addProperty("NAME", clazz);
			symbolProperties.addProperty("LANGUAGE", this);  

			symbolFactoryProperties.addProperty("SYMBOL_TYPE", "FORM_CONTROL");
			symbolFactoryProperties.addProperty("SYMBOL_PROPERTIES", symbolProperties);
			
			symbolTable.getSymbolFactory().getSymbol(symbolFactoryProperties);
		}		
	}
	
	protected void setOthersLib() {
	}
	    public static void main(String[] args) {
		SymbolTable st = new SymbolTableVB6();
		PropertyList properties = new PropertyList();
		properties.addProperty("SYMBOL_TABLE", st);
		properties.addProperty("CASE_SENSITIVE", false);
//		Language lg = new LanguageVb6(properties);
		System.err.println(st.getGlobalScope().toString());
	}
}