  int handW=450,handH=68;
  int handSpeed=3;
  PImage hand;
  float handX=-187,handY=210;
  float pokedSpeed = 5f;
class Hand{
  Hand(){
    hand = loadImage("img/hand.png");
  }
  void display(){
    image(hand,handX,handY);
  }
  void updownMove(int movingSpeed,int bookTotalheight){
    movingSpeed+=3;
    handY=(174+movingSpeed)%bookTotalheight;
  }
  void update(){
    handX+=pokedSpeed;
  }
  void handPokes() {
    if(handX>=-37){
      handX=-37;
      book.bePoked();
    }
    
  }
}
