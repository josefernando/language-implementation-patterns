package learning.languageimplementationpatterns.core;

import br.com.recatalog.util.PropertyList;

/*
 * Inclui dependências incluídas nas declarações de projetos.
 * Ex.: vbp (Visual Basic), maven (Java), etc ...
 */
public class DependencyScope extends OnlyScopeSymbol {

	public DependencyScope(Scope scope, PropertyList properties) {
		super(properties);
	}
}