/*Implement a stack using linked lists data structure.  
 * Implement your own linked list.  
 * You cannot use Java's java.util.LinkedList.
 */
public class MyStackLL {
	//INSTANCE VARIABLES
	LinkedList myStack = new LinkedList();
	
	public MyStackLL(String[] list) { //Creates stack (by LIFO) using items in list
		for(int i = 0; i < list.length; i++) { 
			myStack.insertHead(list[i]);
		}
	}
	
	public MyStackLL() { //Blank Stack to be used in Queue 
	}
	
	//GETTERS
	public String pop() { //Returns value using LIFO 
		Node Buff = null;
		while (! myStack.isEmpty()) { 
			Buff = myStack.removeHead();
			return Buff.data;
		}
		return null;
	}
	
	public Boolean isEmpty() { //Returns true or false depending on if stack is empty
		return (myStack.isEmpty());
	}

	public void printStack() { //Prints the items on the stack to console
		myStack.showList();
		System.out.println("");
	}
	
	//SETTERS  
	public void push(String item) { //Push a given value onto the stack

		myStack.insertHead(item);
	}
	
	//Be able to handle errors for all possible edge cases 
	public void push() { 
		System.out.println("You entered nothing, please enter a String value");
	}
	public void push(int item) { 
		System.out.println("You entered an int value, please enter a String value");
	}
	public void push(double item) { 
		System.out.println("You entered a double value, please enter a String value");
	}
	public void push(char item) { 
		System.out.println("You entered a char value, please enter a String value");
	}
	public void push(boolean item) { 
		System.out.println("You entered a boolean value, please enter a String value");
	}
}
