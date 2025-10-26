import '../entities/enemy.dart';
import '../entities/player.dart';
import 'package:flame/components.dart';

class AI {
  static const double detectionRadius = 150;

  static void updateEnemy(Enemy enemy, Player player, double dt) {
    switch (enemy.state) {
      case EnemyState.patrol:
        enemy.movePatrol(dt);
        if ((enemy.position - player.position).length < detectionRadius) {
          enemy.state = EnemyState.chase;
        }
        break;
      case EnemyState.chase:
        enemy.chasePlayer(player, dt);
        break;
      // Add other states
    }
  }
}