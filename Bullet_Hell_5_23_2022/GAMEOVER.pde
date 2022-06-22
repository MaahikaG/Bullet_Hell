void gameover () {
  background (grey3);
  textSize (60);
  fill (black);
  if (winner) {
    text ("You Have defeated E-Wall", 400, 200);
  } else {
    text ("You have failed your mission", 400, 200);
  }
  textSize (40);
  text ("You killed " + score + " robots", 400, 250);
  
  //restart and exit buttons 
  rectMode (CORNER);
  tactileRect (150, 350, 200, 100);
  fill (grey3);
  rect (150, 350, 200, 100);
  tactileRect (450, 350, 200, 100);
  fill (grey3);
  rect (450, 350, 200, 100);
  textSize (30);
  tactileRect (150, 350, 200, 100);
  text ("Restart", 250, 400);
  tactileRect (450, 350, 200, 100);
  text ("Exit", 550, 400);
  rectMode (CENTER);
}
void gameoverClicks () {
  if (mouseX > 150 && mouseX < 350 && mouseY > 350 && mouseY < 450) {
    mode = INTRO;
    objects.clear ();
    player1.lives = 10;
    score = 0;
    bring_final_boss = false;
    final_boss_arrived = false;
    int i = 0;
    while (i < n) {
      walls [i].a = 255;
      walls [i].power_rate = int (random (1, 10));
      walls [i].health_rate = int (random (1, 3));
      if (walls [i].power_rate <= 2) {
        walls [i].powerup = true;
        if (walls [i].health_rate == 1) {
          walls [i].powerup_health = true;
        }
      } else {
        walls [i].powerup = false;
      }
      walls [i].end_powerup = true;
      walls [i].powerup_at_all = walls [i].powerup;
      i ++;
    }
    player1.x = 400;
    player1.y = 400;
    machine_string = "";
    v_gun_string = "";
    wipe_out_string = "";
    wipe_out_number = 0;
    chosengun = basicgun;
  }

  if (mouseX > 450 && mouseX < 650 && mouseY > 350 && mouseY < 450) {
    exit ();
  }
}
