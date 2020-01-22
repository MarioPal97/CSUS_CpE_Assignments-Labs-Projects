/*Mario Palacios 
  CSC 20 - 03 
  09 - 18 - 2018 
  Lab03
*/
public class TwoDArrays{
	static void print2D(int[][]A) {
      System.out.println();
      for(int m = 0; m < A.length; m++){
         for(int p = 0; p < A[m].length; p++){
            System.out.printf("%4d ", A[m][p]);
         }
         System.out.println();
      }
      System.out.println();
	}
	static int[][] add2Ds(int[][]A, int[][]B){
      int [][] sum = new int [A.length][A[0].length];
      for(int x = 0; x < A.length; x++){
         for(int y = 0; y < A[x].length; y++){
            sum[x][y] = A[x][y] + B[x][y];
         }
      }
      return sum;
	}
	static int[][] multiScalar2D(int scalar, int[][]A){
      int[][] multiply = new int [A.length][A[0].length];
      for(int h = 0; h < A.length; h++){
         for(int i = 0; i < A[h].length; i++){
            multiply[h][i] = A[h][i] * 5;
         }
      }
      return multiply;
	}
	static int[][] transpose2D(int[][]A) {
      int[][] B = new int[A[0].length][A.length];
      for(int w = 0; w < A.length; w++){
         for(int r = 0; r < A[w].length; r++){
            B[r][w] = A[w][r];
         }
      }
      return B;   
	}
	public static void main(String args[]) {
		int A[][] = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}};
		int B[][] = {{2, 4, 6, 8}, {10, 12, 14, 16}, {18, 20, 22, 24}};
                System.out.println("Mario Palacios test program\n");
 		System.out.println("A = ");
		print2D(A);
		System.out.println("B = ");
		print2D(B);
		System.out.println("A + B = ");
		print2D(add2Ds(A,B));
		System.out.println("5 X A = ");
		print2D(multiScalar2D(5,A));
		System.out.println("Transpose of A = ");
		print2D(transpose2D(A));
	}

}
