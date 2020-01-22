public class MyTest {
	public static void main (String[] args) {
	String[] testStack = {"A", "B","C"};
	String[] testQueue = {"X", "Y", "Z"};
	MyStackLL stackA = new MyStackLL(testStack);
	MyQueueLL queueA = new MyQueueLL(testQueue);
	MyStackLL stackB = new MyStackLL();
	MyQueueLL queueB = new MyQueueLL();
	/////////////////////////////////////////////////////////////
	System.out.println("*******************************Here I Will Be Testing The Stack*******************************");
	testPush(stackB);
	stackB.printStack();
	System.out.println("The test has passed!\n");
	testPop(stackB);
	stackB.printStack();
	System.out.println("The test has passed!\n");
	testEmptyA(stackB);
	System.out.println("The test has passed!\n");
	stackConstructor();
	stackA.printStack();
	System.out.println("The test has passed!\n");
	testEdgeCasesA(stackB);
	stackB.printStack();
	System.out.println("The edge cases have been dealt with!");
	System.out.println("");
	///////////////////////////////////////////////////////////////
	System.out.println("*******************************Here I Will Be Testing The Queue*******************************");
	System.out.println("");
	testEnqueue(queueB);
	queueB.printQueue();
	System.out.println("The test has passed!\n");
	testDequeue(queueB);
	queueB.printQueue();
	System.out.println("The test has passed!\n");
	testEmptyB(queueB);
	System.out.println("The test has passed!\n");
	queueConstructor();
	queueA.printQueue();
	System.out.println("The test has passed!");
	testEdgeCasesB(queueB);
	queueB.printQueue();
	System.out.println("The edge cases have been dealt with!");
	} 
	
	public static void stackConstructor() { 
		System.out.println("\nHere I am testing my Constructor for my Stack \nthe Stack will passing an array");
		System.out.println("The array has been choosen already to be A,B,C");
		System.out.println("It should output C on top, B in the middle, and A at the bottom\n");
	}
	
	public static void testEdgeCasesA (MyStackLL A) { 
		System.out.println("I will be testing some edge cases that are meant to break my program\n");
		System.out.println("First case: user pushing nothing into the stack.");
		A.push();
		System.out.println("I have entered a message for the user to enter a String value");
		System.out.println("\nSecond case: user pushes value that is not a String");
		A.push(3);
		A.push(3.23);
		A.push('e');
		A.push(false);
		System.out.println("I have entered a message for the user to enter a String value");
		System.out.println("\nThird Case: popping a value when there is nothing in the Stack");
		System.out.println("I am expecting for this case to either print null or print nothing at all");
		A.pop();
		A.pop();
		System.out.println("\nNothing is showing, so popping an empty value will not crash the program :)");
		System.out.println("\nFourth Case: I will push mulitple values (1-7), then pop the top two values and finally print out the Stack");
		A.push("1");
		A.push("2");
		A.push("3");
		A.push("4");
		A.push("5");
		A.push("6");
		A.push("7");
		A.pop();
		A.pop();
		System.out.println("I am expecting to print out values 1-5, starting 5 on top and ending with 1 at the bottom\n");
	}
	
	public static void testPush(MyStackLL A) { 
		System.out.println("\nHere I will be testing my individual push methods");
		A.push("A");
		A.push("B");
		A.push("C");
		System.out.println("It should output C on top, B in the middle, and A at the bottom\n");
	}
	
	public static void testPop(MyStackLL A) { 
		System.out.println("Here I will be testing my individual pop methods");
		A.pop();
		System.out.println("The output will be B on top, with A at the bottom\n");
	}
	
	public static void testEmptyA(MyStackLL A) { 
		System.out.println("Here I am testing my isEmpty method by printing FALSE if not empty, and TRUE if empty");
		System.out.println("Im expecting my Stack to print FALSE because I have pushed A and B into it\n");
		System.out.println(A.isEmpty());
		A.pop();
		A.pop();
		System.out.println("\nAfter popping B and A the method will print TRUE\n");
		System.out.println(A.isEmpty());
	}
	
	public static void testEdgeCasesB (MyQueueLL B) {
		System.out.println("I will be testing some edge cases that are meant to break my program\n");
		System.out.println("First case: user pushing nothing into the stack.");
		B.enqueue();
		System.out.println("I have entered a message for the user to enter a String value");
		System.out.println("\nSecond case: user pushes value that is not a String");
		B.enqueue(3);
		B.enqueue(3.23);
		B.enqueue('e');
		B.enqueue(false);
		System.out.println("I have entered a message for the user to enter a String value");
		System.out.println("\nThird Case: I will dequeue a value when there is nothing in the Queue");
		System.out.println("I am expecting for this case to either print null or print nothing at all");
		B.dequeue();
		B.dequeue();
		B.dequeue();
		System.out.println("\nNothing is showing, so when you dequeue an empty value it will not crash the program :)");
		System.out.println("\nFourth Case: I will enqueue mulitple values (1-7), then dequeue the top two values and finally print out the Queue");
		B.enqueue("1");
		B.enqueue("2");
		B.enqueue("3");
		B.enqueue("4");
		B.enqueue("5");
		B.enqueue("6");
		B.enqueue("7");
		B.dequeue();
		B.dequeue();
		System.out.println("I am expecting to print out values 3-7, starting with 3 on top and 7 at the bottom\n");
	}
	
	public static void queueConstructor() { 
		System.out.println("Here I am testing my Constructor for my Queue \nthe Queue will passing an array");
		System.out.println("The array has been choosen already to be X,Y,Z");
		System.out.println("It should output X on top, Y in the middle, and Z at the bottom\n");
	}
	
	public static void testEnqueue(MyQueueLL B) { 
		System.out.println("\nHere I will be testing my individual enqueue method");
		B.enqueue("X");
		B.enqueue("Y");
		B.enqueue("Z");
		System.out.println("It should output X on top, Y in the middle, and Z at the bottom\n");
	}
	
	public static void testDequeue(MyQueueLL B) { 
		System.out.println("Here I will be testing my individual dequeue method");
		B.dequeue();
		System.out.println("The output will be Y on top, with Z at the bottom\n");
	}
	
	public static void testEmptyB(MyQueueLL B) { 
		System.out.println("Here I am testing my isEmpty method by printing FALSE if not empty, and TRUE if empty");
		System.out.println("Im expecting my Queue to print FALSE because I have pushed Y and Z into it\n");
		System.out.println(B.isEmpty());
		B.dequeue();
		B.dequeue();
		System.out.println("\nAfter popping Y and Z the method will print TRUE\n");
		System.out.println(B.isEmpty() + "\n");
	}
}
