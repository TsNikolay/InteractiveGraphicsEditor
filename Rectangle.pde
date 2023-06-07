class Rectangle extends Shape {
  private  int shapeWidth, shapeHeight;

  public Rectangle(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {
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
      rect(this.x, this.y, this.shapeWidth, this.shapeHeight);
      xForRestore = this.x;
      yForRestore = this.y;
    } else {
      rect(xForRestore, yForRestore, this.shapeWidth, this.shapeHeight);
    }
  }

  public void drawShapeForMouse() {
    stroke(painter.cursorShape.redRGB, painter.cursorShape.greenRGB, painter.cursorShape.blueRGB);
    strokeWeight(painter.cursorShape.strokeWeight);
    fillShape();
    int x = mouseX - painter.cursorShape.shapeWidth / 2;
    int y = mouseY - painter.cursorShape.shapeHeight / 2;

    rect(x, y, painter.cursorShape.shapeWidth, painter.cursorShape.shapeHeight);
  }

  public boolean isCursorOnShape() {
    if (xForRestore != 0 || yForRestore != 0) {
      x = xForRestore;
      y = yForRestore;
    }
    return (mouseX >= x && mouseX <= x + shapeWidth &&
      mouseY >= y && mouseY <= y + shapeHeight);
  }

  public void rotateFigure() {
    int buffer = painter.cursorShape.shapeWidth;
    painter.cursorShape.shapeWidth = painter.cursorShape.shapeHeight;
    painter.cursorShape.shapeHeight = buffer;
  }

  public void fillShape() {
    if (this.isFilled) {
      fill(this.redRGB, this.greenRGB, this.blueRGB);
    } else {
      noFill();
    }
  }
}
