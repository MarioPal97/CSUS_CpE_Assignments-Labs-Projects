import java.util.Arrays;
import java.util.Random;
public class Question6 {
	public static void main (String[] args) { 
		Random r = new Random();
		int[] array = new int [100];
		for(int i = 0; i < 100; i++) { 
			array[i] = r.nextInt(100);
		}
		System.out.println(Arrays.toString(array));
		int countSort[] = countingSort(array);
		System.out.println(Arrays.toString(countSort));
	}
	/* Method counts the amount of times a value from 0 - 100
	 * randomly appears in an array. Keeps tally in separate
	 * array that increments by the index at that certain value 
	 * every time it appears. 
	 * Takes parameter of an Integer Array
	 * Prints out counter array
	 */
	public static int[] countingSort (int[] list) { 
		int[] counterArray = new int[100];
		for (int i = 0; i < 100; i++) {		//Creating the counter array
			counterArray[i] = 0;
		}
		for (int j = 0; j < list.length; j++) { 
			int t = list[j];
			counterArray[t] = counterArray[t] + 1;	//Incrementing index value of counting array
		}
		return counterArray;
	}
	
	/* Method used to help me figure out how to solve this question.
	 * Then realized you didn't need this, lol
	 * 
	public static int findMax (int[] arr) { 
		int max = 0;
		for(int i = 0; i < arr.length; i++) { 
			if (arr[i] > max) { 
				max = arr[i];
			}
		}
		return max;
	} */

}
