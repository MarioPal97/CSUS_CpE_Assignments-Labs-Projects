/*Mario Palacios
 * Jaime Ulloa 
 * Rodrigo Lara
 * CSC 130 - 06
 * 04/09/2019 
 */

import java.util.*;

public class BstTree {

	public BNode root;
	
	public static class BNode {
		int element;		//The data in the node
		BNode left;		 	//Left child 
		BNode right;		//Right child 
		int height;			//height
		
		//Constructors
		BNode (int theElement) { 
			this(theElement, null, null);
		}
		
		BNode (int theElement, BNode lt, BNode rt) {
			element = theElement;
			left = lt;
			right = rt;
			height = 0;
		}
	}
	
	/*internal method to insert into a subtree
	 * x = value to insert 
	 * t = node that roots the subtree 
	 * return new root of the subtree 
	 */
	protected BNode insert(int x, BNode t) { 
		if (t == null) { 
			return new BNode (x, null, null);
		}		
		if (x < t.element) { 
			t.left = insert(x, t.left);
		} else if (x > t.element) { 
				t.right = insert(x, t.right);
		} else {
			//Duplicate, do nothing 
		}
		return t;
	}
	
	/*Internal method to remove from subtree 
	 * x = value to remove 
	 * t = node that roots the subtree
	 * return the new root of the subtree
	 */
	protected BNode remove(int x, BNode t) { 
		if (t == null) { 
			return t;		//Item not found; do nothing 
		}
		if (x < t.element) {
			t.left = remove(x, t.left);
		} else if (x > t.element) { 
			t.right = remove(x, t.right);
		} else if (t.left != null && t.right != null) { 
			t.element = findMin(t.right).element;
			t.right = remove(t.element, t.right);
		} else { 
			t = (t.left != null) ? t.left : t.right;
		}
		return t;
	}
	
	/*Internal method to compute height of subtree
	 * t = node that roots the subtree 
	 */
	protected int height(BNode t) { 
		if (t == null) return 0;
		else {
			int lDepth = height(t.left);
			int rDepth = height(t.right);
			
			if(lDepth> rDepth) {
				return (lDepth + 1);
			}
			else {
				
				return (rDepth + 1);
			}
		}
	}
	
	/*Internal method to find a number in a subtree 
	 * x = the number to search for 
	 * t = the node that roots the subtree
	 * returns node containing the matched number 
	 */
	protected boolean contains(int x, BNode t) { 
		if (t == null) { 
			return false;
		} 
		if (x < t.element) { 
			return contains(x, t.left);
		} else if (x > t.element) { 
				return contains(x, t.right);
		} else { 
				return true; 			//Match Found
		}
	}
	
	/*Internal method to find the smallest number in a subtree
	 * t = node that roots the subtree 
	 * returns node containing the smallest tree
	 */
	private BNode findMin(BNode t) { 
		if (t == null) { 
			return null;
		} else if (t.left == null) { 
				return t;
		} 
		return findMin(t.left);
	}
	
	/*Internal method to find the largest number in a subtree
	 * t = node that roots the subtree
	 * returns node containing the largest value 
	 */
	private BNode findMax(BNode t) { 
		if(t != null) { 
			while (t.right != null) { 
				t = t.right;
			}
		}
		return t; 
	}
	
	/*Internal method to print a subtree in sorted order.
	 * t = node that roots the subtree
	 */
	private void printTree(BNode t) { 
		if (t != null) { 
			printTree(t.left);
			System.out.print(t.element + " ");
			printTree(t.right);
		}
	}
	
	public int height() {
		return height(root);
	}
	/* Test if the tree is logically empty 
	 * returns true if empty, false otherwise 
	 */
	public boolean isEmpty() { 
		return root == null; 
	}
	
	//construct the tree 
	public BstTree() { 
		root = null; 
	}
	
	/* Insert into the tree, duplicates are ignored 
	 * x = the item to insert 
	 */
	public void insert(int x) { 
		root = insert (x, root);
	}
	
	/* Remove from the tree, nothing is done if x is not found 
	 * x = the item to remove 
	 */
	public void remove(int x) { 
		root = remove(x, root);
	}
	
	/*Find the smallest item in the tree 
	 * returns smallest items or null if empty 
	 */
	public int findMin() { 
		if (isEmpty()) { 
			System.out.println("Is Empty");
			//throw new UnderflowException(); GET THIS SHUT TO WORK 
		}
		return findMin(root).element;
	}
	
	/* Find the largest item in the tree 
	 * returns the largest item or null if empty 
	 */
	public int findMax() { 
		if(isEmpty()) { 
			System.out.println("Is Empty");
		}
		return findMax(root).element;
	}
	
	/*Find an item in the tree.
	 * x = the item to search for 
	 * returns true if not found 
	 */
	public boolean contains(int x) { 
		return contains(x, root);
	}
	
	//Make the tree logically empty 
	public void makeEmpty() { 
		root = null;
	}
	
	//Prints the tree values in sorted order 
	public void printTree() { 
		if(isEmpty()) { 
			System.out.println("Empty Tree");
		} else {
			printTree(root);
		}
	}
	
	public void displayLevel() { 
		int height = height(root);
		for (int i = 1; i <= height; i++) { 
			System.out.print("Level " + i + ": ");
			printLevelValues(root, i);
			System.out.println();
		}
	}
	
