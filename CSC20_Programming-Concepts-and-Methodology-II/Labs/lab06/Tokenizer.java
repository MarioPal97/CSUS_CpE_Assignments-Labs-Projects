/*Mario Palacios
  CSC 20 - 03 
  Lab06 
  10 - 10 - 2018
*/ 
class Tokenizer { 
   private char [] buf; 
   private int cur; 
   
   Tokenizer(String infixExpression) {
      buf = infixExpression.toCharArray();
      cur = 0; 
   }
   boolean moreTokens() {
      while(cur < buf.length && buf[cur] == ' ') { 
         cur++;
      }
      return cur < buf.length;
   }
   Token nextToken() {
      while(cur < buf.length && buf[cur] == ' ') {
         cur++;
      }
      if(cur >= buf.length) {
         return null; 
      }
      int result = 0; 
      if(buf[cur] >= 48 && buf[cur] <= 57) {
         int start = cur;
         while(cur < buf.length && buf[cur] >= 48 && buf[cur] <= 57) { 
            cur++; 
         }
         String digits = new String(buf, start, cur - start);
         int num = Integer.valueOf(digits).intValue();
         return new Operand(num);
      } else { 
         return new Operator(buf[cur++]);
      }
   }
}  