static Game game;
float dt;
float prev;

void setup() {
  size(1500, 800);
  game = new Game();
  STATE.MENU = new Menu();
  STATE.MENU.Show("Welcome");
}

void draw() {
  background(0);
  dt = millis() - prev;
  prev = millis();
  game.update(dt);
  game.display();
}



void asyncControl() {
  STATE.CONTROLLER.moveDown(STATE.PLAYER);
  STATE.CONTROLLER.moveUp(STATE.PLAYER);
  STATE.CONTROLLER.stayThere(STATE.PLAYER);
}