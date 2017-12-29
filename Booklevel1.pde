class Book{
  
  PImage book1,book2,book3,book4,robot;
  final int _=0;
  final int a=1;
  final int b=2;
  final int c=3;
  final int d=4;
  int[]book= new int [4];
  PImage showBook;
  int bookW, bookH;
  int pickNum;
  boolean isExist;
  
  Book(){
    book1=loadImage("img/book1.png");
    book2=loadImage("img/book2.png");
    book3=loadImage("img/book3.png");
    book4=loadImage("img/book4.png");
    robot=loadImage("img/robot.png");
    for(int i = 0; i < book.length; i++){
        pickNum=floor(random(1,5));  
      while(isExist(pickNum,book)){
        pickNum=floor(random(1,5));
      }
      book[i]= pickNum;
      
      
      
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
       
       //robot
      image(robot,300,340-4*bookH-105); 
    }
    
    
    
  }
  
  boolean isExist(int pickNum,int[]book){
    for(int i=0;i<book.length;i++){
      if(book[i]==pickNum){
        return true;
      }else {
        return false;
      }
    }
  }


}