class KeyInput implements Controller {
  boolean movedUp = false;
  boolean movedDown = false;
  boolean stayedThere = false;

  boolean moveUp(Player player) {
    if (movedUp) {
      movedUp = false;
      player.moveUp();
      return true;
    }
    return false;
  }

  boolean moveDown(Player player) {
    if (movedDown) {
      movedDown = false;
      player.moveDown();
      return true;
    }
    return false;
  }
  
  boolean stayThere(Player player) {
    if (stayedThere) {
      stayedThere = false;
      player.stayThere();
      return true;
    }
    return false;
  }
}