class EnemyBullet extends GameObject {

  EnemyBullet (float x, float y, float vx, float vy, color c) {
    super (x, y, vx, vy, 5, c, 1);
  }
  void act () {
    super.act ();
    stroke (c);
    if (offScreen ()) lives = 0;
  }
}
