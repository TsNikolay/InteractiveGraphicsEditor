class Painter {
  
  Shape cursorShape;
  Laundry laundry = new Laundry();
  private  int currentRed = 255;
  private  int currentGreen = 165;
  private  int currentBlue = 0;
  private  int currentStrokeWeight = 5;
  private  boolean currentFillPresence = false;
  
  public void selectShapeForCursor() {
    Shape[] shapes = new Shape[]{
      null,  //  file
      null,  //  brush
      null,  // laundry
      new Circle(100, 100, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence),  // Действия для кнопки circle
      new Ellipse(100, 50, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence),  // Действия для кнопки ellipse
      new Square(100, 100, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence),  // Действия для кнопки square
      new Rectangle(100, 50, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence),  // Действия для кнопки rectangle
      new Triangle(100, 100, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence),  // Действия для кнопки triangle
      new Heptagon(50, 50, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence),  // Действия для кнопки heptagon
      new Star(50, 50, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence),  // Действия для кнопки star
      new Arrow(100, 50, currentRed, currentGreen, currentBlue, currentStrokeWeight, 1, currentFillPresence)  // Действия для кнопки arrow
    };
    
    if (toolbar.indexOfTool >= 0 && toolbar.indexOfTool < shapes.length) {
      cursorShape = shapes[toolbar.indexOfTool];
    }
  }
  
  
  public void drawShapeOnCanvas() {
    if (toolbar.indexOfTool == 2) {
      laundry.removeShape();
      return;
    }
    
    if (toolbar.indexOfTool == 0 || toolbar.indexOfTool == 1) {
      return;
    }
    
    Shape[] shapes = new Shape[]{
      null,  //  file
      null,  //  brush
      null,  //  laundry
      new Circle(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled),  // Действия для кнопки circle
      new Ellipse(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled),  // Действия для кнопки ellipse
      new Square(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled),  // Действия для кнопки square
      new Rectangle(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled),  // Действия для кнопки rectangle
      new Triangle(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled),  // Действия для кнопки triangle
      new Heptagon(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled),  // Действия для кнопки heptagon
      new Star(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled),  // Действия для кнопки star
      new Arrow(cursorShape.shapeWidth, cursorShape.shapeHeight, cursorShape.redRGB, cursorShape.greenRGB, cursorShape.blueRGB, cursorShape.strokeWeight, cursorShape.rotatePosition, cursorShape.isFilled)  // Действия для кнопки arrow
    };
    
    if (toolbar.indexOfTool >= 0 && toolbar.indexOfTool < shapes.length) {     
      Shape shape = shapes[toolbar.indexOfTool];
      shape.drawShape();
      allPaintedFigures.add(shape);            
    }
  }
  
  
  public void setupSelectedProperty() {
    if (toolbar.indexOfAdditionalTool == 0) {
      selectColorForDrawing();
    } else if (toolbar.indexOfAdditionalTool == 1) {
      selectStrokeWeight();
    }
  }
  
  
  public void selectStrokeWeight() {
    int[] strokeWeights = {2, 6, 10};           
    cursorShape.setStrokeWeight(strokeWeights);
  }
  
  
  public void selectColorForDrawing() {          
    int[][] allColors = {{255, 0, 0}, {0, 0, 255}, {0, 255, 0}, {219, 213, 39}, {0, 0, 0}};
    int[] RGBCode = allColors[toolbar.indexOfAdditionalToolMenu];
    cursorShape.setColor(RGBCode);           
  }
  
  
  public void drawCurrentShapeWithCursor() {   
    if (!toolbar.isCursorOnToolbar() && toolbar.additionalTools.size() == 0) {
      if (toolbar.indexOfTool != -1 && cursorShape != null) {                         
        cursorShape.drawShapeForMouse();  
      }
    }
  }
  
  
  public void restoreAllShapesFromArray() {
    if (allPaintedFigures.size() != 0) {
      for (int i = 0; i < allPaintedFigures.size(); i++) {
        allPaintedFigures.get(i).drawShape();          
      }
    }      
  } 
  
  public void clearScreen() {
    allPaintedFigures.clear(); 
  }
}
