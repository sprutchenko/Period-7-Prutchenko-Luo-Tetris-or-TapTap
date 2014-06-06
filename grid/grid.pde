Cell[][] grid;

// Number of columns and rows in the grid
int cols = 10;
int rows = 20;

void setup() {
  size(400,800);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*40,j*40,40,40);
    }
  }

}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].display(119,113,56);
    }
  }
// grid[5][0].setColor(22,104,0);
  Block b = new Block(5); 
  while (b.checkLowest()){ 
    b.shiftDown();
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
  int lowest;
  //type 1 = square, type 2 = stick, type 3 = "s" block, type 4 = "z" block, type 5 = "L" block, type 6 = flipped "L" block
  void setBlockColor(int x, int y, int z){
       a.setColor(x,y,z);
       b.setColor(x,y,z);
       c.setColor(x,y,z);
       d.setColor(x,y,z);
  }
  
  Block(int x){
    type = x;
      
    if(x==1){
       a = new Cell(160,0,40,40);
       b = new Cell(200,0,40,40);
       c = new Cell(160,40,40,40);
       d = new Cell(200,40,40,40);
       setBlockColor(0,0,0);
       lowest = 40;
   }else if (x==2){
      a = new Cell(160,0,40,40);
      b = new Cell(160,40,40,40);
      c = new Cell(160,80,40,40);
      d = new Cell(160,120,40,40);
      setBlockColor(0,0,0);
      lowest = 120;
   }else if (x==3){
      a = new Cell(160,0,40,40);
      b = new Cell(200,0,40,40);
      c = new Cell(160,40,40,40);
      d = new Cell(120,40,40,40);
      setBlockColor(0,0,0);
      lowest = 40;
   }else if (x==4){
      a = new Cell(120,0,40,40);
      b = new Cell(160,0,40,40);
      c = new Cell(160,40,40,40);
      d = new Cell(200,40,40,40);
      setBlockColor(0,0,0);
      lowest = 40;
   }else if (x==5){
      a = new Cell(120,40,40,40);
      b = new Cell(160,40,40,40);
      c = new Cell(200,40,40,40);
      d = new Cell(200,0,40,40);
      setBlockColor(0,0,0);
      lowest = 40;
   }else if (x==6){
      a = new Cell(120,0,40,40);
      b = new Cell(120,40,40,40);
      c = new Cell(160,40,40,40);
      d = new Cell(200,40,40,40);
      setBlockColor(0,0,0);
      lowest = 40;
  }
 }
 //checkLowest() checks whether the block has reached the bottom or not 
 boolean checkLowest(){
    if (lowest <= 720){
     return true;
    }else{
     return false;
    }
 } 
 //shifts down block by one unit, gets rid of previous color and adds new color at new location
 void shiftDown(){
   setBlockColor(119,113,56);
   a.setYcoor(a.getYcoor() + 40);
   b.setYcoor(b.getYcoor() + 40);
   c.setYcoor(c.getYcoor() + 40);
   d.setYcoor(d.getYcoor() + 40);
   lowest += 40;
   setBlockColor(0,0,0);
 }
 
 
}
  
  


