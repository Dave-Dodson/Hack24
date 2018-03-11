interface Entity {
  void update(float dt, Player player);
  void display();
  void onCollision();
  boolean isOffScreen();
}