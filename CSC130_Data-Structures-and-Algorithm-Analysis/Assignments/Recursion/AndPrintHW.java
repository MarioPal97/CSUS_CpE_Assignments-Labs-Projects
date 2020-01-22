/*Mario Palacios
  CSC 130 - 06
  01-29-2019
*/
import java.util.*;
public class AndPrintHW { 
	public static void andPrinter(int n) { 
		if (n / 10 > 0) { 
			andPrinter(n / 10);
		}	
		if (n / 10 != 0) {
			System.out.print("&" + n % 10);
		} else { 
			System.out.print(n % 10);
		}
	}		
	
	public static void main (String[] args) { 
		System.out.println("Please enter a number");
		Scanner kb = new Scanner(System.in);
		int number = kb.nextInt();
		andPrinter(number);
	}
}
/* Me, Rodrigo Lara, and Jaime Ulloa were working on this code together;
   sharing ideas and reviewing together.
*/
