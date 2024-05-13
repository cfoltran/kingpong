import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:kingpong/pong_game.dart';

class Paddle extends PositionComponent
    with HasGameRef<PongGame>, DragCallbacks {
  static const double paddleWidth = 100;
  static const double paddleHeight = 20;
  final bool top;

  Paddle({this.top = false}) {
    size = Vector2(paddleWidth, paddleHeight);
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(gameRef.size.x / 2, top ? 0 : (gameRef.size.y - 100));
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), Paint()..color = const Color(0xFFFFFFFF));
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    double delta = event.localDelta.x;
    double newX = position.x + delta;
    position.x = newX.clamp(paddleWidth / 2, gameRef.size.x - paddleWidth / 2);
  }
}
