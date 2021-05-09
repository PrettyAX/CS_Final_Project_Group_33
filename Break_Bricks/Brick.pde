class Brick {//Brick class
  int xPos; //x coordinate of brick
  int yPos; //y coordinate of brick
  int bHeight=20; //brick height
  int bWidth=50; //brick width
  Brick(int x, int y){ //constructor
    this.xPos=x;
    this.yPos=y;
  }
  
  void display() { //display method for displaying bricks
    rectMode(CENTER);
    fill(222,31,31); //fills the bricks with red color
    rect(xPos, yPos, bWidth, bHeight); //draws brick with rectangle method
  }
  
  boolean isCollision(Ball ball){ //checks if ball collides with brick
    if (xPos - bWidth/2 <= ball.xCoordinate && 
        ball.xCoordinate <= xPos + bWidth/2 &&
        yPos + bHeight/2 > ball.yCoordinate-ball.radius){
          return true;}
        else{
          return false;
          }
  }
}
