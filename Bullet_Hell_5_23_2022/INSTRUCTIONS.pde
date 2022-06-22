void instructions () {
  background (grey2);
  
  //title
  textSize (60);
  fill (black);
  text ("Instructions", 400, 80);
  
  //Story and instructions
  textSize (20);
  fill (black);
  text ("You are a spy at a Laboratory that is developing extremely dangerous robots....", 400, 130);
  text ("For months, you were collecting information on their illegal activities..." + "\n" + "and you finally have enough evidence to prove that they are guilty...", 400, 160);
  text ("However, as you make your escape, you hear the alarm bells sound...", 400, 220);
  textSize (30);
  fill (red);
  text ("And a swarm of robots charge towards you", 400, 260);
  textSize (20);
  fill (black);
  text ("All looks hopeless until you remember one crucial bit of information..." + "\n" + "that you learned at your time working at the laboratory...", 400, 290);
  text ("All of the robots only have one mind... one control system..." + "\n" + "And if you destroy that system, you will be able to stop all the robots...", 400, 360);
  text ("However, your mission will not be easy...", 400, 420);
  textSize (30);
  fill (red);
  text ("Since the system is located in the" + "\n" + "most dangerous robot of them all, E-Wall", 400, 475);
  
  stroke (black);
  line (0, 550, 800, 550);
  line (400, 550, 400, 800);
  
  textSize (25);
  fill (indigo);
  text ("Goals", 200, 590);
  textSize (20);
  fill (black);
  text ("Kill E-Wall", 200, 630);
  text ("Call E-Wall by activating the" + "\n" + "green powerup hidden in one of the rooms", 200, 660);
  text ("Use blue powerups to improve your gun and" + "\n" + "red powerups to improve your health", 200, 720);
  text ("Powerups are in the walls and in robots ", 200, 780);
  
  fill (indigo);
  textSize (25);
  text ("Key Commands", 600, 590);
  textSize (20);
  fill (black);
  text ("Use Arrow Keys to Navigate your player", 600, 630);
  text ("Use Space Key to Shoot", 600, 660);
  text ("Use W Key to Cycle through guns", 600, 690);
  text ("Use A Key to throw a bomb", 600, 720);
  text ("Use S Key to Search Rooms", 600, 750);
  text ("Use D Key to Enter Rooms", 600, 780);
  
  //back button
  rectMode (CORNER);
  tactileRect (30, 30, 75, 50);
  fill (grey2);
  rect (30, 30, 75, 50);
  tactileRect (30, 30, 75, 50);
  line (60, 40, 40, 55);
  line (40, 55, 60, 70);
  line (45, 55, 90, 55);
  rectMode (CENTER);
}

void instructionsClicks () {
  //Back to Intro
  if (mouseX > 30 && mouseX < 95 && mouseY > 30 && mouseY < 80){
    mode = INTRO;
  }
}
