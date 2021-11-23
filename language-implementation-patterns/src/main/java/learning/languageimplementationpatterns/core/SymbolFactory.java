package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

public interface SymbolFactory {
	public abstract Symbol getSymbol(PropertyList _properties);
}