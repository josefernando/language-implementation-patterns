package learning.languageimplementationpatterns.core.visualbasic6;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class VisualBasic6Systems {
   public static void main(String args[]) throws IOException {
      //Creating a File object for directory
      File directoryPath = new File("C:\\workspace\\antlr\\parser.visualbasic6\\src\\main\\resources\\VB_LIBRARY");
      //List of all files and directories
      File filesList[] = directoryPath.listFiles();
      System.out.println("List of files and directories in the specified directory:");
      Scanner sc = null;
      for(File file : filesList) {
         System.out.println("File name: "+file.getName());
         System.out.println("File path: "+file.getAbsolutePath());
         System.out.println("Size :"+file.getTotalSpace());
         //Instantiating the Scanner class
         sc= new Scanner(file);
         String input;
         StringBuffer sb = new StringBuffer();
         while (sc.hasNextLine()) {
            input = sc.nextLine();
            sb.append(input + System.lineSeparator());
         }
         System.out.println("Contents of the file: "+sb.toString());
         System.out.println(" ");
      }
   }
}