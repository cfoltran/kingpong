import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:kingpong/paddle.dart';
import 'package:kingpong/pong_game.dart';

class Ball extends PositionComponent
    with HasGameRef<PongGame>, CollisionCallbacks {
  Vector2 velocity = Vector2(200, -200);

  Ball({Vector2? position, Vector2? size})
      : super(
          position: position ?? Vector2.zero(),
          size: size ?? Vector2.all(20),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.add(velocity * dt);
    _checkBounds();
  }

  void _checkBounds() {
    if (position.x <= size.x / 2 || position.x >= gameRef.size.x - size.x / 2) {
      velocity.x = -velocity.x;
    }
    if (position.y <= size.y / 2 || position.y >= gameRef.size.y - size.y / 2) {
      velocity.y = -velocity.y;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = const Color(0xFFFFFFFF);
    canvas.drawCircle(Offset.zero, size.x / 2, paint);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    print('💥 $other');
    if (other is Paddle) {
      velocity.y = -velocity.y;
    }

    super.onCollisionStart(intersectionPoints, other);
  }
}
