import java.util.Scanner;
public class MultiplicationTable{

public static void main(String[] args){
	System.out.println("Input dimensions of multiplication table");
	Scanner keyboard = new Scanner(System.in); //make an instance of the Scanner object
	int input = keyboard.nextInt(); //save user input
	multiplicationTable(input);
} 


  /* Prints out an aesthetically pleasing multiplication table, up to about 30x30 */ 
	static void multiplicationTable(int n)
	{
   		int diff = 0;
		System.out.printf("%6d", 0);
   		for(int i=1;i<n;i++){
   			System.out.printf("%4d",i);
   		}	
   		System.out.println();
   		for(int i=0;i<(n*8);i++){
   			System.out.print("_");
   		}
   		System.out.println();
   		for(int row = 0; row<n;row++){ 
			System.out.print(diff + " " + "|");
			diff++;   
			for(int column=0;column<n;column++){
        			System.out.printf("%4d",row*column); //uses printf to print the output evenly spaced        		
			}
    			System.out.println(); //new line
   		} 
  	}

} //end of class
