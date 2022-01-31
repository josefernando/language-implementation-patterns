package learning.languageimplementationpatterns.core;

public enum ParserToken {
	LIB("LIBRARY") , REMARKS("REMARKS"), ACCESS("ACCESS"); 
	
	String command;
	
	private ParserToken(String command) {
		this.command = command;
	}
	
	public String  getCommand() {
		return command;
	}
	
	public static void main(String[] args) {
		
		for(ParserToken p : ParserToken.values()) {
			System.err.println(p + " - " + p.getCommand());
		}
		
		ParserToken abs = ACCESS;
		switch(abs) {
		case  ACCESS: 
			System.err.println();
			break;
		case  REMARKS: System.err.println();
		case  LIB: System.err.println();


		break;
		}
	}
}