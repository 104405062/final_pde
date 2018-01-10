PImage title, gamewin1, gameover1,gamewin2,gameover2,startImg, startNormal, startHovered, restartNormal, restartHovered;
PImage bgImg, robot, gameboy,  bigHand,life0,life1,life2,button;
PImage boySpeak, angel1, angel2, beforeMom, bigwin, momApear,momSpeak;
PImage triangle,trianglecover;


PImage next,restart;

PImage []lifes;
int playerHealth=3;
int bookHeight, bookX[], bookY[];
int momX,momY;
int pokedBookIndex=10;

PFont font;
Time time;
BookLevel1 book1;
Mother mother;
Hand finger;

final int GAME_START = 0, GAME_RUN1 = 1, GAME_OVER1 = 2, GAME_WIN1 = 3;
final int GAME_RUN2 = 4,GAME_OVER2 = 5, GAME_WIN2 = 6;
final int GAME_RUN3 = 7, GAME_OVER3 = 8, GAME_WIN3 = 9;
final int boySpeak1=10, angelver1=11, angelver2=12;
final int beforeMombg=13, momApearbg=14, momSpeakbg=15;

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
 // hand = loadImage("img/hand.png");
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
  button=loadImage("img/button.png");
  font=createFont("Arial",100);
  
  boySpeak=loadImage("img/boySpeak1.png");
  angel1=loadImage("img/angel1.png");
  angel2=loadImage("img/angel2.png");
  beforeMom=loadImage("img/beforeMom.png");
  bigwin=loadImage("img/bigwin.png");
  momApear=loadImage("img/momApear.png");
  momSpeak=loadImage("img/momSpeak.png");
  
  triangle=loadImage("img/triangle.png");
  trianglecover=loadImage("img/trianglecover.png");
  
  
  book1= new BookLevel1();
  time= new Time(1800);  //correct:1800
  finger= new Hand();

 
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
        gameState = boySpeak1;
        mousePressed = false;
       }
      }
    break;
    
   case boySpeak1:
   image(boySpeak,0,0);
   image(triangle,560,400);
    if(560+52 > mouseX
    &&560 < mouseX
    && 400+57 > mouseY
    && 400 < mouseY) {
   image(trianglecover,560,400);
   if(mousePressed){
    gameState = angelver1;
    mousePressed = false;
    }
   }
   break;
   
   case angelver1:
   image(angel1,0,0);
   image(triangle,560,400);
    if(560+52 > mouseX
    &&560 < mouseX
    && 400+57 > mouseY
    && 400 < mouseY) {
   image(trianglecover,560,400);
   if(mousePressed){
    gameState = GAME_RUN1;
    mousePressed = false;
    }
   }

    break;
    
    case GAME_RUN1:
    image(bgImg, 0, 0);
    
    // Timer
    time.timeSetting();

    // Time UI 
    time.drawTimerUI(); 
    
    //book 
    book1.display();
    book1.fall();
       //load lifeImg

  image(life0,10,50,35,40);
  image(life1,80,50,35,40);
  image(life2,150,50,35,40);
   //life
   //hand
 //finger
    finger.display();
    finger.updownMove();
    if(clickedState==true){
      finger.update();
      if(handX>=-37){
        handX=-37;
        book1.bePoked();
      }
    }
    //button
    image(button,30,400,90,51);
  
  
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
        book1= new BookLevel1();
        finger= new Hand();
        //mother=new Mother();
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
       // mother=new Mother();
      //  book= new Book();
        mousePressed = false;
      }
     }
    
    
    
    break;
    
    case GAME_RUN2:
    image(bgImg, 0, 0);
    
    break;
    
    case GAME_OVER2:
    image(gameover2, 0, 0);
  
    if(NEXT_BUTTON_X + NEXT_BUTTON_W > mouseX
      && NEXT_BUTTON_X < mouseX
      && NEXT_BUTTON_Y + NEXT_BUTTON_H > mouseY
      && NEXT_BUTTON_Y < mouseY) {
      image(restart, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if(mousePressed){
        
        gameState = GAME_RUN2;
        time= new Time(2400); 
        book1= new BookLevel1();
        mousePressed = false;
      }
     }
    
    break;
    
    case GAME_WIN2:
    image(gamewin2,0,0);
    
     if(NEXT_BUTTON_X + NEXT_BUTTON_W > mouseX
      && NEXT_BUTTON_X < mouseX
      && NEXT_BUTTON_Y + NEXT_BUTTON_H > mouseY
      && NEXT_BUTTON_Y < mouseY) {
     
      image(next, NEXT_BUTTON_X, NEXT_BUTTON_Y);
      if(mousePressed){
        gameState = beforeMombg;
        time= new Time(6000);
        mother=new Mother();
        book1= new BookLevel1();
        mousePressed = false;
      }
     }
    
    break;
    
    case beforeMombg:
    image(beforeMom,0,0);
    image(triangle,560,400);
    if(560+52 > mouseX
    &&560 < mouseX
    && 400+57 > mouseY
    && 400 < mouseY) {
   image(trianglecover,560,400);
   if(mousePressed){
    gameState = momApearbg;
    mousePressed = false;
    }
   }
    
    break;
    
    case momApearbg:
    image(momApear,0,0);
    image(triangle,560,400);
    if(560+52 > mouseX
    &&560 < mouseX
    && 400+57 > mouseY
    && 400 < mouseY) {
   image(trianglecover,560,400);
   if(mousePressed){
    gameState = momSpeakbg;
    mousePressed = false;
    }
   }
    break;
    
    case momSpeakbg:
    image(momSpeak,0,0);
    image(triangle,560,400);
    if(560+52 > mouseX
    &&560 < mouseX
    && 400+57 > mouseY
    && 400 < mouseY) {
   image(trianglecover,560,400);
   if(mousePressed){
    gameState = GAME_RUN3;
    mousePressed = false;
    }
   }
    
    break;
    
    
    case GAME_RUN3:
    image(bgImg, 0, 0);
    //test mom
    //initial mom
    mother.move();
    mother.display();
    // Timer
    time.timeSetting();
    // Time UI 
    time.drawTimerUI();
    
    break;
    
    
    case GAME_OVER3:
    
    
    
    break;
    
  }
  
}



boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bh){
  return  ax + aw > bx &&    // a right edge past b left
        ay + ah > by &&    // a top edge past b bottom
        ay < by + bh;
}




void keyReleased(){
  
    if(key=='b'){
      // Press B to toggle demo mode
      pokedBookIndex = 2;
      for(int i=book1.bookX.length -1;i>pokedBookIndex;i--){
        println(i);
        book1.bookX[i]=book1.bookX[i-1];
        book1.bookY[i]=book1.bookY[i-1];
      }
      
      book1.bookX[pokedBookIndex] =1000;
    }
  
}
void mouseClicked() {
  if (mouseX>=30 && mouseX<=120 && mouseY>=400 && mouseY<=450) {
    clickedState=true;
    finger.handPokes();
  }
}
void mouseReleased() {
    clickedState=false;
}
