package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class ModuleBasSymbol extends ScopeSymbol  implements ModuleSymbol{

	public ModuleBasSymbol(PropertyList properties) {
		super(properties);
	}
}