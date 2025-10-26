import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(const GameApp());
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platformer Demo',
      theme: ThemeData.dark(),
      home: GameWidget(game: PlatformerGame()),
    );
  }
}