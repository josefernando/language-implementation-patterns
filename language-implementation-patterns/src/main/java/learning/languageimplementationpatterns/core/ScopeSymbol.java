package learning.languageimplementationpatterns.core;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Supplier;
import java.util.stream.Stream;

import org.antlr.v4.runtime.ParserRuleContext;

import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.PropertyList;

public  abstract class ScopeSymbol extends Symbol implements Scope {
//	SymbolTable symbolTable;
//	Scope globalScope;
//	Scope scope;
//	Scope enclosingScope;
//	Scope parentScope; // Super Type se for classe
	
	ScopeSymbolList symbols; 
	
	public ScopeSymbol(PropertyList _properties) {
		super(_properties);
//		this.symbolTable = (SymbolTable) properties.getProperty("SYSTEM_TABLE");
		this.symbols = new ScopeSymbolList();
	}
	
	@Override
	public void setEnclosingScope(Scope _enclosingScope) {
		this.enclosingScope = _enclosingScope;
	}
	
//	@Override
//	public Scope getParentScope() {
//		if(this.nextUpScope != null) {
//			return this.nextUpScope;
//		}
//		else return enclosingScope;
//	}
	
//	@Override
//	public void setNextUpScope(Scope _nextUpScope) {
//		this.nextUpScope = _nextUpScope;
//	}	
	
	@Override
	public Scope getEnclosingScope() {
//		if(this.enclosingScope == null) return this.parentScope;
		return this.enclosingScope;
	}

	@Override
	public Symbol resolve(PropertyList _properties) {
		String nameToResolve = (String)_properties.getProperty("NAME_TO_RESOLVE");
		String nameToResolve1 = (String)_properties.getProperty("NAME_TO_RESOLVE");
		
		List<String> nameToResolveParts = Arrays.asList(nameToResolve.split("\\."));
		
		if(nameToResolveParts.size() > 1) {
//			nameToResolve = nameToResolve.substring(0,
//					nameToResolve.lastIndexOf("."));
			
			PropertyList propertiesCopy = _properties.getCopy();
			propertiesCopy
				.addProperty("NAME_TO_RESOLVE", nameToResolve.substring(0,nameToResolve.lastIndexOf(".")));
			Scope symbolScope = (Scope)resolve(propertiesCopy);
			
			if(symbolScope == null) return null;
			
			
			_properties.addProperty("NAME_TO_RESOLVE_MEMBER", nameToResolveParts.get(nameToResolveParts.size()-1));
			return symbolScope.resolveMember(_properties);
		}

// Por que usar Supplier ?
// https://www.baeldung.com/java-stream-operated-upon-or-closed-exception		
		
		Stream<Symbol> e = symbols.get(nameToResolve1);
		
		if(e == null) {
			return getScope().resolve(_properties);
		}
		
		Supplier<Stream<Symbol>> streamSupplier 
		  = () -> symbols.get(nameToResolve1);
		  
		  if (streamSupplier.get().toArray().length == 1) {
			    Symbol s = streamSupplier.get().findFirst().get();
			    	s.addUsedSymbol((ParserRuleContext)_properties.getProperty("CONTEXT"));
//				return streamSupplier.get().findFirst().get();
				return s;

		  }		
		  else if(streamSupplier.get().toArray().length > 1) {
			ParserRuleContext ctx = (ParserRuleContext)_properties.getProperty("CONTEXT");
			int line = ctx.getStart().getLine();
			int positionInLine = ctx.getStart().getCharPositionInLine();
			String moduleName = (String) _properties.mustProperty("MODULE_NAME");
			BicamSystem.printLog("ERROR", "Duplicated symbol not resolved: " 
			                     + nameToResolve + " module name: " 
					             + moduleName + " line: " + line
					             + " position: " + positionInLine);
		}
		return null;
	}
	
	@Override
	public Symbol resolveMember(PropertyList _properties) {
		String name = (String) _properties.getProperty("NAME_TO_RESOLVE_MEMBER");
		// Por que usar Supplier ?
		// https://www.baeldung.com/java-stream-operated-upon-or-closed-exception		
				
				Stream<Symbol> e = symbols.get(name);
				
				if(e == null) {
					return null;
				}
				
				Supplier<Stream<Symbol>> streamSupplier 
				  = () -> symbols.get(name);
				  
				  if (streamSupplier.get().toArray().length == 1) {
					  Symbol s = streamSupplier.get().findFirst().get();
					  s.addUsedSymbol((ParserRuleContext)_properties.getProperty("CONTEXT"));
//						return streamSupplier.get().findFirst().get();
					  return s;
				  }		
				  else if(streamSupplier.get().toArray().length > 1) {
					ParserRuleContext ctx = (ParserRuleContext)_properties.getProperty("CONTEXT");
					int line = ctx.getStart().getLine();
					int positionInLine = ctx.getStart().getCharPositionInLine();
					String moduleName = (String) _properties.mustProperty("MODULE_NAME");
					BicamSystem.printLog("ERROR", "Duplicated symbol not resolved: " 
					                     + name + " module name: " 
							             + moduleName + " line: " + line
							             + " position: " + positionInLine);
				}
				return null;
	}

	@Override
	public void define( Symbol _sym) {
		symbols.add(_sym);
		_sym.setScope(this);
	}
	
//	@Override
//	public SymbolTable getSymbolTable() {
//		return symbolTable;
//	}
	
	
//	@Override
//	public Scope getGlobalScope() {
//		return globalScope;
//	}
	
	public String toString() {
		StringBuilder sb = new StringBuilder();
		if(symbols.getSymbols().size() > 0) {
			sb.append(super.toString());
//			sb.append("|-->> " + getName() + " - " + getClass().getSimpleName() + System.lineSeparator());
			
			for(Entry<String, Map<String, Symbol>> entry : symbols.getEntries()) {
				Map<String, Symbol> symbolsx = entry.getValue();
	/**
	 * Entendendo "((?im)^)", ".."
	 * Inclui identação ".." em cada linha de sb
	 */
				for(Entry<String,Symbol> e : symbolsx.entrySet()) {
					sb.append(e.getValue().toString().replaceAll("((?im)^)", ".."));

				}
			}
		}
		else {
//			sb.append("|.." + getName() + " - " + getClass().getSimpleName() + System.lineSeparator());
			sb.append(super.toString());
		}
		return sb.toString();
	}	
}