class Square extends Shape {

  public Square(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {
    super(shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition, isFilled);
    this.isFilled = isFilled;
    this.rotatePosition = rotatePosition;
    this.strokeWeight = strokeWeight;
    this.redRGB = redRGB;
    this.greenRGB = greenRGB;
    this.blueRGB = blueRGB;
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
      if (rotatePosition % 2 == 1) {
        rect(this.x, this.y, this.shapeWidth, this.shapeHeight);
        xForRestore = this.x;
        yForRestore = this.y;
      } else {
        int x = this.x + shapeWidth / 2;
        int y = this.y + shapeHeight / 2;
        drawRotatedSquare(x, y, this.shapeWidth, this.shapeHeight);
        xForRestore = this.x;
        yForRestore = this.y;
      }
    } else {
      if (rotatePosition % 2 == 1) {
        rect(xForRestore, yForRestore, this.shapeWidth, this.shapeHeight);
      } else {
        int x = xForRestore + shapeWidth / 2;
        int y = yForRestore + shapeHeight / 2;
        drawRotatedSquare(x, y, this.shapeWidth, this.shapeHeight);
      }
    }
  }

  public void drawShapeForMouse() {
    strokeWeight(painter.cursorShape.strokeWeight);
    stroke(painter.cursorShape.redRGB, painter.cursorShape.greenRGB, painter.cursorShape.blueRGB);
    fillShape();

    if (rotatePosition % 2 == 1) {
      int x = mouseX - painter.cursorShape.shapeWidth / 2;
      int y = mouseY - painter.cursorShape.shapeHeight / 2;
      rect(x, y, painter.cursorShape.shapeWidth, painter.cursorShape.shapeHeight);
    } else {
      int x = mouseX;
      int y = mouseY;
      drawRotatedSquare(x, y, painter.cursorShape.shapeWidth, painter.cursorShape.shapeHeight);
    }
  }

  public void drawRotatedSquare(float x, float y, float shapeWidth, float shapeHeight) {
    
    beginShape(); 
   
    vertex(x - shapeWidth / 1.5, y); 
    vertex(x, y + shapeHeight / 1.5); 
    vertex(x + shapeWidth / 1.5, y); 
    vertex(x, y - shapeHeight / 1.5); 

    endShape(CLOSE); 
  }

  public boolean isCursorOnShape() {
    if (xForRestore != 0 || yForRestore != 0) {
      x = xForRestore;
      y = yForRestore;
    }
    return (mouseX >= x && mouseX <= x + shapeWidth &&
      mouseY >= y && mouseY <= y + shapeHeight);
  }

  public void fillShape() {
    if (this.isFilled) {
      fill(this.redRGB, this.greenRGB, this.blueRGB);
    } else {
      noFill();
    }
  }

}
