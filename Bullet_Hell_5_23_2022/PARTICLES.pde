class Particle extends GameObject{
  int time;
  
  //Constructor
  Particle (float x, float y, color c) {
    super (x, y, random (-5, 5), random (-5, 5), random (1, 5), c, 1);
    time = 20;
  }
  //behaviour
  void act () {
    super.act ();
    if (y > height) lives = 0;
    time --;
    if (time < 0) lives = 0;
    
    stroke (c);
  }
}
