package learning.languageimplementationpatterns.core;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.antlr.v4.runtime.ParserRuleContext;

import br.com.recatalog.util.BicamSystem;
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

public abstract class Symbol { 
	String name;
	ParserRuleContext context;
	Scope scope;
	Scope enclosingScope;
	Scope parentScope;
	Type   type;
	Language language;
	PropertyList properties;
	
	public Symbol() {
		name = "GLOBAL";
	}
	
	public Symbol(PropertyList _properties) {
		this.properties = _properties;
		
		List<String> constructorParameters = new ArrayList<String>() {
			{ add("NAME");
			  add("SCOPE");
			  add("CONTEXT");
			  add("LANGUAGE");
			}
		};
		
//		constructorParametersValidate(constructorParameters);
//		this.name = (String)getProperty("NAME");
//		this.scope = (Scope)getProperty("SCOPE");
//		this.context = (ParserRuleContext)getProperty("CONTEXT");
//		this.type = (Type)getProperty("TYPE");
//		this.language = (Language)getProperty("LANGUAGE");
		
		this.name = (String)getProperties().mustProperty("NAME");
		this.scope = (Scope)getProperties().getProperty("SCOPE");
		this.enclosingScope = (Scope)getProperties().getProperty("ENCLOSING_SCOPE");
		this.parentScope = (Scope)getProperties().getProperty("PARENT_SCOPE");

		this.context = (ParserRuleContext)getProperties().getProperty("CONTEXT");
//		this.type = (Type)getProperty("TYPE");
		
		if(this.name.equalsIgnoreCase("GLOBAL")) return;
			
		this.language = (Language)getProperties().mustProperty("LANGUAGE");
		
		if(scope != null) { 
			scope.define(this);
//			this.getProperties().addProperty("SCOPE", scope);
		}
		
		/*
		 *  O símbolo tem enclosingScope como no caso de
		 *  variável definida em um método,
		 *  ou tem parentScope como no caso de sub classe(Java), ou variável de item de grupo (Cobol)
		 */
		
		if(enclosingScope != null && !enclosingScope.equals(scope)) {
			enclosingScope.define(this);
//			this.getProperties().addProperty("ENCLOSING_SCOPE", enclosingScope);
		}
		if(parentScope != null &&  !parentScope.equals(scope)) {
			parentScope.define(this);
//			this.getProperties().addProperty("PARENT_SCOPE", parentScope);
		}
	}
	
	private boolean constructorParametersValidate(List<String> _constructorParameter) {
		for(String param :_constructorParameter ) {
			if(!properties.hasProperty(param)) {
				BicamSystem.printLog("ERROR", "Parameter Missing: " + param) ;
			}
		}
		return true;
	}
	
	public String getName() {
		return name;
	}
	
	public Type getTypeSymbol() {
		return type;
	}
	
	public void setTypeSymbol(Type _type) {
		if(_type == null) {
			BicamSystem.printLog("WARNING", "Type can't be null");
		}
		this.type = _type;
		properties.addProperty("TYPE_SYMBOL", _type);
	}
	
	public Scope getScope() {
		return scope;
	}
	
	public void setScope(Scope _scope) {
		this.scope = _scope;
	}
	
	public Scope getParentScope() {
		return parentScope;
	}
	
	public void setParentScope(Scope _scope) {
		this.parentScope = _scope;
	}
	
	public Scope getEnclosingScope() {
		return parentScope;
	}
	
	public void setEnclosingScope(Scope _scope) {
		this.enclosingScope = _scope;
	}
	
	public String getCategory() {
		return (String)properties.getProperty("CATEGORY");
	}
	
//	/*
//	 * CATEGORY { "VARIABLE", "PROCEDURE", "ARRAYVAR", "ARRAYFORM" }
//	 */
//	public void setCategory(String _category) {
//		properties.addProperty("CATEGORY", _category);
//	}
//	
//	public void addProperty(String key, Object value) {
//		properties.addProperty(key, value);
//	}
	
	public Object getProperty(String _key) {
		return properties.getProperty(_key);
	}
	
	public boolean hasProperty(String _key) {
		return properties.hasProperty(_key);
	}
	
	public boolean hasProperty(String _key, String _value) {
		return properties.hasProperty(_key, _value);
	}
	
	public PropertyList getProperties() {
		return properties;
	}
	
	public ParserRuleContext getContext() {
		return (ParserRuleContext)getProperty("CONTEXT");
	}
	
	public int hashCode(){
		// if two objects have the same hashCode then equals() is called in Set Interface objects
		if(isCaseSensitive()) return getName().hashCode();
		else return getName().toUpperCase().hashCode();
	}
	
	public boolean equals(Object o){
        if (this == o) return true;
        
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        
		if(!(this.getClass().isInstance(o))) return false;
        
		if(this.hashCode() != o.hashCode()) return false;
		
//        if(!this.getClass().getSimpleName().equals(o.getClass().getSimpleName())) {
//        	return false;
//        }

        return true;
	}
	
	public boolean isCaseSensitive() {
		return language.isCaseSensitive();
	}
	
	public String location() {
		int line = getContext().getStart().getLine();
		int positionInLine = getContext().getStart().getCharPositionInLine();
		Object moduleName  = getProperties().getProperty("MODULE");
		return String.format("Module: %s line: %d, Position in Line: %d.%n", moduleName ,line, positionInLine);
	}
	
//	public String toStringAll() {
//		return getName() + " - " + getClass().getName() + " - " + getClass().getSimpleName() + System.lineSeparator();	
//	}
	
	public String toString() {
		return "|.." + getName() + " - " + getClass().getSimpleName() + System.lineSeparator();	
	}
	
	public Properties serializeProperties() {
		Properties properties = new Properties();
		
		ParserRuleContext prctx = this.getContext();
		if(prctx != null)
			properties.put("CONTEXT", prctx.start.getLine() + ":" + prctx.start.getCharPositionInLine());
		else 
			properties.put("CONTEXT", "0:0");
		
		properties.put("TYPE", this.getClass().getSimpleName());
		properties.put("MODULE", (String)getProperties().getProperty("MODULE"));

		return properties;
	}	
}