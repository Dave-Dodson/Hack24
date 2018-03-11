KeyInput keyInput = new KeyInput();

class Game {
  boolean increasing;
  ArrayList<Entity> entities;
  ArrayList<Bar> bars;
  PathGenerator pg;

  Game() {
    STATE.initStates(height);

    entities = new ArrayList<Entity>();
    bars = new ArrayList<Bar>();

    STATE.PLAYER = new Player(new PVector(STATE.LEFT_OFFSET, STATE.GAME_WIDTH / STATE.CURRENT_LANES / 2), new PVector(STATE.PLAYER_SIZE, STATE.PLAYER_SIZE));

    bars.add(new Bar());

    pg = new PathGenerator();
    pg.init(STATE.PATH_GENERATORS);

    STATE.CONTROLLER = keyInput;
    STATE.USER_INTERFACE = new UI();
  }

  void update(float dt) {
    while (STATE.LAST_BAR.position.x < width + 500) {
      bars.add(new Bar());
      addObstacles(pg.generate());
    }
    for (int k = 0; k < bars.size(); k++) {
      bars.get(k).update(dt);
      if (bars.get(k).position.x < -1500) {
        bars.remove(k);
      }
    }
    for (int k = 0; k < entities.size(); k++) {
      entities.get(k).update(dt);
      if (entities.get(k).isOffScreen()) {
        entities.remove(k);
      }
    }

    STATE.PLAYER.update(dt);
  }

  void display() {
    for (Bar bar : bars) {
      bar.display();
    }
    for (Entity ent : entities) {
      ent.display();
    }
    STATE.PLAYER.display();
    STATE.USER_INTERFACE.display();
  }

  void addObstacles(ArrayList<String> path) {
    float x = STATE.LAST_BAR.position.x;

    for (int k = 0; k < path.size(); k++) {
      if (path.get(k) == "R") {
        entities.add(new Rock(new PVector(x + STATE.BAR_WIDTH / 3.14, k * (STATE.GAME_WIDTH / STATE.CURRENT_LANES) + (STATE.GAME_WIDTH / STATE.CURRENT_LANES) / 2)));
      } else if (path.get(k) == "$") {
        entities.add(new Coin(new PVector(x + STATE.BAR_WIDTH / 3.14, k * (STATE.GAME_WIDTH / STATE.CURRENT_LANES) + (STATE.GAME_WIDTH / STATE.CURRENT_LANES) / 2)));
      }
    }
  }
}

void keyPressed() {
  if (key == 'q') {
    keyInput.movedUp = true;
    keyInput.movedDown = false;
    keyInput.stayedThere = false;
  } else if (key == 'a') {
    keyInput.stayedThere = true;
    keyInput.movedDown = false;
    keyInput.movedUp = false;
  } else if (key == 'z') {
    keyInput.movedDown = true;
    keyInput.movedUp = false;
    keyInput.stayedThere = false;
  }
}