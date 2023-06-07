class Star extends Shape {

  public Star(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {
    super(shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition, isFilled);
    this.isFilled = isFilled;
    this.rotatePosition = rotatePosition;
    this.strokeWeight = strokeWeight;
    this.redRGB = redRGB;
    this.greenRGB = greenRGB;
    this.blueRGB = blueRGB;
    this.shapeWidth = shapeWidth;
    this.shapeHeight = shapeHeight;
    this.x = mouseX;
    this.y = mouseY;
  }

  public void drawShape() {
    strokeWeight(this.strokeWeight);
    stroke(this.redRGB, this.greenRGB, this.blueRGB);
    fillShape();

    if (xForRestore == 0 || yForRestore == 0) {
      float x = this.x;
      float y = this.y;
      float radius1 = this.shapeWidth; 
      float radius2 = this.shapeWidth / 2; 

      if (rotatePosition % 2 == 1) {
        drawNormalStar(x, y, radius1, radius2);
        xForRestore = this.x;
        yForRestore = this.y;
      } else {
        drawRotatedStar(x, y, radius1, radius2);
        xForRestore = this.x;
        yForRestore = this.y;
      }
    } else {
      float x = xForRestore;
      float y = yForRestore;
      float radius1 = this.shapeWidth; 
      float radius2 = this.shapeWidth / 2; 

      if (rotatePosition % 2 == 1) {
        drawNormalStar(x, y, radius1, radius2);
      } else {
        drawRotatedStar(x, y, radius1, radius2);
      }
    }

  }

  public void drawShapeForMouse() {
    strokeWeight(painter.cursorShape.strokeWeight);
    stroke(painter.cursorShape.redRGB, painter.cursorShape.greenRGB, painter.cursorShape.blueRGB);
    fillShape();
    float x = mouseX; 
    float y = mouseY;
    float radius1 = painter.cursorShape.shapeWidth; 
    float radius2 = painter.cursorShape.shapeWidth / 2; 
    if (rotatePosition % 2 == 1) {
      drawNormalStar(x, y, radius1, radius2);
    } else {
      drawRotatedStar(x, y, radius1, radius2);
    }
  }

  public boolean isCursorOnShape() {
    if (xForRestore != 0 || yForRestore != 0) {
      x = xForRestore;
      y = yForRestore;
    }
    float distance = dist(mouseX, mouseY, x, y);
    return distance <= shapeWidth;
  }


  public void drawNormalStar(float x, float y, float radius1, float radius2) {
    int numPoints = 5;
    float angleBetweenPoints = 2 * PI / numPoints; 
    float angleForFirstPoint = -PI / 2; 

    beginShape();

    for (int i = 0; i < numPoints; i++) {      
      float x1 = x + cos(angleForFirstPoint) * radius1;
      float y1 = y + sin(angleForFirstPoint) * radius1;

      vertex(x1, y1); 
      
      float x2 = x + cos(angleForFirstPoint + angleBetweenPoints / 2) * radius2;
      float y2 = y + sin(angleForFirstPoint + angleBetweenPoints / 2) * radius2;

      vertex(x2, y2); 

      angleForFirstPoint += angleBetweenPoints; 
    }
    endShape(CLOSE); 
  }


  public void drawRotatedStar(float x, float y, float radius1, float radius2) {
    int numPoints = 5; 

    float angleBetweenPoints = 2 * PI / numPoints; 

    float angleForFirstPoint = PI / 2;

    beginShape(); 

    for (int i = 0; i < numPoints; i++) {     
      float x1 = x + cos(angleForFirstPoint) * radius1;
      float y1 = y + sin(angleForFirstPoint) * radius1;

      vertex(x1, y1); 
     
      float x2 = x + cos(angleForFirstPoint + angleBetweenPoints / 2) * radius2;
      float y2 = y + sin(angleForFirstPoint + angleBetweenPoints / 2) * radius2;

      vertex(x2, y2); 

      angleForFirstPoint += angleBetweenPoints; 
    }
    endShape(CLOSE); 
  }

  public void fillShape() {
    if (this.isFilled) {
      fill(this.redRGB, this.greenRGB, this.blueRGB);
    } else {
      noFill();
    }
  }

}
