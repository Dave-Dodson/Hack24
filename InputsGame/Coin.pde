class Coin implements Entity {
  PVector position;
  PVector size ;
  PImage sprite;

  boolean collided = false;

  Coin(PVector position) {
    this.position = position;
    this.size = new PVector(STATE.PLAYER_SIZE * 1.6, STATE.PLAYER_SIZE * 1.6);
  }

  void update(float dt) {
    position.x -= STATE.STEP * dt;

    if (intersects(STATE.PLAYER)) {
      STATE.USER_INTERFACE.score += 100;
      onCollision();
    }
  }

  void display() {
    if (!collided) {
      fill(#E4FA03);
      ellipse(position.x, position.y, size.x, size.y);
    }
  }

  void onCollision() {
    collided = true;
  }

  boolean intersects(Player player) {
    if (!collided) {
      float distX = position.x - player.position.x;
      float distY = position.y - player.position.y;
      float distance = sqrt( (distX*distX) + (distY*distY) );

      // if the distance is less than the sum of the circle's
      // radii, the circles are touching!
      if (distance <= size.y + player.size.y - size.y / 2) {
        return true;
      }
    }
    return false;
  }

  boolean isOffScreen() {
    return position.z < -500;
  }
}