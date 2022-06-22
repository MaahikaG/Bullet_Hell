void intro () {
  background (grey2);
  textSize (50);
  fill (black);
  textFont (font, 70);
  text ("Laboratory Shootout", 400, 200);
  
  //Start and Instructions buttons
  rectMode (CORNER);
  tactileRect (150, 350, 200, 90);
  fill (grey2); 
  rect (150, 350, 200, 90);
  tactileRect (450, 350, 200, 90);
  fill (grey2); 
  rect (450, 350, 200, 90);
  textSize (30);
  tactileRect (150, 350, 200, 90);
  text ("Start", 250, 400);
  tactileRect (450, 350, 200, 90);
  text ("Instructions", 550, 400);
  rectMode (CENTER);
}
void introClicks () {
    if (mouseX > 150 && mouseX < 350 && mouseY > 350 && mouseY < 450) {
    mode = GAME;
  }
  if (mouseX > 450 && mouseX < 650 && mouseY > 350 && mouseY < 450) {
    mode = INSTRUCTIONS;
  }
}
