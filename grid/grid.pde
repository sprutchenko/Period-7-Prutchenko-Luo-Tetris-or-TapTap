Cell[][] grid;

// Number of columns and rows in the grid
int cols = 10;
int rows = 20;
int startTime, timePassed;
int waitTime=2000;
Block b;

void setup() {
  size(250,500);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*25,j*25,25,25);
      grid[i][j].display(119,113,56);
    }
  }
  startTime = millis();
  b= new Block(3);
}

void draw() {
  //background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  //for (int i = 0; i < cols; i++) {
    //for (int j = 0; j < rows; j++) {
      //grid[i][j].display(119,113,56);
    //}
  //}
  //Block b = new Block(6); 
  timePassed = millis() - startTime;
  if (timePassed > waitTime){ 
    if(b.checkLowest()){
       b.shiftDown();
       startTime = millis();
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  int x,y;   // x,y location
  int w,h;   // width and height
 

  // Cell Constructor
  Cell(int tempX, int tempY, int tempW, int tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
 
  } 
  
  void setColor(int a,int b, int c) {
     fill(a,b,c);
     rect(x,y,w,h);
  }

  void display(int p,int q, int r) {
    stroke(255);
    fill(p,q,r);
    rect(x,y,w,h); 
  }
  
  int getXcoor(){
    return x;
  }
  
  int getYcoor(){
    return y;
  }
  
  void setXcoor(int a){
    x=a;
  }
  
  void setYcoor(int a){
   y=a;
  }
}
   
class Block{
  Cell a,b,c,d;
  
  int type; 
  //type 1 = square, type 2 = stick, type 3 = "s" block, type 4 = "z" block, type 5 = "L" block, type 6 = flipped "L" block
  
  int lowest;
  int leftest;
  int rightest;
// to check limits of block movement

  void setBlockColor(int x, int y, int z){
       a.setColor(x,y,z);
       b.setColor(x,y,z);
       c.setColor(x,y,z);
       d.setColor(x,y,z);
  }
  
  Block(int x){
    type = x;
      
    if(x==1){
       a = new Cell(25*4,0,25,25);
       b = new Cell(25*5,0,25,25);
       c = new Cell(25*4,25,25,25);
       d = new Cell(25*5,25,25,25);
       setBlockColor(0,0,0);
       lowest = 25;
       rightest = 5*25;
       leftest = 4*25;
   }else if (x==2){
      a = new Cell(25*4,0,25,25);
      b = new Cell(25*4,25,25,25);
      c = new Cell(25*4,25*2,25,25);
      d = new Cell(25*4,25*3,25,25);
      setBlockColor(0,0,0);
      lowest = 75;
      rightest = 4*25;
      leftest= 4*25;
   }else if (x==3){
      a = new Cell(25*4,0,25,25);
      b = new Cell(25*5,0,25,25);
      c = new Cell(25*4,25,25,25);
      d = new Cell(25*3,25,25,25);
      setBlockColor(0,0,0);
      lowest = 25;
      rightest = 25*5;
      leftest = 25*3; 
   }else if (x==4){
      a = new Cell(25*3,0,25,25);
      b = new Cell(25*4,0,25,25);
      c = new Cell(25*4,25,25,25);
      d = new Cell(25*5,25,25,25);
      setBlockColor(0,0,0);
      lowest = 25;
      rightest = 25*5;
      leftest = 25*3;
   }else if (x==5){
      a = new Cell(25*3,25,25,25);
      b = new Cell(25*4,25,25,25);
      c = new Cell(25*5,25,25,25);
      d = new Cell(25*5,0,25,25);
      setBlockColor(0,0,0);
      lowest = 25;
      rightest = 25*5;
      leftest = 25*3;
   }else if (x==6){
      a = new Cell(25*3,0,25,25);
      b = new Cell(25*3,25,25,25);
      c = new Cell(25*4,25,25,25);
      d = new Cell(25*5,25,25,25);
      setBlockColor(0,0,0);
      lowest = 25;
      rightest = 25*5;
      leftest = 25*3;
  }
 }
 //checkLowest() checks whether the block has reached the bottom or not 
 boolean checkLowest(){
    if (lowest <= 25*18){
     return true;
    }else{
     return false;
    }
 } 
 //shifts down block by one unit, gets rid of previous color and adds new color at new location
 void shiftDown(){
   setBlockColor(119,113,56);
   a.setYcoor(a.getYcoor() + 25);
   b.setYcoor(b.getYcoor() + 25);
   c.setYcoor(c.getYcoor() + 25);
   d.setYcoor(d.getYcoor() + 25);
   lowest += 25;
   setBlockColor(0,0,0);
 }
 
 boolean checkRight(){
   if(rightest <= 10*25){
     return true;
   }else{
     return false;
   }
 }
 void shiftRight(){
   setBlockColor(119,113,56);
   a.setXcoor(a.getXcoor() + 25);
   b.setXcoor(b.getXcoor() + 25);
   c.setXcoor(c.getXcoor() + 25);
   d.setXcoor(d.getXcoor() + 25);
   rightest += 25;
   leftest += 25;
   setBlockColor(0,0,0);
 }
   
 boolean checkLeft(){
   if(leftest >= 0*25){
     return true;
   }else{
     return false;
   }
 }
 void shiftLeft(){
   setBlockColor(119,113,56);
   a.setXcoor(a.getXcoor() - 25);
   b.setXcoor(b.getXcoor() - 25);
   c.setXcoor(c.getXcoor() - 25);
   d.setXcoor(d.getXcoor() - 25);
   rightest -= 25;
   leftest -= 25;
   setBlockColor(0,0,0);
   }
   
   
}
  
  


