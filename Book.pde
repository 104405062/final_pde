  PImage book1,book2,book3,book4;
  final int _=0;
  final int a=1;
  final int b=2;
  final int c=3;
  final int d=4;

  boolean isAway =false;
class Book{
  int[]book= new int [4];
  float[]bookX= new float[4];
  float[]bookY= new float[4];  
  PImage showBook;
  int bookW, bookH;
  Book(){
    book1=loadImage("img/book1.png");
    book2=loadImage("img/book2.png");
    book3=loadImage("img/book3.png");
    book4=loadImage("img/book4.png");
    for(int i = 0; i < book.length; i++){
      book[i]= floor(random(1,5));
    }
    for(int i = 0; i < bookX.length; i++){
      bookX[i]= 300;
    }
    for(int i = 0; i < bookY.length; i++){
      bookH=42;
      if (i==0){    
        bookY[i]=340;
      }else
      if(i>0){
      bookY[i]=340-(i)*bookH;
      }
    }
        
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
      if (isHit(bookX[i], bookY[i], bookW, bookH, handX, handY, 20)) {
        bookX[i]+=10;
        isAway =true;
        if (bookX[i]>width) {
          bookX[i]=1000;
        }
      }
    }
  }
  


}