/***************************************************
 K214ブロック崩しゲームサンプルコード4
 2021年6月29日: ブロック崩しゲームが最低限実装されたVer.
 ***************************************************/

int count = 0 ;

void setup() {
  size(1280, 1024);
  arrangeBlocks();
}
void draw() {

  background(255, 255, 255); 
  

  
  

  /* BallとBarの衝突判定 */
  if (ballX > barX && ballX < barX + barWidth) {
    if (ballY > barY && ballY < barY + barHeight) {
      ballVY = -ballVY;
    }
  }

  /* Step2-2. Ballと複数Blockの衝突判定 */
  for ( int i = 0; i < MAX_BLOCKS; i++ ) {
    if  ( blockHitFlag[i] == false ) {
      if ( ballX > blockX[i] && ballX < blockX[i] + blockWidth[i] ) {
        if ( ballY > blockY[i] && ballY < blockY[i] + blockHeight[i] ) {
          ballVY = -ballVY;     
          blockHitFlag[i] = true;
        }
      }
    }
  }
  

  
  for ( int i = 0; i < MAX_BLOCKS; i++ ) {
    if  ( blockHitFlag[i] == true ) {
      if ( barX < blockX[i] && barX +  barWidth > blockX[i] + blockWidth[i] ) {
        if ( barY < blockY[i] && barY + barHeight > blockY[i] + blockHeight[i] ) {
          barWidth -= 25.0f;
          count++;
          


        }
      }
    }
    

  }





  /* Ball */
  moveBall();
  drawBall();

  /* Bar */
  moveBar();
  drawBar();

  /* Block */
  moveBlocks();
  drawBlocks();
 
  textSize(80);
  fill(0);
  text("COUNT"+count , 500,500);
  print(count);
     
     
  if(count>9){
    fill(0);
    rect(0,0,2000,2000);
    fill(255,0,0);
    textSize(100);
    text("CLEAR",500,500);
  
  }
  
  
  
  
}
