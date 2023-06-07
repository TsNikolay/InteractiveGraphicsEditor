class Arrow extends Shape {
  private int shapeWidth, shapeHeight;
  
  public Arrow(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {
    super(shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition, isFilled);
    this.shapeWidth = shapeWidth;
    this.shapeHeight = shapeHeight;
    this.x = mouseX - shapeWidth / 2;
    this.y = mouseY - shapeHeight / 2;
  }
  
  public void drawShape() {
    strokeWeight(this.strokeWeight);
    stroke(this.redRGB, this.greenRGB, this.blueRGB);
    fillShape(); 
      
    
    if (xForRestore == 0 || yForRestore == 0) {   
      int x = this.x + shapeWidth / 4;
      int y = this.y + shapeHeight / 4;
      drawArrowWithRotate(x, y, shapeWidth, shapeHeight); 
      xForRestore = x;
      yForRestore = y;
    } else {
      drawArrowWithRotate(xForRestore, yForRestore, shapeWidth, shapeHeight); 
    }
          
  } 
              
  public void drawShapeForMouse() { 
    strokeWeight(painter.cursorShape.strokeWeight);
    stroke(painter.cursorShape.redRGB, painter.cursorShape.greenRGB, painter.cursorShape.blueRGB);
    fillShape();
    int x = mouseX - painter.cursorShape.shapeWidth / 4;
    int y = mouseY - painter.cursorShape.shapeHeight / 4;                 
    drawArrowWithRotate(x, y, painter.cursorShape.shapeWidth, painter.cursorShape.shapeHeight);                           
  } 
  
  public void drawArrowWithRotate(int shapeX, int shapeY, int shapeWidth, int shapeHeight) {
    if (rotatePosition  == 4) { //down
      drawArrowDown(shapeX, shapeY, shapeWidth, shapeHeight);
    } else if (rotatePosition == 3) { //left
      drawArrowLeft(shapeX, shapeY, shapeWidth, shapeHeight);
    } else if (rotatePosition == 2) { // up
      drawArrowUp(shapeX, shapeY, shapeWidth, shapeHeight);
    } else { // right
      drawArrowRight(shapeX, shapeY, shapeWidth, shapeHeight);
    }
  }
  
  public void drawArrowDown(int x, int y, int shapeWidth, int shapeHeight) {
    float rectX = x;
    float rectY = y;
    float x1 = x + shapeWidth / 4;
    float y1 = y + shapeHeight * 3.5;
    float x2 = x1 - shapeWidth / 2;
    float y2 = y + shapeWidth;
    float x3 = x2 + shapeWidth;
    float y3 = y + shapeWidth;          
    rect(rectX, rectY, shapeHeight, shapeWidth);
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  public void drawArrowLeft(int x, int y, int shapeWidth, int shapeHeight) {
    float rectX = x;
    float rectY = y;
    float x1 = x;
    float y1 = y + shapeHeight * 1.5;
    float x2 = x1;
    float y2 = y1 - shapeHeight * 2;
    float x3 = x1 - (shapeWidth * sqrt(3)) / 2;
    float y3 = y1 - shapeHeight;          
    rect(rectX, rectY, shapeWidth, shapeHeight);
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  public void drawArrowUp(int x, int y, int shapeWidth, int shapeHeight) {
    float rectX = x;
    float rectY = y + shapeHeight;
    float x1 = x + shapeWidth / 4;
    float y1 = y - shapeHeight / 2;
    float x2 = x1 - shapeWidth / 2;
    float y2 = y + shapeHeight;
    float x3 = x2 + shapeWidth;
    float y3 = y + shapeHeight;    
    rect(rectX, rectY, shapeHeight, shapeWidth);
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  public void drawArrowRight(int x, int y, int shapeWidth, int shapeHeight) {
    float rectX = x;
    float rectY = y;                     
    float x1 = x + shapeWidth;
    float y1 = y + shapeHeight * 1.5 ;
    float x2 = x1;
    float y2 = y1 - shapeHeight * 2;
    float x3 = x1 + (shapeWidth * sqrt(3)) / 2;
    float y3 = y1 - shapeHeight;
    rect(rectX, rectY, shapeWidth, shapeHeight);
    triangle(x1, y1, x2, y2, x3, y3);
  }
    
  public boolean isCursorOnShape() {
    float x1 = this.x + shapeWidth;
    float y1 = this.y + shapeHeight * 1.5 ;
    float x2 = x1;
    float y2 = y1 - this.shapeHeight * 2;
    float x3 = x1 + (this.shapeWidth * sqrt(3)) / 2;
    float y3 = y1 - this.shapeHeight;
    float middleX = (x1 + x2 + x3) / 3;
    float middleY = (y1 + y2 + y3) / 3;
    float distance = dist(mouseX, mouseY, middleX, middleY);
      
    if (xForRestore != 0 || yForRestore != 0) {
      x = xForRestore;
      y = yForRestore;
    }
    return ((mouseX >= x && mouseX <= x + shapeWidth &&
      mouseY >= y && mouseY <= y + shapeHeight) || distance <= shapeWidth / 2);
  }
     
  public void fillShape() {
    boolean isFilled = this.isFilled;
    if (isFilled) {
      fill(this.redRGB, this.greenRGB, this.blueRGB);
    } else {
      noFill();
    }
  }
}
