import 'package:kingpong/paddle.dart';

class GameAssets {
  late Paddle player;

  GameAssets();

  void initialAssets() {
    player = Paddle();
  }
}
