import 'package:flame/components.dart';
import '../game.dart';

class HUD extends Component with HasGameRef<PlatformerGame> {
  late TextComponent coinText;
  late TextComponent healthText;

  @override
  Future<void> onLoad() async {
    coinText = TextComponent(text: 'Coins: 0', position: Vector2(50, 50));
    healthText = TextComponent(text: 'Health: 3', position: Vector2(1700, 50));
    add(coinText);
    add(healthText);

    // Pause menu (placeholder)
    add(ButtonComponent(
      button: TextComponent(text: 'Pause', position: Vector2(50, 100)),
      onPressed: () => showPauseMenu(),
    ));
  }

  void showPauseMenu() {
    add(TextComponent(text: 'Resume | Restart | Quit', position: Vector2(960, 500)));
  }

  void updateCoins(int coins) {
    coinText.text = 'Coins: $coins';
  }

  void updateHealth(int health) {
    healthText.text = 'Health: $health';
  }
}