import java.util.*;
public class Stack2<E> extends Vector<E> { 
	public Stack(); //constructor 
	public Boolean empty();
	public E peek();
	public E pop();
	public push(E item);
}

public class LinkedList<E> extends AbstractSequentialList<E> implements List<E>, Queue<E>, Cloneable, Serializable { 
	public LinkedList(); //constructor 
	public E getFirst();
	public E removeFirst();
	public void addLast(E item);
	public Boolean isEmpty();
} 