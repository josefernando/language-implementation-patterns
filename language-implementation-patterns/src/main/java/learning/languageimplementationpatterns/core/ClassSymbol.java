package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class ClassSymbol extends ScopeSymbol implements Type{

	public ClassSymbol(PropertyList properties) {
		super(properties);
	}
}