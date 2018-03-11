class UI {
  int score;
  PFont font;

  UI() {
    font = loadFont("./data/Waree-Bold-32.vlw");
    textFont(font, 32);
  }

  void display() {
    textFont(font, 32);
    String s = "Score: " + score;
    fill(50);
    rectMode(CORNER);
    text(s, 20, height - 50, 800, 80);
    rectMode(CENTER);
  }
}