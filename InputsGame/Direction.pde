

class Direction {
  
  void display() {
    if (!STATE.GAME_PAUSED) {
    PImage Img;
    if (keyInput.movedUp) {
      Img = loadImage("up_arrow.png");
    }
    if (keyInput.movedDown) {
      Img = loadImage("down_arrow.png");
    } else {
      Img = loadImage("right_arrow.png");
    }
    imageMode(CENTER);
    image(Img, width*0.5, height*0.5);
    imageMode(CORNER);
    }
  }
}