package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class ApplicationScope extends OnlyScopeSymbol {
	
	public ApplicationScope(Scope scope, PropertyList properties) {
		super(properties);
	}
}