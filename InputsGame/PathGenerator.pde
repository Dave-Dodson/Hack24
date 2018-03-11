class PathGenerator {
  float step = 0.15;
  ArrayList<Integer> iterators;

  void init(int iteratorNumber) {
    iterators = new ArrayList<Integer>();

    iterators.add(0);
    for (int k = 0; k < iteratorNumber - 1; k++) {
      iterators.add((int) random(500 * k, 500 * k + 100));
    }
  }

  ArrayList<String> generate() {
    ArrayList<String> newBar = new ArrayList<String>();

    for (int k = 0; k < STATE.CURRENT_LANES; k++) {
      newBar.add("R");
    }

    for (int k = 0; k < iterators.size(); k++) {
      int val = (int) random(0, 3);
      val -= 1;
      iterators.set(k, (int) constrain(iterators.get(k) + val, 0, STATE.CURRENT_LANES - 1));
      //int index = (int) (val, 0, 1, 0, STATE.GAME_WIDTH) / (STATE.GAME_WIDTH / STATE.CURRENT_LANES);
      newBar.set(iterators.get(k), "E");
      if (random(10) > 9) {
        newBar.set(iterators.get(k), "$");
      }
    }
    return newBar;
  }
}