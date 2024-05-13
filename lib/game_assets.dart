import 'package:kingpong/ball.dart';
import 'package:kingpong/paddle.dart';

class GameAssets {
  late Paddle player1;
  late Paddle player2;
  late Ball ball;

  GameAssets();

  void initialAssets() {
    player1 = Paddle();
    player2 = Paddle(top: true);
    ball = Ball();
  }
}
