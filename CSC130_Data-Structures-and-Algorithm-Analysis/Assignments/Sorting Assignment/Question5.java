import java.util.Scanner;
import java.util.*;

public class Question5 {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
	    int n = in.nextInt();
	    int[] ar = new int[n];
	    for(int i=0;i<n;i++){
	    	ar[i]=in.nextInt();
	    }
	    int quickArray[] = quickSort(ar);
	    System.out.println(Arrays.toString(quickArray));
	    in.close();
	}
	
	/* Method that does a quick sort on an unsorted 
	 * array, does only one pivot.   
	 * Takes an Integer array as a parameter and 
	 * returns the quick sorted array. 
	 */
	public static int[] quickSort(int[] arr) {
		List<Integer> left = new ArrayList<>();		//java.util is being used so arrraylist can be used
		List<Integer> equal = new ArrayList<>();
		List<Integer> right = new ArrayList<>();
		int p = arr[0];
		if (arr.length == 0) {		//returns array if array size is zero
			return arr;
		} else {
			for (int i = 0; i < arr.length; i++) { 
				if (p > arr[i]) {
					left.add(arr[i]);
				} else if (p == arr[i]) { 
					equal.add(arr[i]);
				} else if (p < arr[i]) { 
					right.add(arr[i]);
				}
			}
		}
		
		//merging multiple arraylist into one
		List<Integer> merge = new ArrayList<>();
		merge.addAll(left);
		merge.addAll(equal);
		merge.addAll(right);
		for(int j = 0; j < arr.length; j++) { 	//adding merge arraylist into original array
			arr[j] = merge.get(j);
		}
		return arr;
 	}
}
