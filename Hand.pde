  int handW=263,handH=68;
  int handSpeed=3;
  PImage hand;
  float handX=0,handY=207;
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
    if(handX>=37){
      handX=37;
      book.bePoked();
    }
    
  }
}