class Time{


int gameTimer ;

  Time(int value){
  gameTimer = value;

  }
  
  
void drawTimerUI(){
 String timeString = convertFramesToTimeString(60);
 textFont(font,48);
 textAlign(LEFT, BOTTOM);

 // Time Text Shadow Effect - You don't have to change this!
 fill(0, 120);
 text(timeString,  width-127, height + 3);

 // Actual Time Text
 color timeTextColor = getTimeTextColor(gameTimer);   
 fill(timeTextColor);
 text(timeString,  width-130, height);
}


String convertFramesToTimeString(int frames){ 
int minute=floor((gameTimer/frames)/frames);
int secound=floor(gameTimer%(frames*frames)/frames);
String min=nf(minute,2);
String sec=nf(secound,2);
 return min+":"+sec;
 
}

color getTimeTextColor(int frames){     
  if(frames>1200){
  return #D8E2DC;
  }else
  if(frames<1200 && frames<600){
  return #F25F5C;
  }else{
  return #FFCDB2;
  }
}




void timeSetting(){
    gameTimer --;  
    
    if(gameTimer <= 0){ 
    gameState = GAME_OVER1;
    }
 }
}