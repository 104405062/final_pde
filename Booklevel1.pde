import java.util.*;
import java.util.concurrent.ThreadLocalRandom;


class Book{
  
  PImage book1,book2,book3,book4;
  final int _=0;
  final int a=1;
  final int b=2;
  final int c=3;
  final int d=4;
  int[]book= {1,2,3,4};
  PImage showBook;
  int bookW, bookH;
  
  Book(){
    book1=loadImage("img/book1.png");
    book2=loadImage("img/book2.png");
    book3=loadImage("img/book3.png");
    book4=loadImage("img/book4.png");
   /* for(int i = 0; i < book.length; i++){
      book[i]= floor(random(1,5));
    }
    */
    shuffleArray(book);
  }
  
  void display(){
    
    for(int i=0;i<4;i++){
      
      switch(book[i]){
        case _: showBook = null;  bookH=0; break;
        case a: showBook = book1; bookH=42;break;
        case b: showBook = book2; bookH=42;break;
        case c: showBook = book3; bookH=42;break;
        case d: showBook = book4; bookH=42;break;
      }
      
      int bookX=300;
      if(showBook !=null){
        if (i==0){
          image(showBook,bookX,340);
        }else
        if (i>0){
          int bookY=340-(i)*bookH;
          image(showBook,bookX,bookY);
        }
        
        //fall
       }else if(showBook == null) {
         int bookY=340-(i)*bookH;
         image(showBook,bookX,bookY);
       }
    }
    
    
    
  }
  
void shuffleArray(int[] ar)
  {
    // If running on Java 6 or older, use `new Random()` on RHS here
    Random rnd = ThreadLocalRandom.current();
    for (int i = ar.length - 1; i > 0; i--)
    {
      int index = rnd.nextInt(i + 1);
      // Simple swap
      int a = ar[index];
      ar[index] = ar[i];
      ar[i] = a;
    }
  }

}
