package learning.languageimplementationpatterns.core;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;

import br.com.recatalog.util.PropertyList;

public abstract class Language {
	List<String> constructorParameters = new ArrayList<String>() {
		{
//		add("NAME");
		add("CASE_SENSITIVE");
		add("SYMBOL_TABLE");
		}
	};
	
	PropertyList symbolFactoryProperties;
	PropertyList symbolProperties;
	
	PropertyList properties;
	Boolean caseSensitive;
	SymbolTable symbolTable;
	
	public Language(PropertyList _properties) {
		this.properties = _properties;
		parametersValidation();
		caseSensitive = (Boolean)properties.getProperty("CASE_SENSITIVE");
		symbolTable = (SymbolTable)properties.getProperty("SYMBOL_TABLE");
		symbolFactoryProperties = new PropertyList();
		setSymbols();
	}
	
	protected abstract void setSymbols();
	
	/*
	 *  Valida parâmetros do construtor
	 */
	private void parametersValidation() {
		for(String parameter : constructorParameters) {
			if(properties.getProperty(parameter) == null) {
				try {
					throw new InvalidParameterException();
				} catch(InvalidParameterException e) {
					System.err.println("ERROR " + "NULL property: " + parameter);
				}				
			}
		}
	}
	
	public String getName() {
		return (String)properties.getProperty("NAME");
	}
	
	public Boolean isCaseSensitive() {
		return caseSensitive;
	}
	
	public PropertyList getProperties() {
		return properties;
	}
}