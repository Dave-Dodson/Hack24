class Player {
  PVector position;
  PVector size;
  PImage sprite;

  Player(PVector position, PVector size) {
    this.position = position;
    this.size = size;
  }

  void update() {
  }

  void display() {
    fill(#CE0C02);
    rect(position.x, position.y, size.x, size.y);
  }
}