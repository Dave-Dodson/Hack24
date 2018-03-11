class Game {
  boolean increasing;
  Player player;
  ArrayList<Entity> entities;
  ArrayList<Bar> bars;
  PathGenerator pg;

  Game() {
    STATE.initStates(height);

    entities = new ArrayList<Entity>();
    bars = new ArrayList<Bar>();

    player = new Player(new PVector(STATE.LEFT_OFFSET, STATE.GAME_WIDTH / 2), new PVector(STATE.PLAYER_SIZE, STATE.PLAYER_SIZE));

    bars.add(new Bar());

    entities.add(new Rock(new PVector(500, 400)));

    pg = new PathGenerator();
    pg.init(STATE.PATH_GENERATORS);
  }

  void update(float dt) {
    while (STATE.LAST_BAR.position.x < width + 500) {
      bars.add(new Bar());
      addObstacles(pg.generate());
    }
    for (int k = 0; k < bars.size(); k++) {
      bars.get(k).update(dt, player);
      if (bars.get(k).position.x < -1500) {
        bars.remove(k);
      }
    }
    for (int k = 0; k < entities.size(); k++) {
      entities.get(k).update(dt, player);
      if (entities.get(k).isOffScreen()) {
        entities.remove(k);
      }
    }
    player.update();
  }

  void display() {
    for (Bar bar : bars) {
      bar.display();
    }
    for (Entity ent : entities) {
      ent.display();
    }
    player.display();
  }

  void addObstacles(ArrayList<String> path) {
    float x = STATE.LAST_BAR.position.x;

    for (int k = 0; k < path.size(); k++) {
      if (path.get(k) == "$") {
        entities.add(new Rock(new PVector(x + STATE.BAR_WIDTH / 3, k * (STATE.GAME_WIDTH / STATE.CURRENT_LANES) + (STATE.GAME_WIDTH / STATE.CURRENT_LANES) / 2)));
      }
    }
  }
}