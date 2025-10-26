import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import '../game.dart';

class MainMenuScene extends Component with HasGameRef<PlatformerGame> {
  @override
  Future<void> onLoad() async {
    add(TextComponent(text: 'Platformer Demo', position: Vector2(960, 400), anchor: Anchor.center));
    add(ButtonComponent(
      button: TextComponent(text: 'Play', position: Vector2(960, 500)),
      onPressed: () => gameRef.world.add(PreloadScene()),
    ));
    add(ButtonComponent(
      button: TextComponent(text: 'Options', position: Vector2(960, 550)),
      onPressed: () => showOptions(),
    ));
    add(ButtonComponent(
      button: TextComponent(text: 'Credits', position: Vector2(960, 600)),
      onPressed: () => showCredits(),
    ));
  }

  void showOptions() {
    // Toggle fullscreen, volume sliders (placeholder)
    FlameAudio.bgm.audioPlayer.setVolume(0.5);
  }

  void showCredits() {
    add(TextComponent(text: 'Created with Flutter & Flame', position: Vector2(960, 700)));
  }
}