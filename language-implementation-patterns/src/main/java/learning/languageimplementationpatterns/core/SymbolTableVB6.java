package learning.languageimplementationpatterns.core;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;

import br.com.recatalog.util.BicamSystem;
import br.com.recatalog.util.PropertyList;

public class SymbolTableVB6 implements SymbolTable {
	PropertyList properties;
	Scope  globalScope;
	Language language;
	
	IdentityHashMap<ParserRuleContext, ContextData> contextDataMap;
	
	SymbolFactory symbolFactory;
	
	IdentityHashMap<Symbol, ArrayList<ParserRuleContext>> whereUsed; 
	IdentityHashMap<Symbol, ArrayList<ContextData>> whereUsedCdt; 
	IdentityHashMap<ParserRuleContext, Symbol> moduleMap;
	IdentityHashMap<ParseTree, Symbol> treeToModuleMap;
	IdentityHashMap<String, ParseTree> moduleToTreeMap;
	IdentityHashMap<ParserRuleContext, List<String>> modifierMap;


	public SymbolTableVB6() {
		symbolFactory = new SymbolFactoryVb6();
		properties = new PropertyList();
		
		PropertyList prop = new PropertyList();
		prop.addProperty("NAME", "GLOBAL");
		prop.addProperty("SYMBOL_TABLE", this);
		prop.addProperty("SCOPE", null);
		prop.addProperty("SYMBOL_FACTORY", symbolFactory);
//		prop.addProperty("LANGUAGE", language);

		this.globalScope = new GlobalScope(prop);
		
		PropertyList propLanguage = new PropertyList();
		propLanguage.addProperty("CASE_SENSITIVE", false);
		propLanguage.addProperty("SYMBOL_TABLE", this);
		
		language = new LanguageVb6(propLanguage);
		
		this.properties.addProperty("LANGUAGE", language);
		getGlobalScope().getProperties().addProperty("LANGUAGE", language);

		contextDataMap = new IdentityHashMap<ParserRuleContext, ContextData>();
		whereUsed   = new IdentityHashMap<Symbol, ArrayList<ParserRuleContext>>();
		whereUsedCdt = new IdentityHashMap<Symbol, ArrayList<ContextData>>(); 
		moduleMap = new IdentityHashMap<ParserRuleContext, Symbol>();
		treeToModuleMap = new IdentityHashMap<ParseTree, Symbol>() ;
		moduleToTreeMap = new IdentityHashMap<String, ParseTree>() ;
		modifierMap = new IdentityHashMap<ParserRuleContext, List<String>>();
	}
	
	public Scope getGlobalScope() {
		return globalScope;
	}
    
    public SymbolFactory getSymbolFactory() {
    	return symbolFactory;
    }

	@Override
	public PropertyList getProperties() {
		return properties;
	}
	
	@Override
	public ContextData addContextData(ParserRuleContext ctx) {
		if(getContextData(ctx) != null) {
			BicamSystem.printLog("ERROR", String.format("CTD already exists in line %d at position %d", ctx.start.getLine(), ctx.start.getCharPositionInLine()));
		}
		contextDataMap.put(ctx, new ContextData(ctx));
        return getContextData(ctx);
	}

	@Override
	public void addTreeToModule(ParseTree tree, learning.languageimplementationpatterns.core.Symbol sym) {
		treeToModuleMap.put(tree, sym);
	}
	
	@Override
	public void addModuleToTree(String moduleName, ParseTree tree) {
		moduleToTreeMap.put(moduleName, tree);
	}

	@Override
	public Map<ParseTree, Symbol> getTreeToModule() {
		return treeToModuleMap;
	}

	@Override
	public Map<String, ParseTree> getModuleToTree() {
		return moduleToTreeMap;
	}	
	
	@Override
	public ContextData getContextData(ParserRuleContext ctx) {
		return contextDataMap.get(ctx);
	}
	
	@Override
	public IdentityHashMap<ParserRuleContext, List<String>> getModifierMap() {
		return modifierMap;
	}
    
    public String toString() {
    	return globalScope.toString();
    }

    public static void main(String[] args) {
    	SymbolTableVB6 st = new SymbolTableVB6();
    	System.err.println(st.toString());
    }
}