// Déclaration des variables
PImage balle, raquette, fondballe, fondraquette;
int x, y, dx, dy ,oldx, oldy;
int xraquette, yraquette, oldxraquette, oldyraquette;

void setup() {
  // Initialisations
  oldx = 0;
  oldy = 0;
  x = 0;
  y = 0;
  dx = 2;
  dy = 2;
  oldxraquette = 300;
  oldyraquette = 450;
  xraquette = 300;
  yraquette = 450;
  balle = loadImage("balle2.png");
  raquette = loadImage("raquette.png");
  size(700,500);
  fondballe = get(x, y, 20, 20);
  fondraquette = get(xraquette, yraquette, 80, 20);
}

void draw() {
  // Efface les positions précédentes de la balle et de la raquette
  image(fondballe, oldx, oldy);
  image(fondraquette, oldxraquette, oldyraquette);  
  // récupère le fond des nouvelles positions de la balle et de la raquette
  oldx = x;
  oldy = y;
  oldxraquette = xraquette;
  oldyraquette = yraquette;
  fondballe = get(x, y, 20, 20);
  fondraquette = get(xraquette, yraquette, 80, 20);
  // Affiche la balle et la raquette
  image(balle, x, y);
  image(raquette, xraquette, yraquette);
  // Déplacement de la balle
  x = x + dx;
  y = y + dy;
  // Rebond éventuel de la balle sur le haut du terrain
  if (y <= 0) {
    dy = -dy;
  }
  // Rebond éventuel de la balle sur la gauche ou la droite du terrain
  if ((x < 0 ) || (x > width - 20)) {
    dx = -dx;
  }
  // Déplacement de la raquette
  if (keyPressed) {
    if (key == CODED) {
      // On se déplace avec les touches flèche vers la gauche et flèche vers la droite
      if ((keyCode == LEFT) && (xraquette > 0)) {
        xraquette = xraquette - 2;
      }
      if ((keyCode == RIGHT) && (xraquette < width - 80)) {
        xraquette = xraquette + 2;
      }
    }
  }
  // La raquette touche la balle ?
  if ((y + 20 == yraquette) && (x >= xraquette) && (x + 20 <= xraquette + 80)) {
    // Si oui la balle rebondit
    dy = -dy;
  }
  // On perd la balle ?
  if (y > yraquette) {
    // On remet la balle en haut
    x = 0;
    y = 0;
  }
}
