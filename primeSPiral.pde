int w = 1920;
int h = 1920;

int x = w/2;
int y = h/2;
int num =  1;

class Direction{
  public int x, y;
  Direction(int x,int y){
    this.x = x;
    this.y = y;
  }
  String identifier(){
    return String.valueOf(this.x)+String.valueOf(this.y);
  }
}

int amtNum = 300;
int stepSize = w/amtNum;
int stepAmt = 1;
int stepTwice = 1;
int step = 0;
Direction direction = new Direction(1,0);


void setup() {
  size(1920,1920);
  background(0);
  noStroke();
  noLoop();
}

void draw(){
  doThePrime();
  saveFrame("primeSpiral.png");
}

void doThePrime() {
  while(x < w) {
    if(isPrime(num))
      square(x-stepSize/2,y-stepSize/2, stepSize);
  
    if(step >= stepAmt){
      nextDirection();
      if(stepTwice == 2){
        stepAmt++;
        stepTwice = 0;
      }
      stepTwice++;
      step=0;
    }
    
    x+=stepSize*direction.x;
    y+=stepSize*direction.y;
    step++;
    num++;  
  }
}

boolean isPrime(int num) {
  if(num==1)
    return false;
  for(int i=2; i<=sqrt(num);i++){
    if(num%i == 0)
      return false;
  }
  return true;
}

void nextDirection(){
  switch(direction.identifier()) {
    case "10":
      direction = new Direction(0,-1);
      break;
    case "0-1":
      direction = new Direction(-1,0);
      break;
    case "-10":
      direction = new Direction(0,1);
      break;
    case "01":
      direction = new Direction(1,0);
      break;
  }
}
