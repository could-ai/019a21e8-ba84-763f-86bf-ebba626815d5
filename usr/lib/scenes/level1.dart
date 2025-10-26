import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame_audio/flame_audio.dart';
import '../game.dart';
import '../systems/ai.dart';
import '../entities/player.dart';
import '../entities/enemy.dart';

class Level1Scene extends Component with HasGameRef<PlatformerGame> {
  late Player player;
  late List<Enemy> enemies;

  @override
  Future<void> onLoad() async {
    // Add parallax background
    gameRef.background = await ParallaxComponent.load([
      ParallaxImageData('bg_layer1.png'),
      ParallaxImageData('bg_layer2.png'),
      ParallaxImageData('bg_layer3.png'),
    ]);
    add(gameRef.background);

    // Add tilemap (placeholder programmatic layout)
    add(RectangleComponent(size: Vector2(1920, 64), position: Vector2(0, 1016), paint: Paint()..color = Colors.brown));

    // Add player
    player = Player(position: Vector2(100, 900));
    add(player);

    // Add enemies
    enemies = [
      Enemy(type: EnemyType.walker, position: Vector2(800, 900)),
      Enemy(type: EnemyType.charger, position: Vector2(1200, 900)),
    ];
    addAll(enemies);

    // Add coins and hazards
    add(Coin(position: Vector2(600, 850)));
    add(SpikeTrap(position: Vector2(1400, 984)));

    // Goal
    add(GoalPortal(position: Vector2(1800, 850)));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update AI for enemies
    for (var enemy in enemies) {
      AI.updateEnemy(enemy, player, dt);
    }
  }
}