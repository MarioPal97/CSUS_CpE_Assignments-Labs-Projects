public class LinkedList {
	
	//INSTANCE VARIABLES 
	private Node Head = null; 
	
	public boolean isEmpty() { //Checks if head is equal to null; if true returns list is empty
		return (Head == null);
	}
	
	public void insertHead(String data) { //Acts as a push and creates a new node and links to list  
		Node n = new Node(data);
		n.Next = Head;
		Head = n;
	}
	
	public void showList() { //Displays each node until Linked List reaches a null node 
		Node curr = Head; 
		while (curr != null) { 
			curr.displayNode();
			curr = curr.Next;
		}
	}
	
	public Node removeHead() { //Acts as a pop, putting head node into Tmp and returns its value 
		Node Tmp = Head; 
		Head = Head.Next;
		return Tmp; 
	}

}