	public void printLevelValues(BNode rootTemp, int level) { 
		if(rootTemp == null) { 
			return;
		}
		if (level == 1) { 
			System.out.print(rootTemp.element + " ");
		} else if (level > 1) { 
			printLevelValues(rootTemp.left, level - 1);
			printLevelValues(rootTemp.right, level - 1);
		}
	}
}

	//			AVL TREE 
class AvlTree extends BstTree { 
	
	protected BNode insert(int x, BNode t) { 
		return balance(super.insert(x, t)); 
	}
	
	protected BNode remove(int x, BNode t) { 
		return balance(super.remove(x, t));
	}
	
	protected boolean contains(int x, BNode t) { 
		return super.contains(x, t);
	}
	
	public void checkBalance() { 
		checkBalance(root);
	}
	
	//Assume t is either balanced or within one of being balanced
	private BNode balance (BNode t) { 
		if (t == null) { 
			return t;
		}
		if (height(t.left)- height(t.right) > 1) { 
			if (height(t.left.left) >= height(t.left.right)) { 
				t = rotateWithLeftChild(t);
			} else {
				t = doubleWithLeftChild(t);
			}
		} else if (height(t.right) - height(t.left) > 1) { 
			if (height(t.right.right) >= height(t.right.left)) { 
				t = rotateWithRightChild(t);
			} else { 
				t = doubleWithRightChild(t);
			}
		}
		t.height = Math.max(height(t.left), height(t.right)) + 1;
		return t;
	}
	
	private int checkBalance(BNode t) { 
		if (t == null) {
			return -1;
		}
		if (t != null) { 
			int hl = checkBalance(t.left); 
			int hr = checkBalance(t.right);
			if (Math.abs(height(t.left) - height(t.right)) > 1 || height(t.left) != hl || height(t.right) != hr) {
				System.out.println("Unbalanced trees");
			}
		}
		return height(t);
	}
	
	/* Rotates binary tree node with left child
	 * Case 1: single rotation 
	 * Updates heights, then returns new root
	 */
	private BNode rotateWithLeftChild (BNode k2) { 
		BNode k1 = k2.left;
		k2.left = k1.right;
		k1.right = k2;
		k2.height = Math.max(height(k2.left), height(k2.right)) + 1;
		k1.height = Math.max(height(k1.left), k2.height) + 1;
		return k1;
	}
	
	/* Rotate binary tree node with right child
	 * Case 4: single right rotation 
	 * Updates heights, returns new root
	 */
	private BNode rotateWithRightChild (BNode k1) { 
		BNode k2 = k1.right;
		k1.right = k2.left;
		k2.left = k1;
		k1.height = Math.max(height(k1.left), height(k1.right)) + 1;
		k2.height = Math.max(height(k2.right), k1.height) + 1;
		return k2;
	}
	
	/* Double rotation of binary tree node: 
	 * first with left child with its right child 
	 * then node k3 with new left child 
	 * Case 2: double rotation, left-right
	 * Updates heights, then returns new root
	 */
	private BNode doubleWithLeftChild(BNode k3) { 
		k3.left = rotateWithRightChild(k3.left);
		return rotateWithLeftChild(k3);
	}
	
	/* Double rotate binary tree 
	 * first right child with its left child 
	 * then node k1 with new right child 
	 * Case 3: double rotation, right-left
	 * Update heights, then return new root
	 */
	private BNode doubleWithRightChild(BNode k1) { 
		k1.right = rotateWithLeftChild(k1.right);
		return rotateWithRightChild(k1);
	}

	public static void printBST(int numberOfNodes) { 
		Random rand = new Random();
		BstTree b = new BstTree();
		long startTime = System.nanoTime();
		long timeElapsed = 0;
		for (int i = 1; i <= numberOfNodes; i++) { 
			int n = rand.nextInt(100);
			b.insert(n);
			
			long endTime = System.nanoTime();
			timeElapsed = endTime - startTime;
		}
		b.printTree();
		System.out.println();
		int h = b.height(b.root);
		System.out.println("Height = " + h);
		b.displayLevel();
		System.out.println("Max Value: " + b.findMax());
		System.out.println("Execution Time in nanoseconds: " + timeElapsed);
		System.out.println("Execution Time in milliseconds: " + timeElapsed * 0.000001 + "\n");
	}
	
	public static void printAVL(int numberOfNodes ) { 
		Random rand = new Random();
		AvlTree a = new AvlTree();
		long startTime = System.nanoTime();
		long timeElapsed = 0;
		for (int i = 1; i <= numberOfNodes; i++) { 
			int n = rand.nextInt(100);
			a.insert(n);
			
			long endTime = System.nanoTime();
			timeElapsed = endTime - startTime;		}
		a.printTree();
		System.out.println();
		int h = a.height(a.root);
		System.out.println("Height = " + h);
		a.displayLevel();
		System.out.println("Max Value: " + a.findMax());
		System.out.println("Execution Time in nanoseconds: " + timeElapsed);
		System.out.println("Execution Time in milliseconds: " + timeElapsed * 0.000001 + "\n");
		
	}
	
	public static void main (String[] args) { 
	System.out.println("BST TREE TEST\n");
	printBST(4);
	printBST(6);
	printBST(8);
	System.out.println("AVL TREE TEST\n");
	printAVL(4);
	printAVL(10);
	printAVL(14);
	}
	
}