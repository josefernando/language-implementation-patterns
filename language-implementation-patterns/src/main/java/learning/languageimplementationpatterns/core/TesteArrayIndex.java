package learning.languageimplementationpatterns.core;

public class TesteArrayIndex {

	public static void main(String[] args) {
		String[][] a = {
					{"NAME","SCOPE","CONTEXT","LANGUAGE"},
					{"String","Scope","ParserRuleContext","Language"}};
		for(int i = 0; i < a[1].length ; i++) {
			System.err.println(a[1][i]);
		}
	}


}
