class Kaart {
  int id;
  int plaatsVeld;
  String kleur;
  String figuur;
  int aantal;
  int breedteKaart;
  int hoogteKaart;
  boolean selected;

  Kaart(StringList mK, int newId, int plaats, int breedte, int hoogte) {
    if (mK.size() == 1) {
    }
    mK.shuffle();
    id = newId;  
    plaatsVeld  = plaats;
    figuur = str(mK.get(0).charAt(1));
    aantal = Integer.parseInt(str(mK.get(0).charAt(0)));
    kleur = str(mK.get(0).charAt(2));
    breedteKaart = breedte;
    hoogteKaart = hoogte;
    selected = false;
    mK.remove(0);
  }

  int berekenPlaatsX(int plaats, int breedteKaart, int margin) {
    return ((plaats%3) * breedteKaart) + margin;
  }

  int berekenPlaatsY(int plaats, int hoogteKaart, int margin) {
    return (plaats/3 * hoogteKaart) + margin;
  }

  void tekenKaart(int margin) {
    int marginLeft = berekenPlaatsX(this.plaatsVeld, this.breedteKaart, margin);
    int marginTop = berekenPlaatsY(this.plaatsVeld, this.hoogteKaart, margin);
    if (this.selected) {
      fill(17, 17, 17);
    } else {
      fill(255);
    }
    rect(marginLeft, marginTop, this.breedteKaart, this.hoogteKaart );
  }

  void toggleSelected() {
    this.selected = !this.selected;
  }

  void tekenSymbole(int margin ) {
    int marginLeft = berekenPlaatsX(this.plaatsVeld, this.breedteKaart, margin)+this.breedteKaart/2;
    int marginTop = berekenPlaatsY(this.plaatsVeld, this.hoogteKaart, margin);
    switch(kleur) {
    case "r":
      fill(255, 0, 0);
      break;
    case "g":
      fill(0, 255, 0);
      break;
    case "b":
      fill(0, 0, 255);
    }
    if (this.figuur.equals("e")) {
      for (int i = 0; i < aantal; i++) {
        ellipse(marginLeft, marginTop+(45*(i+1)+20), 30, 30);
      }
    }
    if (this.figuur.equals("d")) {
      for (int i = 0; i < aantal; i++) {
        triangle(marginLeft, marginTop+(50*(i+1)), marginLeft-20, marginTop+20+(50*(i+1)), marginLeft+20, marginTop+20+(50*(i+1)));
      }
    }
    if (this.figuur.equals("r")) {
      for (int i = 0; i < aantal; i++) {
        push();
        rectMode(CENTER);
        rect(marginLeft, marginTop+(55*(i+1)), 70, 50);
        pop();
      }
    }
  }
}
