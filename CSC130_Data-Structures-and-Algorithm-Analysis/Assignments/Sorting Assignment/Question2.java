/* After realizing Question 3 code does the insertion sort 
 * needed to solve Question 2, I used it to solve Question 3. 
 * What needed to be moved was the print Statement. 
 */
import java.util.Arrays;
import java.util.Scanner;
public class Question2 {
	public static void main(String[] args) {
		Scanner kb = new Scanner(System.in);
		System.out.println("Enter array bound");
		int n = kb.nextInt();
		int[] array = new int[n];
		System.out.println("Enter array Values");
		for (int i = 0; i < n; i++) {
            int j = kb.nextInt();
            array[i] = j;
        }
		insertionSort2(n,array);
		kb.close();
	}

	/*	Method creates a sorted array using insertion.
	 *  Takes in an Integer n as the array size and an 
	 *  Integer array as parameters.
	 *  Prints out the array as it is being sorted. 
	 */
    public static void insertionSort2(int n, int[] arr) {
    	for(int i = 1; i < arr.length; i++){
            int value = arr[i];
            int j = i - 1;
            while(j >= 0 && arr[j] > value) { 
                arr[j + 1] = arr[j];
                    j = j - 1;
                }
                arr[j + 1] = value;
                System.out.println(Arrays.toString(arr).replace("[", "").replace("]", "").replace(",", ""));
        }
    }
    
    /* Take parameter of an Integer Array and prints it out
     * Didn't need this because of the replace I do in the print statement 
     * 
    static void printArray(int[] ar) {
		for(int n: ar){
			System.out.print(n + " ");
	    }
	}*/
}
