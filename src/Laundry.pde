class Laundry {
  
  public void removeShape() {
    for (int i = 0; i < allPaintedFigures.size(); i++) {        
      if (allPaintedFigures.get(i).isCursorOnShape()) {                       
        allPaintedFigures.remove(allPaintedFigures.get(i));
        //println(allPaintedFigures);
      }       
    }
  }
}
