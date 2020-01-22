/*Mario Palacios 
  CSC 20 - 03 
  09 - 26- 2018 
  Lab04 
*/
public class SortedList {
	private DLNode Head, Tail;

	public void insert(double n){
      DLNode cur = Head; 
      DLNode prv = null; 
      while(cur != null && cur.data <= n){
         prv = cur;
         cur = cur.Next;
      }
      DLNode tmp = new DLNode(); 
      tmp.data = n;
      if(prv != null) prv.Next = tmp; 
      else Head = tmp; 
      tmp.Prev = prv; 
      tmp.Next = cur;
      if(cur != null) cur.Prev = tmp; 
      else Tail = tmp; 
	}

	public void listAscending(){
      DLNode cur = Head; 
      int count = 0; 
      while(cur != null){
         System.out.printf("%f", cur.data);
         cur = cur.Next;
         count++;
         if(count % 5 == 0){
            System.out.println(); 
         }
      }
	}

	public void listDescending() {
      DLNode cur = Tail; 
      int count = 0; 
      while(cur != null){
         System.out.printf("%f", cur.data);
         cur = cur.Prev;
         count++;
         if(count % 5 == 0){
            System.out.println();
         }
      }
	}
}
