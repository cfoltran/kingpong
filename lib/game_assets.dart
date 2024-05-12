import 'package:kingpong/ball.dart';
import 'package:kingpong/paddle.dart';

class GameAssets {
  late Paddle player;
  late Ball ball;

  GameAssets();

  void initialAssets() {
    player = Paddle();
    ball = Ball();
  }
}
