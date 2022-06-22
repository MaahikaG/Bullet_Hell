class Powerup extends GameObject {
  
  Powerup (float x, float y) {
    super (x, y, 0, 0, 15, blue, 1);
  }
  
  void act () {
    super.act ();
    stroke (blue);
    if (offScreen ()) lives = 0;
  }
}



class Powerup2 extends GameObject {
  
  Powerup2 (float x, float y) {
    super (x, y, 0, 0, 15, burgundy, 1);
  }
  
  void act () {
    super.act ();
    stroke (burgundy);
    if (offScreen ()) lives = 0;
  }
}

class Powerup3 extends GameObject {
  
  Powerup3 () {
    super (0, 0, 0, 0, 15, green, 1);
    
    x = walls [end_powerup_count].x;
    y = walls [end_powerup_count].y;
    
    walls [end_powerup_count].powerup = false;
    walls [end_powerup_count].powerup_at_all = true;
    
  }
  
  void act () {
    super.act ();
    stroke (green);
    if (offScreen ()) lives = 0;
  }
}
