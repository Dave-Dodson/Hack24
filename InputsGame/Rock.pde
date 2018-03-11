class Rock implements Entity {
  PVector position;
  PVector size ;
  PImage sprite;

  Rock(PVector position) {
    this.position = position;
    this.size = new PVector(STATE.PLAYER_SIZE * 2, STATE.PLAYER_SIZE * 2);
  }

  void update(float dt, Player player) {
    position.x -= STATE.STEP * dt;

    if (intersects(player)) {
      //println("DEAD");
    }
  }

  void display() {
    fill(#0A4D1E);
    rect(position.x, position.y, size.x, size.y);
  }

  void onCollision() {
  }

  boolean intersects(Player player) {
    float distX = position.x - player.position.x;
    float distY = position.y - player.position.y;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the sum of the circle's
    // radii, the circles are touching!
    if (distance <= size.y + player.size.y) {
      return true;
    }
    return false;
  }

  boolean isOffScreen() {
    return position.z < -1500;
  }
}