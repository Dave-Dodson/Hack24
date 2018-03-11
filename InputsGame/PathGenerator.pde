class PathGenerator {
  float step = 0.15;
  ArrayList<ArrayList<String>> path;
  ArrayList<Integer> iterators;

  void init(int iteratorNumber) {
    path = new ArrayList<ArrayList<String>>();
    iterators = new ArrayList<Integer>();

    for (int k = 0; k < iteratorNumber; k++) {
      //iterators.add((int) random(500 * k, 500 * k + 100));
      iterators.add((int) random(STATE.CURRENT_LANES));
    }
  }

  ArrayList<String> generate() {
    ArrayList<String> newBar = new ArrayList<String>();

    for (int k = 0; k < STATE.CURRENT_LANES; k++) {
      newBar.add("$");
    }

    for (int k = 0; k < iterators.size(); k++) {
      int val = (int) random(0, 3);
      val -= 1;
      println(val);
      iterators.set(k, (int) constrain(iterators.get(k) + val, 0, STATE.CURRENT_LANES - 1));
      //int index = (int) (val, 0, 1, 0, STATE.GAME_WIDTH) / (STATE.GAME_WIDTH / STATE.CURRENT_LANES);
      newBar.set(iterators.get(k), "H");
    }
    return newBar;
  }
}