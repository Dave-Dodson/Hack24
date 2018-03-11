class Menu extends UI {

  public String menuText = "Welcome";
  public String buttonText = "Smile to continue";

  int xOffset = 0;
  int yOffset = 0;

  void display() {
    fill(0, 220);
    rectMode(CORNER);
    rect(0+xOffset, 0+yOffset, width, height);
    rectMode(CENTER);
    fill(255);
    textFont(font, 96);
    textAlign(CENTER);
    text(menuText, (width*0.5) + xOffset, (height*0.4) + yOffset, 100);
    textFont(font, 48);
    text(buttonText, (width*0.5) + xOffset, (height*0.7) + yOffset, 100);
    textAlign(LEFT);
  }



  void Show(String s) {
    menuText = s;
    STATE.GAME_PAUSED = true;
    xOffset = 0;
    yOffset = 0;
  }

  void Hide() {
    STATE.GAME_PAUSED = false;
    STATE.LAST_BAR= null;
    keyInput.movedUp = false;
      keyInput.movedDown = false;
      keyInput.stayedThere = false;
    InputsGame.game = new Game();
    xOffset = 2000;
    yOffset = 2000;
  }
}