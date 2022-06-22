//Imports 
import ddf.minim.*;

//Color palette
color grey1 = #c6c5b9;
color grey2 = #c0b9ba;
color aqua = #63b4cf;
color purple = #5f00ba;
color black = #080708;
color indigo = #204750;
color teal = #388697;
color grey3 = #7a7e77;
color blue = #2589bd;
color red = #ed254e;
color burgundy = #A01010;
color green = #57A044;

//Constants
final int INTRO = 1;
final int GAME = 2;
final int OPTIONS = 3;
final int PAUSE = 4;
final int GAMEOVER = 5;
final int INSTRUCTIONS = 6;

int mode;

PFont font;

//keys
boolean up, down, left, right, space, wkey, wall_reveal, w_gun, wall_jump;

//starfighter details
int score = 0;
int chosengun;
final int basicgun = 1;
final int machinegun = 2;
final int vgun = 3;
//final int burstgun = 4;
String machine_string;
String v_gun_string;
String wipe_out_string;
int wipe_out_number;


//final boss
boolean bring_final_boss;
int end_powerup_count;
boolean final_boss_arrived;

//winning and losing variables
boolean winner;

//array list variables
ArrayList <GameObject> objects;
Starfighter player1;
Walls[] walls;
int n;
float tempy_l;
float tempy_r;
boolean templeft;

void setup () {
  //wall array setup 
  n = 19;
  walls = new Walls [n];
  int i = 0;
  tempy_l = 10;
  tempy_r = 10;
  templeft = true;
  while (i < n) {
    walls [i] = new Walls ();
    if (templeft) tempy_l = walls [i].y + walls [i].size/2 + 10;
    if (templeft == false) tempy_r = walls [i].y + walls [i].size/2 + 10;
    templeft = !templeft;
    i ++;
  }
  
  size (800, 800);
  mode = INTRO;
  rectMode (CENTER);
  textAlign (CENTER);
  font = createFont ("Science Fair.otf", 40);
  strokeWeight (1);
  
  objects = new ArrayList <GameObject> ();
  player1 = new Starfighter ();
  
  
  //initialize guns
  chosengun = basicgun;
  machine_string = "";
  v_gun_string = "";
  wipe_out_string = "";
  wipe_out_number = 0;
  //w_gun = false;
  //wall_reveal = false;
  //wipe_out_timer = 1000;
  
  //initialize final boss 
  end_powerup_count = int (random (1, 10));
}

void draw () {
  if      (mode == INTRO)    intro ();
  else if (mode == GAME)     game ();
  else if (mode == GAMEOVER) gameover ();
  else if (mode == PAUSE)    pause ();
  else if (mode == INSTRUCTIONS)    instructions ();
 
}

void tactileRect (int x, int y, int w, int l) {
  strokeWeight (5);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
    stroke (255);
    fill (255);
  } else {
    stroke (0);
    fill (0);
  }
}
