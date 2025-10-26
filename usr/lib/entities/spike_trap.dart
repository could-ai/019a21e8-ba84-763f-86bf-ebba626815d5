import 'package:flame/components.dart';

class SpikeTrap extends PositionComponent with CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    add(RectangleComponent(size: Vector2(32, 32), paint: Paint()..color = Colors.red));
    add(RectangleHitbox());
  }
}