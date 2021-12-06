	package learning.languageimplementationpatterns.core;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Stream;

import br.com.recatalog.util.BicamSystem;

public class ScopeSymbolList {
	Map<String, Map<String,Symbol>> symbols;
	List<Symbol> duplicatedList;
	
	public ScopeSymbolList() {
		symbols = new LinkedHashMap<String,Map<String,Symbol>>();
		duplicatedList = new LinkedList<>();
	}
	
//	public void add(Symbol _sym) {
//		Map<String,Symbol> symMap = symbols.get(_sym.getName());
//		if(symMap == null) {
//			symMap = new LinkedHashMap<String,Symbol>();
//			symbols.put(_sym.getName(), symMap);
//			symMap.put(_sym.getClass().getSimpleName(), _sym);
//		}
//		else if(symMap.get(_sym.getClass().getSimpleName()) == null) {
//			if(!isDuplicated(_sym))
//			symMap.put(_sym.getClass().getSimpleName(), _sym);
//		}
//		else {
//			duplicatedList.add(_sym);
//			BicamSystem.printLog("WARNING", "Símbolo já existe neste escopo: " +  _sym.getName() + "/"  + _sym.getScope().getName());
//		}
//	}
	
	public void add(Symbol _sym) {
	if(isDuplicated(_sym))	{
		return;
	}
	
	Map<String,Symbol> symMap = symbols.get(_sym.getName());
	if(symMap == null) {
		symMap = new LinkedHashMap<String,Symbol>();
		symbols.put(_sym.getName(), symMap);
//		symMap.put(_sym.getClass().getSimpleName(), _sym);
	}

	if(symMap.put(_sym.getClass().getSimpleName(), _sym) != null) {
		BicamSystem.printLog("ERROR", "Símbolo já existe neste escopo: " +  _sym.getName() + "/"  + _sym.getScope().getName());
	}
}	
	
	private Boolean isDuplicated(Symbol _sym) {
		for(Symbol s : duplicatedList) {
			if(_sym.equals(s)) { 
				duplicatedList.add(_sym); 
				BicamSystem.printLog("DEBUG", "Símbolo já existe neste escopo: " +  _sym.getName() + "/"  + _sym.getScope().getName());
			}
			return true;
		}
		
		Map<String,Symbol> symMap = symbols.get(_sym.getName());
		if(symMap == null) return false;
		
		Symbol symInList = symMap.get(_sym.getClass().getSimpleName());
		if(symInList == null) {
			return false;
		}
		
		duplicatedList.add(symInList);
		symMap.remove(symInList.getClass().getSimpleName());
		
		duplicatedList.add(_sym);
		BicamSystem.printLog("DEBUG", "Símbolo já existe neste escopo: " +  _sym.getName() + "/"  + _sym.getScope().getName());
		
		return true;
	}

	public Stream<Symbol> get(String _name, String... _category) {
		Map<String,Symbol> symMap = symbols.get(_name);
		if(symMap != null && symMap.size() > 0) return symMap.values().stream();
		return null;
	}
	
	public Map<String, Map<String,Symbol>> getSymbols(){
		return symbols;
	}
	
	public Set<Entry<String, Map<String, Symbol>>> getEntries(){
		return symbols.entrySet();
	}
}