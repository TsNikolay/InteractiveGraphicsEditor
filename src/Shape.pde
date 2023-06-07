class Shape {
    boolean isFilled;
    int redRGB, greenRGB, blueRGB,
    shapeWidth, shapeHeight, shapeStrokeWeight,
    x, y, strokeWeight, rotatePosition, xForRestore , yForRestore ;

  public Shape(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {
    this.redRGB = redRGB;
    this.greenRGB = greenRGB;
    this.blueRGB = blueRGB;
    this.shapeWidth = shapeWidth;
    this.shapeHeight = shapeHeight;
    this.strokeWeight = strokeWeight;
    this.x = mouseX;
    this.y = mouseY;
    this.rotatePosition = rotatePosition;
    this.isFilled = isFilled;
  }

  public void drawShape() {} //This method has been rewritten in child classes

  public void drawShapeForMouse() {} //This method has been rewritten in child classes

  public boolean isCursorOnShape() { return false; } //This method has been rewritten in child classes

  public void increaseSize() {
    if (shapeWidth <= 750) {
      this.shapeWidth += shapeWidth / 10;
      this.shapeHeight += shapeHeight / 10;
    }
  }

  public void decreaseSize() {
    if (shapeWidth >= 20) {
      this.shapeWidth -= shapeWidth / 10;
      this.shapeHeight -= shapeHeight / 10;
    }
  }

  public void setColor(int[] RGBCode) {
    this.redRGB = RGBCode[0];
    this.greenRGB = RGBCode[1];
    this.blueRGB = RGBCode[2];

    painter.currentRed = RGBCode[0];
    painter.currentGreen = RGBCode[1];
    painter.currentBlue = RGBCode[2];
  }

  public void setStrokeWeight(int[] strokeWeights) {
    this.strokeWeight = strokeWeights[toolbar.indexOfAdditionalToolMenu];
    painter.currentStrokeWeight = strokeWeights[toolbar.indexOfAdditionalToolMenu];
  }

  public void rotateFigure() {
    if (this.rotatePosition != 4) {
      this.rotatePosition++;
    } else {
      this.rotatePosition = 1;
    }
  }

  public void fillFigure() {
    this.isFilled = !this.isFilled;
    painter.currentFillPresence = !painter.currentFillPresence;
  }
}
