interface Entity {
  void update(float dt);
  void display();
  void onCollision();
  boolean isOffScreen();
}