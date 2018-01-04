PImage title, gamewin1, gameover1,gamewin2,gameover2,startImg, startNormal, startHovered, restartNormal, restartHovered;
PImage bgImg, robot, gameboy, hand, bigHand,life0,life1,life2,mother;
PImage next,restart;

PImage []lifes;
int handX, handY, handLength, handSpeed=3, handPokespeed;
int playerHealth=3;
int bookHeight, bookX[], bookY[];
int momX,momY;

PFont font;
Time time;
Book book;

final int GAME_START = 0, GAME_RUN1 = 1, GAME_OVER1 = 2, GAME_WIN1 = 3;
final int GAME_RUN2 = 4,GAME_OVER2 = 5, GAME_WIN2 = 6;
final int GAME_RUN3 = 7, GAME_OVER3 = 8, GAME_WIN3 = 9;
int gameState = 0;
final int START_BUTTON_W = 487;
final int START_BUTTON_H = 88;
final int START_BUTTON_X = 120;
final int START_BUTTON_Y = 370;
final int NEXT_BUTTON_W = 204;
final int NEXT_BUTTON_H = 65;
final int NEXT_BUTTON_X = 218;
final int NEXT_BUTTON_Y = 352;
boolean clickedState=false;



void setup() {
  size(640, 480, P2D);
  bgImg = loadImage("img/bgImg.png");
  hand = loadImage("img/hand.png");
  bigHand = loadImage("img/bigHand.png");
  robot= loadImage("img/robot.png");
  gameboy = loadImage("img/gameboy.png");
  startImg=loadImage("img/startImg.png");
  gamewin1 = loadImage("img/gamewin1.png");
  gameover1 = loadImage("img/gameover1.png");
  gamewin2 = loadImage("img/gamewin2.png");
  gameover2 = loadImage("img/gameover2.png");
  life0=loadImage("img/paper.png");
  life1=loadImage("img/scissor.png");
  life2=loadImage("img/stone.png");
  startNormal=loadImage("img/startNormal.png");
  next=loadImage("img/next.png");
  restart=loadImage("img/restart.png");
  mother=loadImage("img/mother.jpg");
  font=createFont("Arial",100);
 
  
  book= new Book();
  time= new Time(1800);



 
}


void draw() {
  switch(gameState){
   case GAME_START:
   image(startImg,0,0);
      if(START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {
      image(startNormal, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN1;
        mousePressed = false;
      }

   

      }
    break;
    
    case GAME_RUN1:
    image(bgImg, 0, 0);
    //finger
    finger.display();
    if(clickedState==true){
      finger.update();
      if(handX>-37){
        handX=-37;
        book.bePoked();
      }
    }
    // Timer
    time.timeSetting();

    // Time UI 
    time.drawTimerUI(); 
    
    //book 
    book.display();
       //load lifeImg

  image(life0,10,50,35,40);
  image(life1,80,50,35,40);
  image(life2,150,50,35,40);
   //life
     if (playerHealth==0){
        gameState=GAME_OVER1;
      }
      
    break;
    
    case GAME_OVER1: // Gameover Screen
    image(gameover1, 0, 0);
  
    if(NEXT_BUTTON_X + NEXT_BUTTON_W > mouseX
      && NEXT_BUTTON_X < mouseX
      && NEXT_BUTTON_Y + NEXT_BUTTON_H > mouseY
      && NEXT_BUTTON_Y < mouseY) {
     
      image(restart, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN1;
        time= new Time(1800);
        book= new Book();
        mousePressed = false;
      }
     }
    break;
    
    case GAME_WIN1:
    image(gamewin1,0,0);
    
     if(NEXT_BUTTON_X + NEXT_BUTTON_W > mouseX
      && NEXT_BUTTON_X < mouseX
      && NEXT_BUTTON_Y + NEXT_BUTTON_H > mouseY
      && NEXT_BUTTON_Y < mouseY) {
     
      image(next, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN2;
        time= new Time(2400);
      //  book= new Book();
        mousePressed = false;
      }
     }
    
    
    
    break;
    
    case GAME_RUN2:
    image(bgImg, 0, 0);
    //test mom
    //initial mom
  
    image(mother,momX, momY);
    
  
    
    
    break;
    
    case GAME_OVER2:
    
    
    break;
    
  }
  
}


void handPokes() {
  int handPokespeed=5;
  handY+=handPokespeed;
  image(hand, handX, handY);
}
boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bh){
  return  ax + aw > bx &&    // a right edge past b left
        ay + ah > by &&    // a top edge past b bottom
        ay < by + bh;
}
