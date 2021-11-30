package learning.languageimplementationpatterns.core;

import org.antlr.v4.runtime.ParserRuleContext;

import br.com.recatalog.util.PropertyList;

public class SymbolFactoryVb6 implements SymbolFactory{
	public static final String PRIMITIVE_TYPE = "PRIMITIVE_TYPE";
	public static final String LIB = "LIB";
	public static final String FORM = "FORM";
	public static final String FORM_CONTROL = "FORM_CONTROL";
	public static final String MODULE_FRM = "MODULE_FRM";
	public static final String MODULE_CLS = "MODULE_CLS";
	public static final String MODULE_BAS = "MODULE_BAS";
	
	public static final String LABEL = "LABEL";
	public static final String LABEL_LINE_NUMBER = "LABEL_LINE_NUMBER";

	public static final String PROCEDURE_SUB = "PROCEDURE_SUB";
	public static final String PROCEDURE_FUNCTION = "PROCEDURE_FUNCTION";
	public static final String PROCEDURE_PROPERTY_GET = "PROCEDURE_PROPERTY_GET";
	public static final String PROCEDURE_PROPERTY_LET = "PROCEDURE_PROPERTY_LET";
	public static final String PROCEDURE_PROPERTY_SET = "PROCEDURE_PROPERTY_SET";
	
//	public static final String VARIABLE_FORMAL_PARAMETER = "VARIABLE_FORMAL_PARAMETER";
	public static final String VARIABLE = "VARIABLE";

	public static final String GUI_PROPERTY = "GUI_PROPERTY";

	public static final String DECLARED_FUNCTION = "DECLARED_FUNCTION";
	public static final String DECLARED_SUB = "DECLARED_SUB";
	
	public static final String TYPE = "TYPE";
	public static final String ENUM = "ENUM";

	
	@Override
	public Symbol getSymbol(PropertyList _properties) {
		String symType = (String)_properties.getProperty("SYMBOL_TYPE").toString();
		PropertyList symbolProperties = (PropertyList)_properties.mustProperty("SYMBOL_PROPERTIES");
		switch (symType){
	        case PRIMITIVE_TYPE:
	    	return createPrimitiveTypeSymbol(symbolProperties);	
//	        case CLASS:
//	    	return createClassSymbol(_properties);
	        case VARIABLE:
	    	return createVariableSymbol(symbolProperties);
//	        case FUNCTION:
//	    	return createFunctionSymbol(_properties);	    	
	        case LIB:
	    	return createLibSymbol(symbolProperties);
	
	        case FORM:
	    	return createFormSymbol(symbolProperties);
	    	
	        case FORM_CONTROL:
	    	return createFormControlSymbol(symbolProperties);
	    	
	        case GUI_PROPERTY:
	    	return createGuiPropertySymbol(symbolProperties);
	    	
//	        case IMPLICIT:
//	    	return createImplicitSymbol(_properties);
			case MODULE_FRM:
				return createModuleFrmSymbol(symbolProperties);
			case MODULE_CLS:
				return createModuleClsSymbol(symbolProperties);	
			case MODULE_BAS:
				return createModuleBasSymbol(symbolProperties);
			case PROCEDURE_SUB:
				return createProcedureSubSymbol(symbolProperties);	
			case PROCEDURE_FUNCTION:
				return createProcedureFunctionSymbol(symbolProperties);
			case PROCEDURE_PROPERTY_GET:
				return createPropertyGetSymbol(symbolProperties);	
			case PROCEDURE_PROPERTY_LET:
				return createPropertyLetSymbol(symbolProperties);
				
			case DECLARED_FUNCTION:
				return createDeclaredFunctionSymbol(symbolProperties);
			case DECLARED_SUB:
				return createDeclaredSubSymbol(symbolProperties);
				

//			case TYPE:
//				return createTypeSymbol(symbolProperties);
				
			case ENUM:
				return createEnumSymbol(symbolProperties);				
				
			case PROCEDURE_PROPERTY_SET:
				return createPropertySetSymbol(symbolProperties);
//			case VARIABLE_FORMAL_PARAMETER:
//				return createVariableSymbol(symbolProperties);	
				
//			case MODULE_FRM:
//				return createModuleFrmSymbol(_properties);
//			case MODULE_BAS:
//				return createModuleBasSymbol(_properties);
//			case MODULE_CLS:
//				return createModuleClsSymbol(_properties);				
//			case BUILTIN:
//				return createBuiltinSymbol(_properties);
			case TYPE:
				return createTypeSymbol(symbolProperties);
//			case ENUM:
//				return createEnumSymbol(_properties);
//			case GUI:
//				return createGuiSymbol(_properties);
//			case GUI_ATTRIBUTE:
//				return createGuiAttributeSymbol(_properties);	
//			case GUI_PROPERTY:
//				return createGuiPropertySymbol(_properties);				
//			case METHOD:
//				return createMethodSymbol(_properties);
			case LABEL:
				return createLabelSymbol(symbolProperties);	
			case LABEL_LINE_NUMBER:
				return createLabelLineNumberSymbol(symbolProperties);				
//			case STORED_PROCEDURE:
//				return createStoredProcedureSymbol(_properties);				
//			case GLOBAL_SCOPE: // è tratadp como symbol...
//				return createGlobalScope(_properties);				
//			case VISIBILITY_SCOPE: // è tratadp como symbol...
//				return createVisibilityScope(_properties);				
		default:
			throw new RuntimeException("** Error*** - Invalid Symbol type to create: "  
					+ ((ParserRuleContext)_properties.getProperty("CONTEXT")).getClass().getSimpleName()
					+ " SymbolType: " + symType);			
		}
	}
	
