package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

//Standar Module  utilizado no .Net
public class ModuleStdSymbol extends ScopeSymbol implements ModuleSymbol{

	public ModuleStdSymbol(PropertyList properties) {
		super(properties);
	}
}