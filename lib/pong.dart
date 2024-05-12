import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:kingpong/pong_game.dart';

class PongPage extends StatelessWidget {
  const PongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: PongGame(),
    );
  }
}
