SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
int totalScore = 500;

// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
         totalScore = totalScore-50;
        
         
        
      
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
     
        int A = int (random(6)); // position0
        int B = int (random(6)); // position1  
        int C = int (random(6)); // position2
                      
         machine.setSlotFruit(0,A);
         machine.setSlotFruit(1,B);
         machine.setSlotFruit(2,C);
    
        
        int M = machine.getFruitCount(0); 
        int N = machine.getFruitCount(1); 
        int O = machine.getFruitCount(2);
        int P = machine.getFruitCount(3); 
        int Q = machine.getFruitCount(4); 
        int R = machine.getFruitCount(5);
        
         totalScore= totalScore+(M*M*60+N*N*10+O*O*20+P*P*30+Q*Q*40+R*R*50);
        
        int result = machine.probability(0.1);
            
    
         println(result);
 
      
      // -------------------------------------------------
   }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}




