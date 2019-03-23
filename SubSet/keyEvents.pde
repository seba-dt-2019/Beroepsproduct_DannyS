// de reden waarom ik de r niet op non actief zet als er geen kaarten tijn is dat je dan alsnog de ander speler wanneer hij er wel 1 vindt de set kan spelen.
void keyPressed() {
  int breedte = (width - ( margin * 2 )) / 3;
  int hoogte = (height - ( margin * 2 )) / 3;
  if (key == 's' && restart == true) {
    player1Punt = 0;
    player2Punt = 0;
    startGame();
  }
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

    background(0);
    fill(255, 0, 0);
    setText(player1Punt, player2Punt);
    tekenKaarten();
    tekenSymbolen();
  }
}