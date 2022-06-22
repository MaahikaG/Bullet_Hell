class Starfighter extends GameObject{
  
  int cooldown, threshold;
  
  //Constructor
  Starfighter () {
    super (width / 2, height / 2, 0, 0, 30, red, 15);
    threshold = 15;
    cooldown = threshold;
    score = 0;
  }
  
  //Behaviour
  void act () {
    super.act ();
    stroke (red);
    super.show();
    
    //managing guns
    cooldown ++;
    if (space && cooldown >= threshold) {
      if (chosengun == basicgun) {
        threshold = 15;
        objects.add (new Bullet (0, -5));
      } else if (chosengun == machinegun) {
        threshold = 5;
        objects.add (new Bullet (0, -5));
      } else if (chosengun == vgun) {
        threshold = 5;
        objects.add (new Bullet (5, -5));
        objects.add (new Bullet (-5, -5));
      }
      //} else if (chosengun == burstgun) {
      //  int i = 0;
      //  while (i < 50) {
      //  objects.add (new Bullet (random (-10, 10), random (-10, 10)));
      //  i ++;
      //  }
      //}
      cooldown = 0;
    }
    
    if (wkey) {
      chosengun ++;
      if (chosengun >= 4) chosengun = 1;
      if (machine_string == "" && chosengun == 2) chosengun = 1;
      if (v_gun_string == "" && chosengun == 3) chosengun = 1;
      wkey = false;
    }
    
    if (w_gun && wipe_out_number > 0) {
      int i = 0;
      while (i < 200) {
        objects.add (new Bullet (random (-10, 10), random (-10, 10)));
        i ++;
      }
      wipe_out_number --;
      wipe_out_string = "Bombs: " + wipe_out_number;
      w_gun = false;
    }
    
    //collisions
    int i = 0;
    while (i < objects.size ()) {
      GameObject obj = objects.get (i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith (obj)) {
          lives --;
          obj.lives = 0;
        }
      }
      i ++;
    }
    
    //getting powerups
    int j = 0;
    while (j < objects.size ()) {
      GameObject obj = objects.get (j);
      if (obj instanceof Powerup) {
        if (collidingWith (obj)) {
          if (machine_string == "") {
            machine_string = "Machine Gun";
          } else if (v_gun_string == ""){
            v_gun_string = "V-Gun";
          } else if (wipe_out_string == "") {
            wipe_out_number ++;
            wipe_out_string = "Bombs: " + wipe_out_number;
          } else {
            wipe_out_number ++;
            wipe_out_string = "Bombs: " + wipe_out_number;
          }
          
          obj.lives = 0;
        }
      }
      j ++;
    }
    
    int k = 0;
    while (k < objects.size ()) {
      GameObject obj = objects.get (k);
      if (obj instanceof Powerup2) {
        if (collidingWith (obj)) {
          obj.lives = 0;
          lives = 15;
        }
      }
      k ++;
    }
    
    int m = 0;
    while (m < objects.size ()) {
      GameObject obj = objects.get (m);
      if (obj instanceof Powerup3) {
        if (collidingWith (obj)) {
          bring_final_boss = true;
          obj.lives = 0;
        }
      }
      m ++;
    }
    
    int l = 0;
    while (l < n) {
      if (collidingWith (walls [l]) && wall_jump == false) {
        y = min (y, 800 - (walls [l].size + size/2));
        y = max (y, (walls [l].size + size/2));
        x = min (x, 800 - (walls [l].size + size/2));
        x = max (x, (walls [l].size + size/2));
        //println ("Colliding with walls");
        if (wall_reveal) {
          walls [l].a = 80;
          println ("opacity = 80");
        }
      } else if (collidingWith (walls [l]) && wall_jump) {
        player1.x = walls [l].x;
        player1.y = walls [l].y;
        print (player1.x,  player1.y);
      } else {
        if (up)  vy = -5;
        if (down)  vy = 5;
        if (right) vx = 5;
        if (left)  vx = -5;
      }
      l ++;
    }
    
    //controlling the starfighter
    
    y = min (y, 800 - size/2);
    y = max (y, size/2);
    
    x = min (x, 800 - size/2);
    x = max (x, size/2);
    
    if (!up && !down)    vy = vy * 0.9;
    if (!left && !right) vx = vx * 0.9;
    
    // going to gameover
    if (lives <= 0) {
      mode = GAMEOVER;
      winner = false;
    }
  }
}
