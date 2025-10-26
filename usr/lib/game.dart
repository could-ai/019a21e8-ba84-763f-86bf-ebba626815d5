import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'scenes/boot.dart';
import 'scenes/preload.dart';
import 'scenes/main_menu.dart';
import 'scenes/level1.dart';
import 'scenes/hud.dart';

class PlatformerGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection {
  // Constants
  static const double gravity = 1200;
  static const double playerSpeed = 200;
  static const double jumpForce = -400;
  static const double coyoteTime = 0.12;
  static const double jumpBuffer = 0.08;

  late ParallaxComponent background;
  late HUD hud;

  @override
  FutureOr<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(Vector2(1920, 1080));
    world.add(BootScene());
  }

  void startGame() {
    world.removeAll(world.children);
    world.add(Level1Scene());
    world.add(HUD());
  }

  void showMenu() {
    world.removeAll(world.children);
    world.add(MainMenuScene());
  }
}