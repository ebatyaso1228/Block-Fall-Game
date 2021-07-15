/*******************************
  Bar
 *******************************/
 
float barX = 200.0f;
float barY = 950.0f;
float barVX = 5.0f;
float barWidth = 500.0f;
float barHeight = 30.0f;

void moveBar(){
  if ( keyPressed ) {
    if ( keyCode == RIGHT ) {
      barX = barX + barVX;
    } else if ( keyCode == LEFT ) {
      barX = barX - barVX;
    }
  }
}

void drawBar(){
  rect(barX, barY, barWidth, barHeight);
}
