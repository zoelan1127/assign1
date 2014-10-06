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
// put your code inside here
int totalScore = 500;
int slotA ;
int slotB;
int slotC;
int pt0,pt1,pt2;
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
      totalScore -= 50;
      // -------------------------------------------------
      // put your code inside here
      slotA = int (random(6));
      slotB = int (random(6));
      slotC = int (random(6));
      
      
      machine.setSlotFruit(0,slotA);
      machine.setSlotFruit(1,slotB);
      machine.setSlotFruit(2,slotC);
      
     
      
       
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
      // put your code inside here
       int temp = machine.getSlotScore(0)+machine.getFruitCount(0)
                  +machine.getSlotScore(1)+machine.getFruitCount(1)
                  +machine.getSlotScore(2)+machine.getFruitCount(2)
                  +machine.getSlotScore(3)+machine.getFruitCount(3)
                  +machine.getSlotScore(4)+machine.getFruitCount(4)
                  +machine.getSlotScore(5)+machine.getFruitCount(5)
                  +machine.getSlotScore(6)+machine.getFruitCount(6) ;
      
      totalScore= totalScore +temp;
      println("1:" + pt0 + "2:" + pt1 + "3:" +pt2);
 
 
 
      
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
