class Bullet extends GameObject {
  
  Bullet (float vx, float vy) {
    super (player1.x, player1.y, vx, vy, -5, red, 1);
  }
  
  void act () {
    super.act ();
    stroke (red);
    if (offScreen ()) lives = 0;
  }
}
