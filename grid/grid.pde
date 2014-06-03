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
  grid[5][0].display(225,104,0);
 
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
 

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
 
  } 
  
  void setColor(int a,int b, int c) {
     fill(a,b,c);
  }

  void display(int p,int q, int r) {
    stroke(255);
    fill(p,q,r);
    rect(x,y,w,h); 
  }
  
  float getXcoor(){
    return x;
  }
  
  float getYcoor(){
    return y;
  }
}
   /*
class Block{
  Cell a,b,c,d;
  int type;
  //type 1 = square, type 2 = stick, type 3 = "s" block, type 4 = "z" block, type 5 = "L" block, type 6 = flipped "L" block
  void spin(int x){
    if (x==2){
     
      
  }
  
  void move(){
  }

*/
