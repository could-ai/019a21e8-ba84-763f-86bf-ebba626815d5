import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame_audio/flame_audio.dart';
import '../game.dart';

class Player extends SpriteAnimationComponent with CollisionCallbacks, KeyboardHandler {
  late SpriteAnimation idle, run, jump;
  Vector2 velocity = Vector2.zero();
  bool onGround = false;
  double coyoteTimer = 0;
  double jumpBufferTimer = 0;

  @override
  Future<void> onLoad() async {
    size = Vector2(48, 64);
    // Placeholder animations (replace with actual sprite sheet)
    idle = SpriteAnimation.spriteList([await Sprite.load('player_idle.png')], stepTime: 0.1);
    animation = idle;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    velocity.y += PlatformerGame.gravity * dt;
    position += velocity * dt;

    // Coyote time and jump buffer
    if (onGround) coyoteTimer = PlatformerGame.coyoteTime;
    coyoteTimer -= dt;
    jumpBufferTimer -= dt;
  }

  void jump() {
    if (coyoteTimer > 0 || jumpBufferTimer > 0) {
      velocity.y = PlatformerGame.jumpForce;
      FlameAudio.play('jump.wav');
    }
  }
}