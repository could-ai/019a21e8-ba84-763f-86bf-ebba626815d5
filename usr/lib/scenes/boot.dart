import 'package:flame/components.dart';
import '../game.dart';

class BootScene extends Component {
  @override
  Future<void> onLoad() async {
    // Load initial assets or settings
    await Future.delayed(const Duration(seconds: 1));
    (parent as PlatformerGame).showMenu();
  }
}