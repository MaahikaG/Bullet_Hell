void keyPressed () {
  if (keyCode == UP ) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT ) left = true;
  if (keyCode == RIGHT) right = true;
  if (keyCode == ' ') space = true;
  if (keyCode == 'W' || keyCode == 'w') wkey = true;
  if (keyCode == 'A' || keyCode == 'a') w_gun = true;
  if (keyCode == 'S' || keyCode == 's') wall_reveal = true;
  if (keyCode == 'D' || keyCode == 'd') wall_jump = true;
}
void keyReleased () {
  if (keyCode == UP ) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT ) left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == ' ') space = false;
  if (keyCode == 'W' || keyCode == 'w') wkey = false;
  if (keyCode == 'A' || keyCode == 'a') w_gun = false;
  if (keyCode == 'S' || keyCode == 's') wall_reveal = false;
  if (keyCode == 'D' || keyCode == 'd') wall_jump = false;
}
