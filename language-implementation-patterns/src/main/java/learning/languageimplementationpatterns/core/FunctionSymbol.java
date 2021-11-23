package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class FunctionSymbol extends ScopeSymbol implements DeclaredProcedure{

	public FunctionSymbol(PropertyList _properties) {
		super(_properties);
	}
}
