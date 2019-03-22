int margin = 150;
int aantalKaarten = 9;
int player1Punt;
int player2Punt;
int turn = 2;
Kaart[] kaartenOpVeld = new Kaart[aantalKaarten];
StringList mogKaa;
boolean restart;
String[] figuren = {"r", "d", "e"};
String[] kleur = {"r", "g", "b"};
String[] aantallen = {"1", "2", "3"};
void setup() {
  size(900, 950);
  startGame();
}
void draw() {
}

void startGame() {
  restart = false;
  int breedte = (width - ( margin * 2 )) / 3;
  int hoogte = (height - ( margin * 2 )) / 3;
  background(0);
  fill(0, 255, 0);
  mogKaa = new StringList();
  for (int fi = 0; fi < figuren.length; fi++) {
    for (int ki = 0; ki < kleur.length; ki++) {
      for (int ai = 0; ai < aantallen.length; ai++) {
        mogKaa.append(aantallen[ai]+figuren[fi]+kleur[ki]);
      }
    }
  }
  for (int i = 0; i < aantalKaarten; i++) {
    kaartenOpVeld[i] = new Kaart(mogKaa, i, i, breedte, hoogte);
  }
  tekenKaarten();
  tekenSymbolen();
  checkAmountOfSets();
  fill(0, 255, 0);
  setText(player1Punt, player2Punt);
}

void tekenKaarten() {
  for (int i = 0; i < aantalKaarten; i++) {
    kaartenOpVeld[i].tekenKaart(margin);
  }
}

void tekenSymbolen() {
  for (int i = 0; i < aantalKaarten; i++) {
    kaartenOpVeld[i].tekenSymbole(margin);
  }
}

int checkAmountOfSets() {
  int amountOfPoss = 0;
  for (int kaartOpVeld = 0; kaartOpVeld < aantalKaarten; kaartOpVeld++) {
    for (int tweedeKaart = kaartOpVeld+1; tweedeKaart < aantalKaarten; tweedeKaart++) {
      for (int derdeKaart = tweedeKaart+1; derdeKaart < aantalKaarten; derdeKaart++) {
        boolean test = checkHetzelfdeOfAnders(kaartenOpVeld[kaartOpVeld], kaartenOpVeld[tweedeKaart], kaartenOpVeld[derdeKaart] );
        if (test == true) {
          amountOfPoss++;
        }
      }
    }
  }
  return amountOfPoss;
}

boolean checkHetzelfdeOfAnders(Kaart Kaart1, Kaart Kaart2, Kaart Kaart3) {
  String kleur = Kaart1.kleur;
  String figuur = Kaart1.figuur;
  int aantal = Kaart1.aantal;
  boolean kleurCheck = false;
  boolean figuurCheck = false;
  boolean aantalCheck = false;
  if (kleur.equals(Kaart2.kleur) && kleur.equals(Kaart3.kleur) && Kaart2.kleur.equals(Kaart3.kleur) || !kleur.equals(Kaart2.kleur) && !kleur.equals(Kaart3.kleur) && !Kaart2.kleur.equals(Kaart3.kleur) ) {
    kleurCheck = true;
  }
  if (figuur.equals(Kaart2.figuur) && figuur.equals(Kaart3.figuur) && Kaart2.figuur.equals(Kaart3.figuur) || !figuur.equals(Kaart2.figuur) && !figuur.equals(Kaart3.figuur) && !Kaart2.figuur.equals(Kaart3.figuur) ) {
    figuurCheck = true;
  }
  if (aantal == Kaart2.aantal && aantal == Kaart3.aantal && Kaart2.aantal == Kaart3.aantal || aantal != Kaart2.aantal && aantal != Kaart3.aantal  && Kaart2.aantal != Kaart3.aantal ) {
    aantalCheck = true;
  }
  if (kleurCheck == true && figuurCheck == true && aantalCheck == true ) {
    return true;
  } else {
    return false;
  }
}

void setText(int player1Punt, int player2Punt) {
  int amountLeft = mogKaa.size();
  int poss = checkAmountOfSets();

  if (turn % 2 == 0) {
    push();
    fill(255);
    ellipse(30,15,5,5);
    pop();
  } else {
    push();
    fill(255);
    ellipse(30,30,5,5);
    pop();
  }
  text("Player 1 have got: " + player1Punt + " Points", 50, 20);
  text("Player 2 have got: " + player2Punt + " Points", 50, 35);
  fill(0, 255, 0);
  text("There are " + poss + " possibilities", 50, 50);
  text("There are " + amountLeft + " cards left", 50, 65);
  text("Press 'R' to get some new cards at the top", width-250, 20);
    turn++;
}

void checkSet(int breedte, int hoogte) {

  Kaart[] selected = new Kaart[3];
  int arrayIndex = 0;
  for (int i = 0; i < aantalKaarten; i++) {
    if (kaartenOpVeld[i].selected) {
      selected[arrayIndex] = kaartenOpVeld[i];
      arrayIndex++;
    }
  }
  boolean isSet = checkHetzelfdeOfAnders(selected[0], selected[1], selected[2]);
  if (isSet) {
    if (turn % 2 == 0) {
      player2Punt++ ;
    } else {
      player1Punt++ ;
    }
    background(0);
    fill(0, 255, 0);
    if (mogKaa.size() <= 2) {
      startGame();
    }
    for (int i = 0; i < aantalKaarten; i++) {
      if (kaartenOpVeld[i].selected) {
        kaartenOpVeld[i] = new Kaart(mogKaa, i, i, breedte, hoogte);
      }
    }
    setText(player1Punt, player2Punt);
  } else {
    for (int i = 0; i < aantalKaarten; i++) {
      if (kaartenOpVeld[i].selected) {
        kaartenOpVeld[i].toggleSelected();
      }
    }
    if (turn % 2 == 0) {
      player2Punt-- ;
    } else {
      player1Punt-- ;
    }
    background(0);
    fill(255, 0, 0);
    setText(player1Punt, player2Punt);
  }
}
int checkSelected() {
  int isChecked = 0;
  for (int i = 0; i < aantalKaarten; i++) {
    if (kaartenOpVeld[i].selected) {
      isChecked++;
    }
  }
  return isChecked;
}
