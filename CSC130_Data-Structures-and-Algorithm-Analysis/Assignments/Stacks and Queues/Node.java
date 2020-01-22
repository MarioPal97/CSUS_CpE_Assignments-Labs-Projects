public class Node {
	public String data;
	public Node Next; 
	
	public Node(String data) { 
		this.data = data;
	}
	
	public void displayNode() { 
		System.out.println(data); //Shows what is in the Node
	}
}
