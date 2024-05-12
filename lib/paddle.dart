import 'dart:ui';

import 'package:flame/components.dart';
import 'package:kingpong/pong_game.dart';

class Paddle extends PositionComponent with HasGameRef<PongGame> {
  static const double paddleWidth = 100;
  static const double paddleHeight = 20;

  Paddle() {
    size = Vector2(paddleWidth, paddleHeight);
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), Paint()..color = const Color(0xFFFFFFFF));
  }
}
