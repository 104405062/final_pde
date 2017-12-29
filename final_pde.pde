class Book{

  float x,y,w,h;
  PImage []book;
  int []wbook=new int [4];
  int []hbook=new int [4];
  int []xbook=new int [4];
  int []ybook=new int [4];
  
  
  Book(){
    book =new PImage[4];
    for(int i = 0; i < book.length; i++){
      int a= floor(random(1,5));
      book[i] = loadImage("img/book" + a + ".png");
    }
    
        
    x=360;
    ybook[1]=300;
    ybook[1]=ybook[0]+hbook[0];
    ybook[2]=ybook[1]+hbook[1];
    ybook[3]=ybook[2]+hbook[2];
  }
  
  void display(){
    
    for(int i=0;i<xbook.length;i++){
      image(book[i],xbook[i],ybook[i]);
    }
  
  }


}