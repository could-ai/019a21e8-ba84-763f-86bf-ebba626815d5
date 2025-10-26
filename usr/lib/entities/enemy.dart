import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

enum EnemyType { walker, charger }
enum EnemyState { patrol, chase, attack, stunned, dead }

class Enemy extends SpriteAnimationComponent with CollisionCallbacks {
  EnemyType type;
  EnemyState state = EnemyState.patrol;
  Vector2 velocity = Vector2.zero();

  Enemy({required this.type, required super.position});

  @override
  Future<void> onLoad() async {
    size = type == EnemyType.walker ? Vector2(40, 48) : Vector2(48, 56);
    // Placeholder animations
    animation = SpriteAnimation.spriteList([await Sprite.load('enemy_${type.name}.png')], stepTime: 0.1);
    add(RectangleHitbox());
  }

  void movePatrol(double dt) {
    velocity.x = 50; // Simple patrol
    position += velocity * dt;
  }

  void chasePlayer(Component player, double dt) {
    velocity.x = (player.position.x - position.x).sign * 100;
    position += velocity * dt;
  }
}