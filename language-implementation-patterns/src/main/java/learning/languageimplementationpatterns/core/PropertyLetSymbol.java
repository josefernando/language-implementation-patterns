package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class PropertyLetSymbol extends ScopeSymbol implements ProcedureSymbol{

	public PropertyLetSymbol(PropertyList _properties) {
		super(_properties);
	}
}