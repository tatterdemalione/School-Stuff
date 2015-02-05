import java.util.Scanner;
public class MultiplicationTable{

public static void main(String[] args){
	System.out.println("Input dimensions of multiplication table");
	Scanner keyboard = new Scanner(System.in); //make an instance of the Scanner object
	int input = keyboard.nextInt(); //save user input
	multiplicationTable(input);
} 


  /* Prints multiplication table */ 
    static void multiplicationTable(int n){
   for(int row = 0; row<n;row++){    
    
	for(int column=0;column<n;column++){
        	System.out.printf("%4d",row*column); //uses printf to convert the output to a decimal number
        }
    System.out.println(); //new line
   } 
  }

} //end of class

