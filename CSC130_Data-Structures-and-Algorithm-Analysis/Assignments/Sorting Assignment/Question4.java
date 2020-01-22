/* After realizing Question 3 code does the insertion sort 
 * needed to solve Question 4. I used it to implement 
 * the counter needed to solve this question.
 */
import java.util.Scanner;
public class Question4 {
	
	/*	Method keeps track of how many times 
	 *  a value is shifted until it is fully sorted.
	 *  Takes in parameter of an Integer Array. 
	 *  Outputs count of shifts done. 
	 */
	public static int insertionSortCount(int[] arr){
		int count = 0;
		for(int i = 1; i < arr.length; i++) {
			int value = arr[i];
	        int j = i - 1;
	        while(j >= 0 && arr[j] > value) {
	        	arr[j + 1] = arr[j];
	        		j = j - 1;
	        		count++;		//counts the number of shifts per iteration
	            }
	            arr[j + 1] = value;
		}
		return count++;
	}
	
	//Takes parameter of an Integer Array and prints it out
	static void printArray(int[] ar) {
		for(int n: ar) {
			System.out.print(n+" ");
	    }
	}
	    
	public static void main(String[] args) {
		Scanner kb = new Scanner(System.in);
	    int n = kb.nextInt();
	    int[] ar = new int[n];
	    for(int i=0;i<n;i++){
	    	ar[i]=kb.nextInt();
	    }
	    System.out.print(insertionSortCount(ar));
	    kb.close();
	}
}
