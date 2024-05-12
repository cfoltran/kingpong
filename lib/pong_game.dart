import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:kingpong/constants.dart';
import 'package:kingpong/enum/game_state.dart';
import 'package:kingpong/game_assets.dart';

class PongGame extends FlameGame with HasCollisionDetection, TapCallbacks {
  @override
  late final World world;
  late final CameraComponent cameraComponent;
  late final GameAssets gameAssets;
  GameState gameState = GameState.initial;
  int score = 0;

  @override
  FutureOr<void> onLoad() async {
    world = World();
    cameraComponent = CameraComponent.withFixedResolution(
      world: world,
      width: size.x,
      height: size.y,
    );
    cameraComponent.viewfinder.position = Vector2(
      size.x / 2,
      size.x * Constants.gameScreenRatio / 2,
    );

    await addAll([
      world,
      cameraComponent,
    ]);

    gameAssets = GameAssets();
    gameAssets.initialAssets();
    await world.addAll([
      gameAssets.player,
      ScreenHitbox(),
    ]);

    return super.onLoad();
  }

  Future<void> startGame() async {}

  Future<void> restartGame() async {
    await initialize();
    await startGame();
  }

  Future<void> initialize() async {
    score = 0;
    world.removeAll(world.children);
    gameState = GameState.initial;
  }

  void gameover() async {}

  Future<void> backToStart() async {}
}
