void mousePressed() {
  int breedte = (width - ( margin * 2 )) / 3;
  int hoogte = (height - ( margin * 2 )) / 3;
  if (mouseY > margin && mouseY < height - margin  && mouseX > margin && mouseX < width - margin ) {
    int y = (constrain(mouseY, margin, height-margin*2)-margin) / hoogte;
    int x =(constrain(mouseX, margin, width-margin*2)-margin) / breedte;
    int nummerKaart = (y * 3) + x;
    kaartenOpVeld[nummerKaart].toggleSelected();
    int checked = checkSelected();
    if (checked == 3) {
      checkSet(breedte, hoogte);
    }
    tekenKaarten();
    tekenSymbolen();
  }
}
