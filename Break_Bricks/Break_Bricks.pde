import ddf.minim.*; //imports the minim audio library
AudioSnippet file; //instantiates an AudioSnipper called file
Minim minim; //instantiates a Minim called minim
int BrickRows=3;//number of brick rows
int bHeight=20;//brick height
int bWidth=50;//bright width
int ballSize=5;//size of the ball
Brick[] bricks=new Brick[0];//creates an array of Brick objects called bricks
Paddle paddle;//creates a Paddle object called paddle
Ball ball;//creates a Ball object called ball
PImage bg;//creates a PImage object called bg

void setup(){ //uses the setup method of Processing
  size(500,500);//sets up canvas to be 500 by 500
  smooth(); //draws everything with smooth edges
  bg=loadImage("win.png"); //sets bg to the imported image
  minim= new Minim(this); 
  file=minim.loadSnippet("Cheering.mp3");//sets file to the imported sound
  for(int i=0;i<BrickRows;i++){ //for loop for setting bricks
    int loc=bHeight/2+i*bHeight;
    int offset=0;
    if(i%2==0){
      offset=bWidth/2;//offsets the brick row if it is an even row
    }
    for (int k=offset;k<width+bWidth/2.0;k+=bWidth){ 
      bricks=(Brick[]) append(bricks,new Brick(k,loc)); //sets bricks
    }
    
  }
  paddle=new Paddle(); 
}
void draw(){ //uses the draw method of Processing
  background(255); //sets background color to white
  for (int g=0;g<bricks.length;g++){ //for loop for displaying bricks
    if (bricks[g] != null){
      bricks[g].display();
    }
  }
  if (ball!= null){ //if statement for displaying ball
    ball.display();
    ball.update();
  }
  paddle.display(); //displays the paddle
  
  if (ball != null && paddle.isCollision(ball)) { //checks if ball and paddle makes contact
    ball.b();
    paddle.speed(ball);
  }
  
  if (ball!=null){ 
    for (int p=0; p<bricks.length;p++){ //checks if ball contacts the bricks
      if (bricks[p]!=null && bricks[p].isCollision(ball)==true) {
        ball.b();
        bricks[p]=null;
      }
    }
  }
  if (ball!=null && ball.yCoordinate-ballSize<0){ //checks if ball bounces on sides
    ball.b();
  }
  if (ball!=null && ball.yCoordinate-ballSize>height){ //checks if ball falls below paddle
    ball=null;
  }
  boolean winCondition=true;
  for (int i=0;i<bricks.length;i++){ //for loop that checks if all bricks are gone
    if (bricks[i] != null) {
      winCondition=false;
      break;
    }
  }
  if (winCondition){ //checks for win condition
    //println("WOOOOHOOOOO, YOU WON");
    background(bg); //displays image
    file.play(); //plays applause
    //exit();
  }
}
void mouseClicked() { //uses Processing method of mouseClicked
    if (ball == null) { //checks if ball is null
      ball = new Ball(paddle.xPosition, height - paddle.pHeight - (ballSize*2)/2,ballSize, 0, -4);
    }//shoots out a new ball
}
