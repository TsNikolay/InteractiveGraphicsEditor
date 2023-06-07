class Heptagon extends Shape {
  
  public Heptagon(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {  
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
      float centerX = this.x;
      float centerY = this.y;
      float radius = this.shapeWidth; // Радиус семиугольника
      if (rotatePosition % 2 == 1) {
        drawNormalHeptagon(centerX, centerY, radius);
        xForRestore = this.x;
        yForRestore = this.y;
      } else {          
        drawRotatedHeptagon(centerX, centerY, radius);
        xForRestore = this.x;
        yForRestore = this.y;
      }
    } else {
      float centerX = xForRestore;
      float centerY = yForRestore;
      float radius = this.shapeWidth; // Радиус семиугольника
      if (rotatePosition % 2 == 1) {
        drawNormalHeptagon(centerX, centerY, radius);
      } else {          
        drawRotatedHeptagon(centerX, centerY, radius);
      }
    }      
  }
  
  public void drawShapeForMouse() {  
    strokeWeight(painter.cursorShape.strokeWeight);
    stroke(painter.cursorShape.redRGB, painter.cursorShape.greenRGB, painter.cursorShape.blueRGB);
    fillShape();
    float centerX = mouseX; 
    float centerY = mouseY; 
    float radius = painter.cursorShape.shapeWidth;
    if (rotatePosition % 2 == 1) {
      drawNormalHeptagon(centerX, centerY, radius);
    } else {          
      drawRotatedHeptagon(centerX, centerY, radius);
    }
  }
  
  public void drawNormalHeptagon(float centerX, float centerY, float radius) {
    int numSides = 7; 
    float angle = 2 * PI / numSides; 

    beginShape();
    for (int i = 0; i < numSides; i++) {
      float x = centerX + sin(i * angle) * radius; 
      float y = centerY - cos(i * angle) * radius; 
      vertex(x, y); 
    }
    endShape(CLOSE);
  }
  
  public void drawRotatedHeptagon(float centerX, float centerY, float radius) {
    int numSides = 7; 
    float angle = 2 * PI / numSides; 

    beginShape();
    for (int i = 0; i < numSides; i++) {
      float x = centerX - sin(i * angle) * radius; 
      float y = centerY + cos(i * angle) * radius; 
      vertex(x, y); 
    }
    endShape(CLOSE);
  }
  
  public boolean isCursorOnShape() {
    if (xForRestore != 0 || yForRestore != 0) {
      x = xForRestore;
      y = yForRestore;
    }
    float distance = dist(mouseX, mouseY, x, y);
    return distance <= shapeWidth;
  }
  
  public void fillShape() {
    if (this.isFilled) {
      fill(this.redRGB, this.greenRGB, this.blueRGB);
    } else {
      noFill();
    }
  }
}
