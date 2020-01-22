/*Implement a queue using the MyStack.java 
 * implementation as your data structure.  
 * In other words, your instance variable 
 * to hold the queue items will be a MyStack class.
 */
public class MyQueueLL {
	
	private MyStackLL Stack = new MyStackLL();
	private MyStackLL queStack = new MyStackLL();
	
	
	//myQueue(String[] list): CONSTRUCTOR which creates the queue with the items in list in the queue
	public MyQueueLL(String[] list) { 
		for(int i = 0; i < list.length; i++) { 
			Stack.push(list[i]);
		}
	}
	public MyQueueLL() { 
	}
	 
	public void enqueue(String item) { //Inserts item into the queue
		Stack.push(item);
	}
	 
	public String dequeue() { //Returns and deletes the first element in the queue
		String temp2 = null;
		while(! Stack.isEmpty()) {
			temp2 = Stack.pop();
			queStack.push(temp2);
		}
		String temp = null;
		while(! queStack.isEmpty()) { 
			temp = queStack.pop();
			return temp;
		}
		return null;
	}
	
	public boolean isEmpty() { //Returns true or false depending on if the queue is empty
		return (Stack.isEmpty() && queStack.isEmpty());
	}
	 
	public void printQueue() { //Prints the items in the queue to console
		while (! Stack.isEmpty() ) {
			queStack.push(Stack.pop());
		}
		queStack.printStack();
		while (! queStack.isEmpty()) { 
			Stack.push(queStack.pop());
		}
	}
	
	public void enqueue() { 
		System.out.println("You entered nothing, please enter a String value");
	}
	public void enqueue(int item) { 
		System.out.println("You entered an int value, please enter a String value");
	}
	public void enqueue(double item) { 
		System.out.println("You entered a double value, please enter a String value");
	}
	public void enqueue(char item) { 
		System.out.println("You entered a character value, please enter a String value");
	}
	public void enqueue(boolean item) { 
		System.out.println("You entered a boolean value, please enter a String value");
	}
}