	private Symbol createModuleFrmSymbol(PropertyList propreties) {
		return new ModuleFrmSymbol(propreties);
	}
	
	private Symbol createModuleClsSymbol(PropertyList propreties) {
		return new ModuleClsSymbol(propreties);
	}
	
	private Symbol createModuleBasSymbol(PropertyList propreties) {
		return new ModuleBasSymbol(propreties);
	}
	
	private Symbol createVariableSymbol(PropertyList propreties) {
		return new VariableSymbol(propreties);
	}
	
	private Symbol createPrimitiveTypeSymbol(PropertyList propreties) {
		return new PrimitiveTypeSymbol(propreties);
	}
	
	private Symbol createFormSymbol(PropertyList propreties) {
		return new FormSymbol(propreties);
	}	
	
	private Symbol createFormControlSymbol(PropertyList propreties) {
		return new FormControlSymbol(propreties);
	}	
	
	private Symbol createClassSymbol(PropertyList propreties) {
		return new ClassSymbol(propreties);
	}
	
	private Symbol createLibSymbol(PropertyList propreties) {
		return new LibSymbol(propreties);
	}
	
	private Symbol createProcedureSubSymbol(PropertyList propreties) {
		return new ProcedureSubSymbol(propreties);
	}
	
	private Symbol createProcedureFunctionSymbol(PropertyList propreties) {
		return new ProcedureFunctionSymbol(propreties);
	}
	
	private Symbol createPropertyGetSymbol(PropertyList propreties) {
		return new PropertyGetSymbol(propreties);
	}
	
	private Symbol createPropertyLetSymbol(PropertyList propreties) {
		return new PropertyLetSymbol(propreties);
	}
	
	private Symbol createPropertySetSymbol(PropertyList propreties) {
		return new PropertySetSymbol(propreties);
	}	
	
	private Symbol createDeclaredFunctionSymbol(PropertyList propreties) {
		return new FunctionSymbol(propreties);
	}
	
	private Symbol createDeclaredSubSymbol(PropertyList propreties) {
		return new SubSymbol(propreties);
	}
	
	private Symbol createTypeSymbol(PropertyList propreties) {
		return new TypeSymbol(propreties);
	}
	
	private Symbol createEnumSymbol(PropertyList propreties) {
		return new EnumSymbol(propreties);
	}
	
	private Symbol createGuiPropertySymbol(PropertyList propreties) {
		return new GuiPropertySymbol(propreties);
	}	
	
	private Symbol createLabelSymbol(PropertyList propreties) {
		return new LabelSymbol(propreties);
	}
	
	private Symbol createLabelLineNumberSymbol(PropertyList propreties) {
		return new LabelLineNumberSymbol(propreties);
	}
}