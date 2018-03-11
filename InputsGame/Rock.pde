class Rock implements Entity {
  PVector position;
  PVector size ;
  PImage sprite;

  Rock(PVector position) {
    this.position = position;
    this.size = new PVector(STATE.PLAYER_SIZE * 1.5, STATE.PLAYER_SIZE * 1.5);
    sprite = loadImage("./rock.png");
    sprite.resize(0, (int) (STATE.PLAYER_SIZE * 1.8));
  }

  void update(float dt) {
    position.x -= STATE.STEP * dt;

    if (intersects(STATE.PLAYER)) {
      println("DEAD");
    }
  }

  void display() {
    image(sprite, position.x - size.x / 2, position.y - size.y / 2);
  }

  void onCollision() {
  }

  boolean intersects(Player player) {
    float distX = position.x - player.position.x;
    float distY = position.y - player.position.y;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the sum of the circle's
    // radii, the circles are touching!
    if (distance <= size.y + player.size.y - size.y / 3) {
      return true;
    }
    return false;
  }

  boolean isOffScreen() {
    return position.z < -1500;
  }
}