package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class TypeSymbol extends ScopeSymbol implements Type{

	public TypeSymbol(PropertyList _properties) {
		super(_properties);
	}
}
