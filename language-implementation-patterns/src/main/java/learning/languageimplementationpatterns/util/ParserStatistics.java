package learning.languageimplementationpatterns.util;


import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class ParserStatistics {
	Map<String,Map<String,Integer>> statistics; 
	
	public ParserStatistics() {
		statistics =  new LinkedHashMap<String,Map<String,Integer>>();
	}
	
	public Map<String,Map<String,Integer>> getStatistics(){
		return statistics;
	}
	
	public int add(String id, String elementClass) {
		// id = CG_ATTR_NORMAL
		// elementClass = DEFVAR	
		statistics.putIfAbsent(elementClass, new LinkedHashMap<String,Integer>());
		Map<String,Integer> statElementClass = statistics.get(elementClass);
		statElementClass.putIfAbsent(id, 0);
		Integer elementClassNum = statElementClass.get(id);
		statElementClass.put(id, ++elementClassNum);
		return elementClassNum;
	}
	
	public boolean hasDuplicated() {
		for(Map<String,Integer> m : statistics.values()) {
		 for(Entry<String, Integer> e : m.entrySet()) {
			 if(e.getValue() > 1) return true;
		 }}
		return false;
	}
	
	public Map<String,Integer> sumByelementClass() {
		Map<String,Integer> totalByElement = new LinkedHashMap<String,Integer>();
		for(Entry<String, Map<String, Integer>> e : statistics.entrySet()) {
			int total = 0;
			for(Entry<String, Integer> k : e.getValue().entrySet()) {
				total = total + k.getValue();
			}
			totalByElement.put(e.getKey(), total);
		}
		return totalByElement;
	}
	
	public void print() {
		System.out.println(getStatistics());
		System.out.println(sumByelementClass());
	}
	
	@Override
	public boolean equals(Object obj) {
		if(this == obj) return true;
		if(!(obj.getClass().getName().equals(getClass().getName()))) return false;
		
//		String other = ((ParserInventory)obj).getInventory().toString();
//		return getInventory().toString().equals(other);
		ParserStatistics other = (ParserStatistics)obj;
		return getStatistics().equals(other.getStatistics());		
	}
}