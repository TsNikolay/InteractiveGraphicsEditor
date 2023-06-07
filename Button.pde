class Button {
  private int xCoord,yCoord,btnWidth,btnHeight;
  private boolean isSelected;
  private PImage btnImage;
  
    public Button(int xCoord,int yCoord, String btnImagePath){
      btnImage = loadImage(btnImagePath);
      isSelected = false;
      this.xCoord = xCoord;
      this.yCoord = yCoord;
      this.btnWidth = btnImage.width;
      this.btnHeight = btnImage.height;      
    }
    
    public void drawButton(){
         image(btnImage, xCoord , yCoord);
    }
    
    public void drawFrame(){
        noFill();
        stroke(255, 165, 0);
        strokeWeight(5);
        rect(this.xCoord, this.yCoord, this.btnWidth - 3, this.btnHeight - 3);
    }
    
    public boolean isCursorOnButton() {
      return (mouseX >= this.xCoord && 
          mouseX <= this.xCoord + this.btnWidth && 
          mouseY >= this.yCoord && 
          mouseY <= this.yCoord + this.btnHeight);
    }
}
