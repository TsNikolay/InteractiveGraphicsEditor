Toolbar toolbar;
Painter painter;
Database database;
SQLite db;

void setup() {
  size(1100, 800);
  background(255);
  toolbar = new Toolbar();
  painter = new Painter();
  database = new Database();
  db = new SQLite(this, "data/db.sqlite");
}

void draw() {
  background(255);
  painter.restoreAllShapesFromArray(); 
  painter.drawCurrentShapeWithCursor();
  toolbar.drawToolbar(toolbar.tools);
  toolbar.drawToolbar(toolbar.additionalTools);
  toolbar.drawToolbar(toolbar.additionalToolsMenu);
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    if (toolbar.isCursorOnToolbar()) {
      toolbar.selectNewToolInToolbar(toolbar.tools);
      painter.selectShapeForCursor();
      toolbar.clearToolbar(toolbar.additionalTools);
      toolbar.clearToolbar(toolbar.additionalToolsMenu);
      toolbar.generateAdditionalToolbar();
    }            
  } 
  
  if (mouseButton == LEFT) {   
    if (toolbar.isCursorOnToolbar()) {       
      toolbar.selectNewToolInToolbar(toolbar.tools);
      painter.selectShapeForCursor();
      toolbar.clearToolbar(toolbar.additionalTools);
      toolbar.clearToolbar(toolbar.additionalToolsMenu);
      if (toolbar.indexOfTool == 1) {
        painter.clearScreen();
      }
    } else if (toolbar.isCursorOnAdditionalToolbar() && !toolbar.additionalTools.isEmpty()) {
      toolbar.clearToolbar(toolbar.additionalToolsMenu);
      toolbar.selectNewToolInToolbar(toolbar.additionalTools);          
      toolbar.generateAdditionalToolbarMenu();
      toolbar.drawToolbar(toolbar.additionalToolsMenu);          
    } else if (toolbar.isCursorOnAdditionalToolbarMenu() && !toolbar.additionalTools.isEmpty()) {          
      toolbar.selectNewToolInToolbar(toolbar.additionalToolsMenu);          
      painter.setupSelectedProperty();
    } else if (toolbar.indexOfTool != -1) {
      toolbar.clearToolbar(toolbar.additionalTools);
      toolbar.clearToolbar(toolbar.additionalToolsMenu);          
      painter.drawShapeOnCanvas();          
    }     
  }
}

void mouseWheel(MouseEvent event) {
  if (toolbar.isCursorOnToolbar()) { 
    if (event.getCount() > 0 && toolbar.indexOfTool < 10) {
      toolbar.indexOfTool++;
    } else if (event.getCount() < 0 && toolbar.indexOfTool > 0) {
      toolbar.indexOfTool--;
    }
    toolbar.selectNewToolByItem();
    painter.selectShapeForCursor();
  } else if (painter.cursorShape != null) { 
    if (event.getCount() < 0) {
      painter.cursorShape.increaseSize();
    } else {
      painter.cursorShape.decreaseSize();
    }
  }
}

void keyPressed() {
  if (painter.cursorShape != null) {
    if (key == 'r' || key == 'R') {
      painter.cursorShape.rotateFigure();
    }
    if (key == 'f' || key == 'F') {
      painter.cursorShape.fillFigure();    
    }
  }
                        
  if (key == 'D' || key == 'd') { 
    database.deleteAllFiguresFromDB();
  }     
  
  if (key == 'q' || key == 'Q') { 
    println(allPaintedFigures);
  } 
}
