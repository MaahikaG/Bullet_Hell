class Enemy extends GameObject {

  int cooldown, threshold;

  Enemy () {
    super (random (100, 700), -20, 0, 5, 30, purple, 1);
    threshold = 10;
    cooldown = threshold;
  }

  void act () {
    super.act ();
    stroke (purple);
    super.show ();
    

    //collisions
    int i = 0;
    while (i < objects.size ()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Bullet) {
        if (collidingWith (obj)) {
          lives --;
          obj.lives = 0;
          score ++;
          int j = 0;
          while (j < 50) {
            objects.add (new Particle (x, y, purple));
            j ++;
          }
        }
      }
      i ++;
    }

    //managing guns
    cooldown ++;
    if (cooldown >= threshold && lives > 0) {
      objects.add (new EnemyBullet (x, y, 0, 10, purple));
      cooldown = 0;
    }

    //remove if goes off screen
    if (offScreen ()) lives = 0;
  }
}









class Enemy2 extends GameObject {

  int cooldown, threshold;
  boolean powerup;
  boolean powerup_health;
  int health_rate;
  int power_rate;

  Enemy2 () {
    super (random (100, 700), -20, 0, 5, 40, teal, 1);
    threshold = 10;
    cooldown = threshold;
    
    power_rate = int (random (1, 15));
    health_rate = int (random (1, 3));
    if (power_rate <= 2) {
      powerup = true;
      if (health_rate == 1) {
        powerup_health = true;
      }
    } else {
      powerup = false;
    }
  }

  void act () {
    super.act ();
    stroke (teal);
    super.show ();

    //collisions
    int i = 0;
    while (i < objects.size ()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Bullet) {
        if (collidingWith (obj)) {
          lives --;
          obj.lives = 0;
          score ++;
          if (powerup) {
            if (powerup_health) objects.add (new  Powerup2 (x, y));
            else objects.add (new  Powerup (x, y));
            powerup = false;
          }
          int j = 0;
          while (j < 50) {
            objects.add (new Particle (x, y, teal));
            j ++;
          }
        }
      }
      i ++;
    }

    //managing guns
    cooldown ++;
    if (cooldown >= threshold && lives > 0) {
      objects.add (new EnemyBullet (x, y, 0, 10, teal));
      objects.add (new EnemyBullet (x - 10, y - 3, 0, 10, teal));
      objects.add (new EnemyBullet (x + 10, y + 3, 0, 10, teal));
      cooldown = 0;
    }

    //remove if goes off screen
    if (offScreen ()) lives = 0;
  }
}







class Enemy3 extends GameObject {

  int cooldown, threshold;
  
  boolean powerup;
  int power_rate;
  boolean powerup_health;
  int health_rate;
  

  Enemy3 () {
    super (random (100, 700), -20, 0, 5, 50, indigo, 1);
    threshold = 10;
    cooldown = threshold;
    
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
   
  }

  void act () {
    super.act ();
    stroke (indigo);
    super.show ();

    //collisions
    int i = 0;
    while (i < objects.size ()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Bullet) {
        if (collidingWith (obj)) {
          lives --;
          obj.lives = 0;
          score ++;
          if (powerup) {
            if (powerup_health) objects.add (new  Powerup2 (x, y));
            else objects.add (new  Powerup (x, y));
            powerup = false;
          }
          int j = 0;
          while (j < 50) {
            objects.add (new Particle (x, y, indigo));
            j ++;
          }
        }
      }
      i ++;
    }

    //managing guns
    cooldown ++;
    if (cooldown >= threshold && lives > 0) {
      objects.add (new EnemyBullet (x, y, 0, 10, indigo));
      objects.add (new EnemyBullet (x, y, 0, -20, indigo));
      objects.add (new EnemyBullet (x, y, 10, 0, indigo));
      objects.add (new EnemyBullet (x, y, -10, 0, indigo));
      objects.add (new EnemyBullet (x, y, -10, 10, indigo));
      objects.add (new EnemyBullet (x, y, 10, 10, indigo));
      cooldown = 0;
    }

    //remove if goes off screen
    if (offScreen ()) lives = 0;
  }
}









class Enemy4 extends GameObject {

  int cooldown, threshold;
  

  Enemy4 () {
    super (400, -20, 0, 5, 60, green, 50);
    threshold = 15;
    cooldown = threshold;
    
   
  }

  void act () {
    super.act ();

    //collisions
    int i = 0;
    while (i < objects.size ()) {
      GameObject obj = objects.get (i);
      if (obj instanceof Bullet) {
        if (collidingWith (obj)) {
          lives --;
          obj.lives = 0;
          score ++;
          int j = 0;
          while (j < 50) {
            objects.add (new Particle (x, y, green));
            j ++;
          }
        }
      }
      i ++;
    }
    
    if (lives == 0) {
      mode = GAMEOVER;
      winner = true;
    }

    //managing guns
    cooldown ++;
    if (cooldown >= threshold && lives > 0) {
      objects.add (new EnemyBullet (x - 40, y, 0, 10, green));
      objects.add (new EnemyBullet (x - 20, y, 0, 10, green));
      objects.add (new EnemyBullet (x, y, 0, 10, green));
      objects.add (new EnemyBullet (x + 20, y, 0, 10, green));
      objects.add (new EnemyBullet (x + 40, y, 0, 10, green));
      
      objects.add (new EnemyBullet (x - 40, y, 0, -10, green));
      objects.add (new EnemyBullet (x - 20, y, 0, -10, green));
      objects.add (new EnemyBullet (x, y, 0, -10, green));
      objects.add (new EnemyBullet (x + 20, y, 0, -10, green));
      objects.add (new EnemyBullet (x + 40, y, 0, -10, green));
      
      objects.add (new EnemyBullet (x, y - 40, 10, 5, green));
      objects.add (new EnemyBullet (x, y - 20, 10, 5, green));
      objects.add (new EnemyBullet (x, y, 10, 5, green));
      objects.add (new EnemyBullet (x, y + 20, 10, 5, green));
      objects.add (new EnemyBullet (x, y + 40, 10, 5, green));
      
      objects.add (new EnemyBullet (x, y - 40, -10, 5, green));
      objects.add (new EnemyBullet (x, y - 20, -10, 5, green));
      objects.add (new EnemyBullet (x, y, -10, 5, green));
      objects.add (new EnemyBullet (x, y + 20, -10, 5, green));
      objects.add (new EnemyBullet (x, y + 40, -10, 5, green));
      cooldown = 0;
    }

    //bounce if goes off screen
    if (offScreen ()) vy = vy * -1;
  }
  
  void show () {
    stroke (green);
    super.show ();
    textSize (15);
    fill (0);
    text ("Lives: " + lives, x, y);
  }
}
