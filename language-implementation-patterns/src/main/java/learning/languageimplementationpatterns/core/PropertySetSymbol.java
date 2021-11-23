package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class PropertySetSymbol extends ScopeSymbol implements ProcedureSymbol{

	public PropertySetSymbol(PropertyList _properties) {
		super(_properties);
	}
}