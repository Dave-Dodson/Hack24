static class STATE {
  static final float STEP = 0.2; 
  static final float LEFT_OFFSET = 175;
  static final int PATH_GENERATORS = 1;
  static final int STARTING_LANES = 6;
  static final float CAR_SPEED = 0.2;
  static Player PLAYER;
  static Controller CONTROLLER;
  static UI USER_INTERFACE;
  static float GAME_WIDTH;
  static float CURRENT_LANES;
  static float LANE_WIDTH;
  static Bar LAST_BAR;
  static float BAR_WIDTH;
  static float PLAYER_SIZE;

  static boolean GAME_PAUSED;
  static Menu MENU;
  static Direction DIRECTION;

  static void initStates(float currentHeight) {
    GAME_WIDTH = currentHeight;
    CURRENT_LANES =  STATE.STARTING_LANES;
    LANE_WIDTH = STATE.GAME_WIDTH / STATE.CURRENT_LANES;
    BAR_WIDTH = 800;
    PLAYER_SIZE = STATE.LANE_WIDTH / STATE.CURRENT_LANES * 3;
  }
}