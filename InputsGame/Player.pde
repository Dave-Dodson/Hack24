class Player {
  PVector position;
  PVector size;
  PImage sprite;

  boolean moving = false;
  int direction = 0;
  float destinationY;

  Player(PVector position, PVector size) {
    this.position = position;
    this.size = size;
    sprite = loadImage("./car.png");
    sprite.resize(0, (int) STATE.PLAYER_SIZE);
  }

  void update(float dt) {
    if (moving) {
      switch(direction) {
      case -1: //up
        if (abs(position.y - destinationY) > dt * STATE.CAR_SPEED) {
          position.y -= dt * STATE.CAR_SPEED;
        } else {
          position.y = destinationY;
          moving = false;
        }
        break;
      case 1: //down
        if (abs(position.y - destinationY) > dt * STATE.CAR_SPEED) {
          position.y += dt * STATE.CAR_SPEED;
        } else {
          position.y = destinationY;
          moving = false;
        }
        break;
      default: //still
        break;
      }
    }
  }

  void moveUp() {
    if (position.y > STATE.GAME_WIDTH / STATE.CURRENT_LANES + 10) {
      destinationY = position.y - STATE.GAME_WIDTH / STATE.CURRENT_LANES;
      moving = true;
      direction = -1;
    }
  }

  void moveDown() {
    if (position.y < STATE.GAME_WIDTH - STATE.GAME_WIDTH / STATE.CURRENT_LANES) {
      destinationY = position.y + STATE.GAME_WIDTH / STATE.CURRENT_LANES;
      moving = true;
      direction = 1;
    }
  }

  void stayThere() {
    moving = false;
    direction = 0;
  }

  void display() {
    image(sprite, position.x - size.x, position.y - size.y / 2);
  }
}