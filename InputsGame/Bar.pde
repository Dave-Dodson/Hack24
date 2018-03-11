class Bar {
  PVector position;
  PVector size;
  int lanes;
  boolean hasIntersected;
  boolean extraLaneIncoming;

  Bar() {
    size = new PVector(STATE.BAR_WIDTH, STATE.GAME_WIDTH);
    float newXPos = STATE.LAST_BAR != null ? STATE.LAST_BAR.position.x : -200;
    position = new PVector(newXPos + size.x, STATE.GAME_WIDTH / 2);
    STATE.LAST_BAR = this;
    hasIntersected = false;
  }

  void update(float dt, Player player) {
    position.x -= STATE.STEP * dt;
    position.y = STATE.GAME_WIDTH / 2;
    size.y = STATE.GAME_WIDTH;

    if (intersects(player)) {
      println("TAAC");
    }
  }

  void display() {
    rectMode(CENTER);
    noStroke();

    // road
    fill(#8E8C8C);
    rect(position.x, position.y, size.x, size.y);

    // lanes
    fill(#FFFFFF);
    for (int k = 1; k < STATE.CURRENT_LANES; k++) {
      rect(position.x, k * STATE.LANE_WIDTH, size.x, 50 / STATE.CURRENT_LANES);
    }

    fill(#19FC5F);
    rect(position.x + size.y / 2, STATE.GAME_WIDTH / 2, 20, STATE.GAME_WIDTH);
  }

  boolean intersects(Player player) {
    if (hasIntersected) {
      return false;
    }

    if (player.position.x > position.x + size.y / 2) {
      hasIntersected = true;
      return true;
    }
    return false;
  }
}