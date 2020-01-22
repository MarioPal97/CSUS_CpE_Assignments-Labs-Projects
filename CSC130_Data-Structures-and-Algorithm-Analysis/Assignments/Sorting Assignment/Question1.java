import java.util.Arrays;
import java.util.Scanner;
public class Question1 {
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
		insertionSort1(n,array);
		kb.close();
	}

	/*	Method creates a sorted array using insertion.
	 *  Takes in an Integer n as the array size and an 
	 *  Integer array as parameters.
	 *  Prints out the duplicated values until value 
	 *  that needs to be sorted is inserted into its correct place. 
	 */
    public static void insertionSort1(int n, int[] arr) {
		System.out.println(Arrays.toString(arr).replace("[", "").replace("]", "").replace(",", ""));
		int temp = 0;
		for (int i = 0; i < n - 1; i++) {
			int j = i + 1;
			if (arr[i + 1] < arr[i]) { 
				temp = arr[i+1];
				while (temp < arr[j-1]) { 
					arr[j] = arr[j-1];		//duplicates the value that is largest 
					System.out.println(Arrays.toString(arr).replace("[", "").replace("]", "").replace(",", ""));
					j--;
				}
				arr[j] = temp;		//inserts the value that needs to be sorted into array 
			} else {
				//do nothing;
			}
		}
		System.out.println(Arrays.toString(arr).replace("[", "").replace("]", "").replace(",", ""));
	}
}
