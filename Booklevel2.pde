class Book{
  
  PImage book5,book6,book7,book8,;
  final int _=0;
  final int a=5;
  final int b=6;
  final int c=7;
  final int d=8;
  int[]book2= new int [7];
  PImage showBook;
  int bookW, bookH;
  
  Book(){
    book5=loadImage("img/book5.png");
    book6=loadImage("img/book6.png");
    book7=loadImage("img/book7.png");
    book8=loadImage("img/book8.png");
    for(int i = 0; i < book2.length; i++){
      book2[i]= floor(random(5,9));
      
    }
  }
  
  void display(){
    
    for(int i=0;i<7;i++){
      
      switch(book2[i]){
        case _: showBook = null;  bookH=0; break;
        case a: showBook = book5; bookH=42;break;
        case b: showBook = book6; bookH=42;break;
        case c: showBook = book7; bookH=42;break;
        case d: showBook = book8; bookH=42;break;
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
  


}