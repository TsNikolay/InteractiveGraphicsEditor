import java.util.*;
import de.bezier.data.sql.*;

ArrayList<Shape> allPaintedFigures = new ArrayList<>();

class Database {
 
    public Database(){

    }

    public void addAllFiguresToDB(){
        for(int i = 0; i < allPaintedFigures.size(); i++){     
            String className = allPaintedFigures.get(i).getClass().getSimpleName();       
            int newIsFilled = allPaintedFigures.get(i).isFilled ? 1 : 0;      
            int newRotatePosition = allPaintedFigures.get(i).rotatePosition ;
            int newStrokeWeight = allPaintedFigures.get(i).strokeWeight;
            int newRedRGB = allPaintedFigures.get(i).redRGB;
            int newGreenRGB = allPaintedFigures.get(i).greenRGB;
            int newBlueRGB = allPaintedFigures.get(i).blueRGB;
            int newShapeWidth = allPaintedFigures.get(i).shapeWidth;
            int newShapeHeight = allPaintedFigures.get(i).shapeHeight; 
            int newX = allPaintedFigures.get(i).x;
            int newY = allPaintedFigures.get(i).y; 
            
            if (db.connect()) {
                db.query("INSERT INTO shapes VALUES('" + className + "','" + newIsFilled + "','" + newRotatePosition + "','" + newStrokeWeight + "','" + newRedRGB + "','" + newGreenRGB + "','" + newBlueRGB + "','" + newShapeWidth + "','" + newShapeHeight + "','" + newX + "','" + newY + "')");
            } else {
                print("we can't connect to the database");
            }       
        }
    }

    public void deleteAllFiguresFromDB() {
        if (db.connect()) {
            db.query("DELETE FROM shapes");
        } else {
            print("we can't connect to the database");
        }
    }

    public void uploadAllFiguresFromDB(){
        if (db.connect()) {
            db.query("SELECT * FROM shapes");
            while (db.next()) {
                String className = db.getString("className");
                int isFilledInInt = db.getInt("isFilled");
                boolean isFilled;
                if(isFilledInInt == 1){
                    isFilled = true;
                } else {
                    isFilled = false;
                }

                int rotatePosition = db.getInt("rotatePosition");
                int strokeWeight = db.getInt("strokeWeight");
                int redRGB = db.getInt("redRGB");
                int greenRGB = db.getInt("greenRGB");
                int blueRGB = db.getInt("blueRGB");
                int shapeWidth = db.getInt("shapeWidth");
                int shapeHeight = db.getInt("shapeHeight");
                int xForRestore = db.getInt("x");
                int yForRestore = db.getInt("y");

                Shape shape = null;
                switch(className){
                    case "Circle":
                        shape = new Circle(shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;

                    case "Ellipse":
                        shape = new Ellipse(shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;

                    case "Square":        
                        shape = new Square( shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;

                    case "Rectangle":
                        shape = new Rectangle( shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;

                    case "Triangle":
                        shape = new Triangle( shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;

                    case "Heptagon":
                        shape = new Heptagon( shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;

                    case "Star":
                        shape = new Star( shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;

                    case "Arrow":
                        shape = new Arrow( shapeWidth, shapeHeight, redRGB, greenRGB, blueRGB, strokeWeight, rotatePosition,isFilled);
                        break;                
                }  

                if (shape != null){
                    shape.xForRestore = xForRestore;
                    shape.yForRestore = yForRestore;
                    println(shape.xForRestore,shape.yForRestore);
                    allPaintedFigures.add(shape);
                }
            }

        } else {
            println("Can't connect to the database");
        }
    }
}
