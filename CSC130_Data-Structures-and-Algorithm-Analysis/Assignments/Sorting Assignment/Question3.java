import java.util.*;
public class Question3 {
	
	/* Method that sorts an array by insertion
	 * Takes in Integer Array as its parameter 
	 * Prints of the sorted array
	 */
	public static void insertionSort(int[] array){
		for(int i = 1; i < array.length; i++){
			int value = array[i];
	        int j = i - 1;
	        //did not have an equals sign, was j > 0 which does not touch zero at all, starts at 1
	        while(j >= 0 && array[j] > value){ 
	        	array[j + 1] = array[j];
	        		j = j - 1;
	            }
	            array[j + 1] = value;
	            printArray(array);
		}
		printArray(array);
	}

	static void printArray(int[] ar) {
		for(int n: ar){
			System.out.print(n + " ");
	    }
	}
	    
	public static void main(String[] args) {
		Scanner kb = new Scanner(System.in);
	    int n = kb.nextInt();
	    int[] ar = new int[n];
	    for(int i=0;i<n;i++){
	    	ar[i]=kb.nextInt();
	    }
	    insertionSort(ar);
	    kb.close();
	}
}
