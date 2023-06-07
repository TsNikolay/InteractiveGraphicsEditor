class Circle extends Shape {
    
    public Circle(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {  
       super(shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition, isFilled);
       this.isFilled = isFilled;
       this.rotatePosition = rotatePosition;
       this.strokeWeight = strokeWeight;
       this.redRGB = redRGB;
       this.greenRGB = greenRGB;
       this.blueRGB = blueRGB;
       this.shapeWidth = shapeWidth;
       this.shapeHeight = shapeHeight;
    }
    
    public void drawShape() {  
      strokeWeight(this.strokeWeight);
      stroke(this.redRGB, this.greenRGB, this.blueRGB);      
      fillShape();
      if (xForRestore == 0 || yForRestore == 0) { 
        ellipse(this.x, this.y, this.shapeWidth, this.shapeHeight);
        xForRestore = this.x;
        yForRestore = this.y;      
      } else {  
        ellipse(xForRestore, yForRestore, this.shapeWidth, this.shapeHeight);                                       
      }  
    } 
            
    public void drawShapeForMouse() {   
      strokeWeight(painter.cursorShape.strokeWeight);
      stroke(painter.cursorShape.redRGB, painter.cursorShape.greenRGB, painter.cursorShape.blueRGB);
      fillShape();
      float squareX = mouseX;
      float squareY = mouseY;
      ellipse(squareX, squareY, painter.cursorShape.shapeWidth, painter.cursorShape.shapeHeight);
    } 
    
    public boolean isCursorOnShape() {
      if (xForRestore != 0 || yForRestore != 0) {
         x = xForRestore;
         y = yForRestore;
      }
      float distance = dist(mouseX, mouseY, x, y);
      return distance <= shapeWidth / 2;
    }
    
    public void fillShape() {
      if (this.isFilled) {
        fill(this.redRGB, this.greenRGB, this.blueRGB);
      } else {
        noFill();
      }
    }
}
