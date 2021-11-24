package learning.languageimplementationpatterns.core;

import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;

import learning.languageimplementationpatterns.core.Symbol;
import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.PropertyList;

public interface SymbolTable {
	
	public Scope getGlobalScope();
    
    public SymbolFactory getSymbolFactory() ;
    
    public PropertyList getProperties();
	
	public ContextData addContextData(ParserRuleContext ctx);
	
	public ContextData getContextData(ParserRuleContext ctx);
	
	public void addTreeToModule(ParseTree tree, Symbol sym);
	public Map<ParseTree, Symbol> getTreeToModule();
	
	public void addModuleToTree(String moduleName, ParseTree tree);
	public Map<String, ParseTree> getModuleToTree();
	
	public IdentityHashMap<ParserRuleContext, List<String>> getModifierMap() ;
	
	public Map<Symbol,ContextData> getWhereDefined();
	
	public ContextData getDefinedSymbol(Symbol sym);
	
	public void addDefinedSymbol(Symbol sym);
}
