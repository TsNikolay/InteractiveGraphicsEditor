class Triangle extends Shape {
      
    public Triangle(int shapeWidth, int shapeHeight, int redRGB, int greenRGB, int blueRGB, int strokeWeight, int rotatePosition, boolean isFilled) {  
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
       this.y = int(mouseY + (shapeHeight * sqrt(3)) / 6);      
    }
    
    public void drawShape() {
      strokeWeight(this.strokeWeight);
      stroke(this.redRGB, this.greenRGB, this.blueRGB);
      fillShape();
      
      if (xForRestore == 0 || yForRestore == 0) {
        float x1 = this.x; 
        float y1 = this.y; 
        float x2 = x1 + this.shapeWidth;
        float y2 = y1;
        float x3 = x1 + this.shapeWidth / 2;
        float y3 = y1 - (this.shapeHeight * sqrt(3)) / 2;
        if (this.rotatePosition % 2 == 1) {
          triangle(x1, y1, x2, y2, x3, y3);
          xForRestore = int(x1);
          yForRestore = int(y1);
        } else {          
          drawRotatedTriangle(x1, y1, x2, y2, x3, y3);
          xForRestore = int(x1);
          yForRestore = int(y1);
        }       
      } else {
        float x1 = xForRestore; 
        float y1 = yForRestore; 
        float x2 = x1 + this.shapeWidth;
        float y2 = y1;
        float x3 = x1 + this.shapeWidth / 2;
        float y3 = y1 - (this.shapeHeight * sqrt(3)) / 2;
        if (this.rotatePosition % 2 == 1) {
          triangle(x1, y1, x2, y2, x3, y3);          
        } else {          
          drawRotatedTriangle(x1, y1, x2, y2, x3, y3);         
        }
      }                           
    } 
    
    
   public void drawShapeForMouse() {  
      strokeWeight(painter.cursorShape.strokeWeight);
      stroke(painter.cursorShape.redRGB, painter.cursorShape.greenRGB, painter.cursorShape.blueRGB);
      fillShape();
      float sideLength = painter.cursorShape.shapeWidth;
      float x1 = mouseX - sideLength / 2;
      float y1 = mouseY + (sideLength * sqrt(3)) / 6; 
      float x2 = x1 + sideLength;
      float y2 = y1;
      float x3 = x1 + sideLength / 2;
      float y3 = y1 - (sideLength * sqrt(3)) / 2; 
      
      if (rotatePosition % 2 == 1) {
        triangle(x1, y1, x2, y2, x3, y3);      
      } else {          
        drawRotatedTriangle(x1, y1, x2, y2, x3, y3);
      }
   }

   
    
   public boolean isCursorOnShape() {
     float x1 = this.x; 
     float y1 = this.y; 
     
      if (xForRestore != 0 || yForRestore != 0) {
         x1 = xForRestore;
         y1 = yForRestore;
      } 
      
      float x2 = x1 + this.shapeWidth;
      float y2 = y1;
      float x3 = x1 + this.shapeWidth / 2;
      float y3 = y1 - (this.shapeHeight * sqrt(3)) / 2;
      float middleX = (x1 + x2 + x3) / 3;
      float middleY = (y1 + y2 + y3) / 3;
      float distance = dist(mouseX, mouseY, middleX, middleY);
      return distance <= shapeWidth / 2;
    } 
            
    public void drawRotatedTriangle(float x1, float y1, float x2, float y2, float x3, float y3) {
      // Поворот на 60 градусов вправо
      float angle = radians(60);
      float centerX = (x1 + x2 + x3) / 3; 
      float centerY = (y1 + y2 + y3) / 3; 
            
      x1 -= centerX;
      y1 -= centerY;
      x2 -= centerX;
      y2 -= centerY;
      x3 -= centerX;
      y3 -= centerY;
           
      float newX1 = x1 * cos(angle) - y1 * sin(angle);
      float newY1 = x1 * sin(angle) + y1 * cos(angle);
      float newX2 = x2 * cos(angle) - y2 * sin(angle);
      float newY2 = x2 * sin(angle) + y2 * cos(angle);
      float newX3 = x3 * cos(angle) - y3 * sin(angle);
      float newY3 = x3 * sin(angle) + y3 * cos(angle);
          
      x1 = newX1 + centerX;
      y1 = newY1 + centerY;
      x2 = newX2 + centerX;
      y2 = newY2 + centerY;
      x3 = newX3 + centerX;
      y3 = newY3 + centerY;
      
      triangle(x1, y1, x2, y2, x3, y3);
    }
    
    public void fillShape() {
      if (this.isFilled) {
        fill(this.redRGB, this.greenRGB, this.blueRGB);
      } else {
        noFill();
      }
    }
}
