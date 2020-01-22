/*Mario Palacios
  CSC 20 - 03 
  lab06 
  10 - 10 - 2018
*/ 
package MyStackQueue;
public class Queue { 
   private Node Rear = null, Front = null; 
   public boolean isEmpty() { return Front == null;} 
   public void enqueue(Object Element) {
      Node Tmp = new Node(); 
      Tmp.data = Element; 
      if(Rear == null) Rear = Front = Tmp; 
      else { Rear.Next = Tmp; Rear = Tmp; } 
   } 
   public Object dequeue() { 
      Node Tmp = Front; 
      Front = Front.Next;
      if (Front == null) Rear = null; 
      return Tmp.data;
   }
   public String toString() { 
   String s = ""; 
   Node cur = Front;
   while(cur != null) {
      s = s + cur.data + " "; 
      cur = cur.Next;
   }
   return s;
}

} 
class Node { 
   Object data; 
   Node Next;
}     