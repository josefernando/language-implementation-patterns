package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public interface Scope {

	public PropertyList getProperties();
	
	public String getName();
	
	/*
	 * 	 redefinido em ClassSymbol, conforme patterns do livro:
	 *   "Language Implementation Patterns" página 170.
	 */
	                              
	// public Scope getEnclosingScope();

	public Symbol resolve(PropertyList properties);
	
	public  Symbol resolveMember(PropertyList properties);
	
	public void define(Symbol sym);
	
//	public SymbolTable getSymbolTable();
//	
//	public void setEnclosingScope(Scope _enclosingScope);
//	
//	public Scope getNextUpScope();
//	
//	public Scope getEnclosingScope();
//	
//	public Scope getGlobalScope();
//	
//	public void setNextUpScope(Scope _returnScope);

}