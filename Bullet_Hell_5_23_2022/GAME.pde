void game () {
  background (grey1);
  addObjects ();
  gameEngine ();
  debug ();
 
  //score and lives
  fill (black);
  textSize (30);
  text ("Kill Count = " + score, 440, 50);
  text ("Lives = " + player1.lives, 440, 100);

  //walls
  int i = 0;
  while (i < n) {
    walls [i].show ();
    walls [i].act ();
    i ++;
  }
  
  //gun collection
  fill (255);
  stroke (255);
  rect (700, 750, 200, 200);
  
  textSize (15);
  fill (black);
  text ("Weapons in your collection:", 700, 700);
  text ("Basic Gun", 700, 720);
  text (machine_string, 700, 740);
  text (v_gun_string, 700, 760);
  text (wipe_out_string, 700, 780);
  
  
  //Pause Button
  rectMode (CORNER);
  tactileRect (270, 30, 60, 50);
  fill (grey1);
  rect (270, 30, 60, 50);
  if (mode == GAME) {
    line (292, 40, 292, 70);
    line (308, 40, 308, 70);
  }
  rectMode (CENTER);
  
  
  // key commands
  //fill (255);
  //stroke (255);
  //rect (100, 750, 200, 200);
  
  //textSize (12);
  //fill (black);
  //text ("Key Commands", 100, 650);
  //text ("Use your arrow keys to navigat your player", 100, 670);
  //text ("Press space to shoot", 100, 690);
  //text ("Press W to swicth through guns in your collection", 100, 710);
  //text ("Press A to activate Wipe Out", 100, 730);
  //text ("Press S to search rooms", 100, 750);
  //text ("Press D to enter rooms", 100, 770);
  
}

void addObjects () {
   //objects.add (0, new Star ());
   if (bring_final_boss == false && final_boss_arrived == false) {
     if (frameCount % 50 == 0) objects.add (new Enemy ());
     if (frameCount % 120 == 0) objects.add (new Enemy2 ());
     if (frameCount % 500 == 0) objects.add (new Enemy3 ());
     //if (frameCount % 200 == 0) objects.add (new Enemy4 ());
   } else if (final_boss_arrived == false) {
     objects.add (new Enemy4 ());
     final_boss_arrived = true;
   } 
}

void gameEngine () {
  int i = 0;
  while (i < objects.size ()) {
    GameObject s = objects.get (i);
    s.act ();
    s.show ();
    if (s.lives <= 0 || mode == GAMEOVER) {
      objects.remove (i);
    } else {
      i ++;
    }
  }

  player1.act ();
  player1.show ();
}

void debug () {
  //debug
  fill (255);
  //text (frameRate, 20, 20);
  //text (objects.size (), 20, 40);
}

void gameClicks () {
  //Pause 
  if (mouseX > 270 && mouseX < 345 && mouseY > 30 && mouseY < 80) {
    mode = PAUSE;
    rectMode (CORNER);
    rect (270, 30, 60, 50);
    triangle (285, 40, 285, 70, 320, 55);
    rectMode (CENTER);
  }
}
