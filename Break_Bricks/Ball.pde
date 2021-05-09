class Ball{ //Ball class
  int xCoordinate; //x Coordinate of ball
  int yCoordinate;//y coordinate of ball
  int radius;//radius of ball
  int xspeed;//speed along x axis
  int yspeed;//speed along y axis
  Ball(int x, int y, int r, int xs,int ys){ //constructor
    this.xCoordinate=x;
    this.yCoordinate=y;
    this.radius=r;
    this.xspeed=xs;
    this.yspeed=ys;
  }
  
  void display() { //display method 
    fill(0); //color of ball
    ellipse(xCoordinate,yCoordinate,radius*2,radius*2); //draws ball
  }
  
  void update() { //update method
    xCoordinate+=xspeed;
    yCoordinate+=yspeed;
    if(xCoordinate>width || xCoordinate<0) {
      xspeed*=-1;
    }
    
    
  }
  void b(){//bounce method for when ball contacts something
    yspeed*=-1;
  }
  

}
