package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class PropertyGetSymbol extends ScopeSymbol implements ProcedureSymbol{

	public PropertyGetSymbol(PropertyList properties) {
		super(properties);
	}
}