class Coin implements Entity {
  PVector position;
  PVector size ;
  PImage sprite;

  Coin(PVector position) {
    this.position = position;
    this.size = new PVector(STATE.PLAYER_SIZE * 1.6, STATE.PLAYER_SIZE * 1.6);
  }

  void update(float dt, Player player) {
    position.x -= STATE.STEP * dt;
    position.y = STATE.GAME_WIDTH / 2;

    if (intersects(player)) {
      println("+10");
    }
  }

  void display() {
    fill(#0A4D1E);
    rect(position.x, position.y, size.x, size.y);
  }

  void onCollision() {
  }

  boolean intersects(Player player) {
    if (player.position.x > position.x + size.y / 2) {
      return true;
    }
    return false;
  }

  boolean isOffScreen() {
    return position.z < -500;
  }
}