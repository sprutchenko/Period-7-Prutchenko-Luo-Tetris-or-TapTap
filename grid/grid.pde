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
      grid[i][j].display(127,0,0);
    }
  }
  grid[5][0].display();
 
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

  void createBlock(int x){
    if(x == 1){
      grid[5][0].display(170);
    }
  }
  
}
    



