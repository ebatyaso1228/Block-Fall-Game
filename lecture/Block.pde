/*******************************
 Block
 *******************************/
final int MAX_BLOCKS = 208;

float[] blockX = new float[MAX_BLOCKS];
float[] blockY = new float[MAX_BLOCKS];

float[] blockWidth = new float[MAX_BLOCKS];
float[] blockHeight = new float[MAX_BLOCKS];
boolean[] blockHitFlag = new boolean[MAX_BLOCKS];

final int BLOCK_ROWS  =  16;  // ブロックの横一列の個数
final int BLOCK_GAP  =  2;    // ブロックとブロックの間隔

float blockVX = 8.0f;
float blockVY = 8.0f;



void moveBlocks() {
  // Blockは動かない
}

/* Step2-1. Blockの描画処理 */
void drawBlocks() {
  for (int i = 0; i < MAX_BLOCKS; i++ ) {
    if ( blockHitFlag[i]  ==  false ) {
      rect(blockX[i], blockY[i], blockWidth[i], blockHeight[i]);
    }
  }
  
    for (int i = 0; i < MAX_BLOCKS; i++ ) {
    if ( blockHitFlag[i]  ==  true ) {
      blockX[i] = blockX[i] + blockVX;
      blockY[i] = blockY[i] + blockVY;
      rect(blockX[i], blockY[i], blockWidth[i], blockHeight[i]);
      
      if(blockX[i]>width || blockX[i] < 0){
        blockVX = -blockVX;
      }
      
      if(blockY[i] < 0){
        blockVY = -blockVY;
      
      }
      
      
      
      
    }
  }
  
  
  
}

/* Step2-3. ブロックの配置処理 */
void arrangeBlocks() {
  int i = 0;
  while ( i < MAX_BLOCKS ) {
    blockWidth[i] = 78.0f;
    blockHeight[i] = 20.0f;
    blockHitFlag[i] = false;
    blockX[i] = BLOCK_GAP + i % BLOCK_ROWS * (blockWidth[i] + BLOCK_GAP);
    blockY[i] = BLOCK_GAP + i / BLOCK_ROWS * (blockHeight[i] + BLOCK_GAP);
    i++;
  }
}
