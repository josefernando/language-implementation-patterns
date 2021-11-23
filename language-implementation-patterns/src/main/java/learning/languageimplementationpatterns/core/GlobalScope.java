package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class GlobalScope extends OnlyScopeSymbol {

	public GlobalScope(PropertyList properties) {
		super(properties);
	}
	
	public static void main(String[] args) {
		PropertyList properties = new PropertyList();
		properties.addProperty("NAME", "GLOBAL");
		properties.addProperty("SCOPE", null);

		Scope global = new GlobalScope(properties );
		
		System.err.println(global.toString());
	}
}