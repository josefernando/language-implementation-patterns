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
	List<Symbol> symbolDuplicatedList;
	
	public ScopeSymbolList() {
		symbols = new LinkedHashMap<String,Map<String,Symbol>>();
		symbolDuplicatedList = new LinkedList<>();
	}
	
	public void add(Symbol _sym) {
	if(isDuplicated(_sym))	{
		return;
	}
	
	Map<String,Symbol> symMap = symbols.get(_sym.getName());
	if(symMap == null) {
		symMap = new LinkedHashMap<String,Symbol>();
		symbols.put(_sym.getName(), symMap);
	}

	if(symMap.put(_sym.getClass().getSimpleName(), _sym) != null) {
		BicamSystem.printLog("ERROR", "Símbolo já existe neste escopo em add: " +  _sym.getName() + "/"  + _sym.getScope().getName());
	}
}	
	
	private Boolean isDuplicated(Symbol _sym) {
		for(Symbol s : symbolDuplicatedList) {
			if(_sym.equals(s)) { 
				symbolDuplicatedList.add(_sym); 
				BicamSystem.printLog("DEBUG", "Símbolo já existe neste escopo duplicated1: " +  _sym.getName() + "/"  + _sym.getScope().getName());
			}
			return true;
		}
		
		Map<String,Symbol> symMap = symbols.get(_sym.getName());
		if(symMap == null) return false;
		
		Symbol symInList = symMap.get(_sym.getClass().getSimpleName());
		if(symInList == null) {
			return false;
		}
		
		// Array de controles de formulário
		if(symInList.getProperties().hasProperty("CATEGORY", "FORM")) {
			return true; 
		}
		
		symbolDuplicatedList.add(symInList);
		symMap.remove(symInList.getClass().getSimpleName());
		
		symbolDuplicatedList.add(_sym);
		BicamSystem.printLog("DEBUG", "Símbolo já existe neste escopo duplicated2: " +  _sym.getName() + "/"  + _sym.getScope().getName());
		
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