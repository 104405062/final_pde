  import java.util.*;
  import java.util.concurrent.ThreadLocalRandom;
  
  class BookLevel1{
    PImage book1,book2,book3,book4;
    PImage showBook;
    final int _=0;
    final int a=1;
    final int b=2;
    final int c=3;
    final int d=4;

    int[]book = {1,2,3,4};
    float[]bookX= new float[4];
    float[]bookY= new float[4];
    float[]bookH= new float[4];

    int bookW;
   
    boolean isAway = false;
    boolean isAlive = true;
    
  BookLevel1(){
    book1=loadImage("img/book1.png");
    book2=loadImage("img/book2.png");
    book3=loadImage("img/book3.png");
    book4=loadImage("img/book4.png");
    //for(int i = 0; i < book.length; i++){
    //  book[i]= floor(random(1,5));
    //}
    shuffleArray(book);
    for(int i = 0; i < bookX.length; i++){
      bookX[i]= 300;
    }
    for(int i = 0; i < bookY.length; i++){
      bookH[i]=42;
      if (i==0){    
        bookY[i]=340;
      }else
      if(i>0){
      bookY[i]=340-(i)*bookH[i];
      }
    }
        
  }
  
  void display(){
    
    for(int i=0;i<4;i++){
      
      switch(book[i]){
        case _: showBook = null;  bookH[i]=0; break;
        case a: showBook = book1; bookH[i]=42;break;
        case b: showBook = book2; bookH[i]=42;break;
        case c: showBook = book3; bookH[i]=42;break;
        case d: showBook = book4; bookH[i]=42;break;
      }
      
      if(showBook !=null){
        if (i==0){
          image(showBook,bookX[i],bookY[0]);
        }else
        if (i>0){
          image(showBook,bookX[i],bookY[i]);
        }
        
        //fall
       }else if(showBook == null) {
         image(showBook,bookX[i],bookY[i]);
       }
    }    
  }
  void update(){
  }
  void bePoked() {
    for(int i=0;i<4;i++){
      if (isHit(bookX[i], bookY[i], bookW, bookH[i], handX, handY, 20)) {
        bookX[i]+=10;
        isAway =true;
        if (bookX[i]>width) {
          bookX[i]=1000;
        }
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
