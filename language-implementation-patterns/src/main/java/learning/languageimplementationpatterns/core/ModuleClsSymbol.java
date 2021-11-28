package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class ModuleClsSymbol extends ScopeSymbol  implements ModuleSymbol, Type{

	public ModuleClsSymbol(PropertyList properties) {
		super(properties);
	}
}