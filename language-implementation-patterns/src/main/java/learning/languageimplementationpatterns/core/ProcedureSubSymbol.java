package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public class ProcedureSubSymbol extends ScopeSymbol implements ProcedureSymbol{

	public ProcedureSubSymbol(PropertyList properties) {
		super(properties);
	}
}