class Mother{
  float w, h, momX, momY, xSpeed;
  PImage mother;
 


Mother(){
   
    mother=loadImage("img/momShadow.png");
    momY = 13 ;
    xSpeed=(int)random(2)+1;
    w=150;
    h=198;
}
  
  
  
   void move(){  
     momX +=xSpeed ;
    if (momX >=200||momX <-250) { 
      xSpeed *= -1 ;
    }
  
   }
 
   void display () {
     int direction = (xSpeed > 0) ? RIGHT : LEFT;
    pushMatrix();
    translate(momX, momY);
    if (direction == RIGHT) {
      scale(1, 1);
      image(mother, 0, 0, w, h); 
    } else {
      scale(-1, 1);
      image(mother, -w, 0, w, h); 
    }
    popMatrix();
      
    
  }
 
}