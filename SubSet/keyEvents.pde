void keyPressed() {
  int breedte = (width - ( margin * 2 )) / 3;
  int hoogte = (height - ( margin * 2 )) / 3;
  if (key == 's' && restart == true) {
    player1Punt = 0;
    player2Punt = 0;
    startGame();
  }
  println(turn);
  if (key == 'r') {  
    if (mogKaa.size() == 3) {
      fill(255, 0, 0);
      text("Sorry that isn't possible to few cards. Press 'S' to restart the game", 50, height-20);
      text("* Know the point will be zero again", 40, height-10);
      restart = true;
    } else {
      for (int i = 0; i < 3; i++) {
        kaartenOpVeld[i] = new Kaart(mogKaa, i, i, breedte, hoogte);
      }
    }
    tekenKaarten();
    tekenSymbolen();
  }
}
