boolean pressing = false;
Car myCar;


// The statements in the setup() function 
// run once when the program begins
/*void setup() {
  size(640, 480);  // Size should be the first statement
  myCar = new Car(3); //Car(int Number of lanes the car can drive on)
}*/

// The statements in draw() are run until the 
// program is stopped. Each statement is run in 
// sequence and after the last line is read, the first 
// line is run again.
/*void draw() { 
  background(#424248);   // Set the background colour
  
  PImage rockImg = loadImage("rock.png");
  imageMode(CENTER);
  image(rockImg, width/2, height/2, 40, 40); //image(image, x location, y location, width, height)


  myCar.displayCar();
}*/


void keyPressed() {
  if (!pressing) {
    if (key == CODED) {
      if (keyCode == UP) {
        myCar.moveUp();
        pressing = true;
      } else if (keyCode == DOWN) {
        myCar.moveDown();
        pressing = true;
      }
    } else {
    }
  }
}

void keyReleased() {
  pressing = false;
}

/*
interface Command {
 void execute();
 }
 
 class UpCommand implements Command {
 public void execute() {
 myCar.moveUp();
 }
 }
 
 class DownCommand implements Command {
 public void execute() {
 myCar.moveDown();
 }
 }
 */

class Car {
  int lanes;
  int laneWidth = height/lanes;
  int carYLoc = height/2; 
  int carWidth = 140;
  int carHeight = 80;
  int distanceFromRearEdge = carWidth;
  PImage carImg = loadImage("car.png");
  Car(int l) {
    lanes = l;
  }
  public void moveUp() {
    if (carYLoc > laneWidth) {
      carYLoc -= laneWidth;
    }
  }
  public void moveDown() {
    if (carYLoc < laneWidth*(lanes-1)) {
      carYLoc += laneWidth;
    }
  }
  public void displayCar() {
    imageMode(CENTER);
    image(carImg, distanceFromRearEdge, carYLoc, carWidth, carHeight);
  }
}