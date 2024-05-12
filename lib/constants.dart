class Constants {
  static double gameScreenRatio = 512.0 / 288.0;

  static double gameScreenHeight(double width) {
    return width * gameScreenRatio;
  }
}
