import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class Coin extends SpriteComponent with CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('coin.png');
    size = Vector2(16, 16);
    add(CircleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      FlameAudio.play('coin.wav');
      removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}