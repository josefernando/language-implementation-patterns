package learning.languageimplementationpatterns.core;

import org.antlr.v4.runtime.ParserRuleContext;

import br.com.recatalog.util.PropertyList;

public class ContextData {
	ParserRuleContext context;
	Scope scope;
	Symbol symbol;
	Type type;
	Type resultType;
	Type typeToPromote;         // type casting
	
	Type[][]operationArrayType; // utilizado para avaliar operação de tipos
	                            // ... somaArrayType
	                            // ... promoteArrayType

	PropertyList properties;
	
	public ContextData(ParserRuleContext context){
		this.properties = new PropertyList();
		this.context = context;
	} 
	
	public ParserRuleContext getContext() {
		return this.context;
	}
	
	public Scope getScope() {
		return scope;
	}
	
	public void setScope(Scope scope) {
		this.scope = scope;
	}

	public Symbol getSymbol() {
		return symbol;
	}
	
	public void setSymbol(Symbol symbol) {
		this.symbol = symbol;
	}

	public Type getType() {
		return type;
	}
	
	public void setType(Type type) {
		this.type = type;
	}	

	public PropertyList getProperties(){
		return properties;
	}
	
	public Type evaluationType() { // igual a  getType() !?
		/*
		 * identifica o símbolo do nó e retorna o tipo
		 * Se nó não tem símbolo associado retorna null
		 */
		return null;
	}
	
	public Type typeToPromote() {
		return null;
	}
	
	public String toString() {
		Integer line = symbol.getContext() != null 
				? symbol.getContext().start.getLine() : 0;
		return "Symbol: " + symbol.getName() 
		     + " scope: " + symbol.getScope().getName()
		     + " module: " + symbol.getProperties().getProperty("MODULE")
		     + " line: "   + line;
	}
}