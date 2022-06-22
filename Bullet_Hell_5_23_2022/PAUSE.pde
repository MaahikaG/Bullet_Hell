void pause () {
  fill (0);
  textSize (60);
  text ("Pause", 400, 400);
}

void pauseClicks () {
  if (mouseX > 270 && mouseX < 325 && mouseY > 30 && mouseY < 80) {
    mode = GAME;
  }
}
