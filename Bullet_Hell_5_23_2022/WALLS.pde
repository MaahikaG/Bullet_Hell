class Walls extends GameObject {
  
  boolean powerup;
  int power_rate;
  boolean powerup_health;
  int health_rate;
  boolean powerup_at_all;
  
  boolean end_powerup;
  //int current_epower_place;
  
  int a;
  
  Walls () {
    super (0, 0, 0, 0, random (50, 100), grey1, 1);
    
    if (templeft) {
      y = tempy_l + size / 2;
      x = size / 2;
    } else {
      y = tempy_r + size / 2;
      x = 800 - size / 2;
    }
    
    
    power_rate = int (random (1, 10));
    health_rate = int (random (1, 3));
    if (power_rate <= 2) {
      powerup = true;
      if (health_rate == 1) {
        powerup_health = true;
      }
    } else {
      powerup = false;
    }
     
    //if (x == Powerup3 ().x && y == Powerup3 ().y) {
    //  powerup = true;
    //  end_powerup = true;
    //  powerup_health = false;
    //}
    //current_epower_place = end_powerup_count - 1;
    //print (current_epower_place);
    
    end_powerup = true;
    
    a = 255;
    powerup_at_all = powerup;
  }
  
  void act (){
    super.act ();
    
    //powerups
    
    if (powerup) {
      if (powerup_health) objects.add (new  Powerup2 (x, y));
      else objects.add (new  Powerup (x, y));
      powerup = false;
    }
    
    if (end_powerup) {
      objects.add (new  Powerup3());
      end_powerup = false;
    }
   
    //collisions with bullets
    int i = 0;
    while (i < objects.size ()) {
      GameObject obj = objects.get (i);
      if (obj instanceof EnemyBullet || obj instanceof Bullet) {
        if (collidingWith (obj)) {
          obj.lives = 0;
        }
      }
      i ++;
    }
  }
  
  void show () {
    
    if (powerup_at_all == false) {
      textSize (15);
      fill (0);
      text ("Empty", x, y);
    }
    
    
    fill (c, a);
    strokeWeight (5);
    stroke (grey3);
    square (x, y, size);
    strokeWeight (1);
  }
}
