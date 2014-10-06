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

int randomNum_0;
int randomNum_1;
int randomNum_2;

int slotPositionScore_0;
int slotPositionScore_1;
int slotPositionScore_2;

int weight_0;
int weight_1;
int weight_2;

int except7_0;
int except7_1;
int except7_2;


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
      // put your code inside here
      
      //launch the game
      totalScore = totalScore - 50 ; 
      
      
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
      
      //appoint fruit randomly and the chance appear 7 < 10%
      
      except7_0 = machine.probability(0.9);
      except7_1 = machine.probability(0.9);
      except7_2 = machine.probability(0.9);
      
      randomNum_0 = int (random(1,5)) * except7_0;
      randomNum_1 = int (random(1,5)) * except7_1;
      randomNum_2 = int (random(1,5)) * except7_2;
      
      machine.setSlotFruit(0,randomNum_0);
      machine.setSlotFruit(1,randomNum_1);
      machine.setSlotFruit(2,randomNum_2);
      
      //calculate total score
      slotPositionScore_0 = machine.getSlotScore(randomNum_0);
      slotPositionScore_1 = machine.getSlotScore(randomNum_1);
      slotPositionScore_2 = machine.getSlotScore(randomNum_2);
      
      weight_0 = machine.getFruitCount(randomNum_0);
      weight_1 = machine.getFruitCount(randomNum_1);
      weight_2 = machine.getFruitCount(randomNum_2);
      
      totalScore +=   slotPositionScore_0 * weight_0  
                    + slotPositionScore_1 * weight_1
                    + slotPositionScore_2 * weight_2;
      
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







