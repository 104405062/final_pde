  int handW=450,handH=68;
  int handSpeed=3;
  PImage hand;
  float handX=-187,handY=210;
  float pokedSpeed = 5f;
  float movingSpeed = 2f;
  
class Hand{
  Hand(){
    hand = loadImage("img/hand.png");
  }
  void display(){
    image(hand,handX,handY);
  }
  
  void update(){
    updownMove();
    handX+=pokedSpeed;
  }
  void updownMove(){
    int direction = (movingSpeed > 0) ? DOWN : UP;
    if(handY>=382){
      direction=UP;
      movingSpeed*=-1;
    }else if(handY<=book.upperEdge){
      movingSpeed*=-1;
      direction=DOWN;
    }
    handY+=movingSpeed;
    }

  

  void handPokes(){
    if(handX>=-50){
      pokedSpeed*=-1;
      handX+=pokedSpeed;
        if(handX<=-187){
           handX=-187;
           pokedSpeed*=-1;
        }
      book.bePoked();
    }
  }
 }
