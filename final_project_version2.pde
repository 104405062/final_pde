PImage title, gamewin1, gameover1,gamewin2,gameover2,startImg, startNormal, startHovered, restartNormal, restartHovered;
PImage bgImg, robot, gameboy, bigHand,life0,life1,life2,button;

PImage []lifes;
int playerHealth=3;
int bookHeight, bookX[], bookY[];
final int GAME_INIT_TIMER = 1800;
int gameTimer = GAME_INIT_TIMER;
PFont font;

BookLevel1 book;
Hand finger;

final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2, GAME_WIN = 3;
int gameState = 0;
final int START_BUTTON_W = 487;
final int START_BUTTON_H = 88;
final int START_BUTTON_X = 120;
final int START_BUTTON_Y = 370;
boolean clickedState=false;



void setup() {
  size(640, 480, P2D);
  bgImg = loadImage("img/bgImg.png");
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
  button=loadImage("img/button.png");
  font=createFont("Arial",100);
  
  book= new BookLevel1();
  finger = new Hand();




 
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
        gameState = GAME_RUN;
        mousePressed = false;
      }

   

      }
    break;
    
    case GAME_RUN:
    image(bgImg, 0, 0);
    //finger
    finger.display();
    finger.updownMove();
    if(clickedState==true){
      finger.update();
      if(handX>=-37){
        handX=-37;
        book.bePoked();
      }
    }
    //button
    image(button,30,400,90,51);
    //life
     if (playerHealth==0){
        gameState=GAME_OVER;
      }
    // Timer
    gameTimer --;  
    if(gameTimer <= 0){ gameState = GAME_OVER;}
    // Time UI 
    drawTimerUI(); 
    
    //book 
    book.display();
       //load lifeImg

    image(life0,10,80,35,40);
    image(life1,80,80,35,40);
    image(life2,150,80,35,40);
    break;
    
    case GAME_OVER: // Gameover Screen
    image(gameover1, 0, 0);
    
    if(START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {
     
      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_RUN;
        mousePressed = false;
      }
     }

  }
  
}
color getTimeTextColor(int frames){     
  if(frames>=1200 && frames<1800){
  return #D8E2DC;
  }else
  if(frames>=600 && frames<1200){
  return #FFCDB2;
  }else{
  return #F25F5C;
  }
}

String convertFramesToTimeString(int frames){ 
int minute=floor((gameTimer/frames)/frames);
int secound=floor(gameTimer%(frames*frames)/frames);
String min=nf(minute,2);
String sec=nf(secound,2);
 return min+":"+sec;
 

}

void drawTimerUI(){
 String timeString = convertFramesToTimeString(60);
 textFont(font,48);
 textAlign(LEFT, BOTTOM);

 // Time Text Shadow Effect - You don't have to change this!
 fill(0, 120);
 text(timeString, 3, height + 3);

 // Actual Time Text
 color timeTextColor = getTimeTextColor(gameTimer);   
 fill(timeTextColor);
 text(timeString, 0, height);
}



boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bh){
  return  ax + aw > bx &&    // a right edge past b left
        ay + ah > by &&    // a top edge past b bottom
        ay < by + bh;
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
