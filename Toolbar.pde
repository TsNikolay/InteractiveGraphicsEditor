class Toolbar {
  Button arrow, brush, circle, 
         rectangle, ellipse, heptagon,
         square, star, triangle,
         save, create, file, 
         colors, brushTypes, laundry,
         laundryForShapes, laundryForLines, redStroke,
         greenStroke, blueStroke, yellowStroke, blackStroke;
  ArrayList<Button> tools = new ArrayList<>();
  ArrayList<Button> additionalTools = new ArrayList<>();
  ArrayList<Button> additionalToolsMenu = new ArrayList<>(); 
  int indexOfTool = -1;
  int indexOfAdditionalTool = -1;
  int indexOfAdditionalToolMenu = -1;
       
  public Toolbar() {
    String[] toolPaths = {
      "/shapesImages/file.jpg", 
      "/shapesImages/new.jpg", 
      "/shapesImages/laundry.jpg", 
      "/shapesImages/circle.jpg", 
      "/shapesImages/ellipse.jpg", 
      "/shapesImages/square.jpg", 
      "/shapesImages/rectangle.jpg", 
      "/shapesImages/triangle.jpg", 
      "/shapesImages/heptagon.jpg", 
      "/shapesImages/star.jpg", 
      "/shapesImages/arrow.jpg"
    };

    for (String path : toolPaths) {
      Button button = new Button(tools.size() * 100, 0, path);
      tools.add(button);
    }
  }

  public void drawToolbar(ArrayList<Button> toolbar) {
    for (int i = 0; i < toolbar.size(); i++) {
      toolbar.get(i).drawButton();
      if (toolbar.get(i).isSelected) {
        toolbar.get(i).drawFrame();
      }
    }
  }
  
  void clearToolbar(ArrayList<Button> toolbar) {     
    toolbar.clear();
  }
  
  public void generateAdditionalToolbar() {
    int x = this.indexOfTool * 100;       
    Button additionalButton1;
    Button additionalButton2;
   
    if (this.indexOfTool == 0) {
      additionalButton1 = new Button(x, 100, "/shapesImages/upload.jpg");
      additionalButton2 = new Button(x, 200, "/shapesImages/save.jpg");        
    } else if (this.indexOfTool == 1 || this.indexOfTool == 2) {
      return;            
    } else {        
      additionalButton1 = new Button(x, 100, "/shapesImages/color.jpg");
      additionalButton2 = new Button(x, 200, "/shapesImages/type.jpg");        
    }
    additionalTools.add(additionalButton1);
    additionalTools.add(additionalButton2);
  }
  
  public void generateAdditionalToolbarMenu() {
    int x = indexOfTool * 100;
    int y = (indexOfAdditionalTool + 1) * 100;
    
    if (indexOfTool == 0) {
      if (indexOfAdditionalTool == 0) {
        database.uploadAllFiguresFromDB();
      } else {
        database.deleteAllFiguresFromDB();
        database.addAllFiguresToDB();                                                                      
      }
    } else {
      String[] paths;
      int increment = (indexOfTool <= 5) ? 100 : -100;

      if (indexOfAdditionalTool == 0) {
        paths = new String[]{"/shapesImages/red.jpg", "/shapesImages/blue.jpg", "/shapesImages/green.jpg", "/shapesImages/yellow.jpg", "/shapesImages/black.jpg"};
      } else {
        paths = new String[]{"/shapesImages/thinBrash.jpg", "/shapesImages/mediumBrash.jpg", "/shapesImages/bigBrash.jpg"};
      }

      for (int i = 0; i < paths.length; i++) {
        int buttonX = x + (i * increment) + ((indexOfTool <= 5) ? 100 : -100);
        Button button = new Button(buttonX, y, paths[i]);
        additionalToolsMenu.add(button);
      }
    }
  }
  
  public void selectNewToolInToolbar(ArrayList<Button> tools) {
    for (int i = 0; i < tools.size(); i++) {                
      if (tools.get(i).isSelected) {            
        tools.get(i).isSelected = false;             
      }

      if (tools.get(i).isCursorOnButton()) {    
        tools.get(i).isSelected = true; 

        if (isCursorOnToolbar()) {
          indexOfTool = i;
        }
        if (isCursorOnAdditionalToolbar()) {
          indexOfAdditionalTool = i;
        }
        if (isCursorOnAdditionalToolbarMenu()) {
          indexOfAdditionalToolMenu = i;
        }             
      }
    }   
  }
   
  public void selectNewToolByItem() {
    if (indexOfTool > -1 && indexOfTool <= 10) {
      for (int i = 0; i < tools.size(); i++) {  
        if (tools.get(i).isSelected) {           
          tools.get(i).isSelected = false;
        }
        tools.get(indexOfTool).isSelected = true;
      }   
    }
  }
  
  public boolean isCursorOnToolbar() {
    return (mouseX >= 0 && 
            mouseX <= width && 
            mouseY >= 0 && 
            mouseY <= 100);
  }   
    
  public boolean isCursorOnAdditionalToolbar() {
    float leftBorder = this.indexOfTool * 100;
    float rightBorder = leftBorder + 100;
    float topBottom = 100;
    float bottomBorder = (this.additionalTools.size() + 1) * 100;
      
    return (mouseX >= leftBorder && mouseX <= rightBorder && mouseY >= topBottom && mouseY <= bottomBorder);
  } 
    
  public boolean isCursorOnAdditionalToolbarMenu() {
    if (this.indexOfTool <= 5) {
      return (mouseX >= (this.indexOfTool + 1) * 100 && 
              mouseX <= ((this.indexOfTool + 1) + (this.additionalToolsMenu.size())) * 100 && 
              mouseY >= (this.indexOfAdditionalTool + 1) * 100 && 
              mouseY <= (this.indexOfAdditionalTool + 2) * 100);           
    } else {
      return (mouseX >= ((this.indexOfTool) - (this.additionalToolsMenu.size())) * 100 && 
              mouseX <= (this.indexOfTool) * 100 && 
              mouseY >= (this.indexOfAdditionalTool + 1) * 100 && 
              mouseY <= (this.indexOfAdditionalTool + 2) * 100);
    } 
  }
}
