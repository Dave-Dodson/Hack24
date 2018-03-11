Game game;
float dt;
float prev;

void setup() {
  size(1500, 800);
  game = new Game();
}

void draw() {
  background(0);
  dt = millis() - prev;
  prev = millis();
  game.update(dt);
  game.display();
}