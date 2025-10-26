import 'package:flame/components.dart';

class GoalPortal extends PositionComponent with CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    add(CircleComponent(radius: 32, paint: Paint()..color = Colors.yellow));
    add(CircleHitbox());
  }
}