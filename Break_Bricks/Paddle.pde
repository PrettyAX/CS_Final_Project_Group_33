class Paddle{ //Paddle class
  int pHeight; //paddle height
  int pWidth; //paddle width
  int yPosition;//y position of paddle
  int xPosition=mouseX;//x position of paddle is wherever the mouse is
  int prevPos; //previous position of paddle
  Paddle(){//constructor
    this.pHeight=30;
    this.pWidth=int(60*1.5);
    this.yPosition=height-(pHeight/2);
    this.xPosition=mouseX;
  }
  void display() {//display method for displaying paddle
    fill(0);//fills paddle with black color
    prevPos=xPosition;
    xPosition=mouseX;
    rect(xPosition,yPosition,pWidth,pHeight);//draws paddle with rectangle method
  }
  boolean isCollision(Ball ball){//method for checking if ball contacted paddle
    if(xPosition-(pWidth/2)<=ball.xCoordinate && 
       xPosition+(pWidth/2)>=ball.xCoordinate && 
       ball.yCoordinate+ball.radius>yPosition-(pHeight/2)){
      return true;
    }
    else {
      return false;
    }
  }
  void speed(Ball ball){ //leaving speed of the ball after contacting paddle
    int sp=xPosition-prevPos;
    ball.xspeed+=sp;
  }
}
