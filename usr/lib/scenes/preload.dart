import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import '../game.dart';

class PreloadScene extends Component {
  @override
  Future<void> onLoad() async {
    // Preload assets
    await FlameAudio.audioCache.loadAll([
      'jump.wav',
      'land.wav',
      'coin.wav',
      'hit.wav',
      'enemy_die.wav',
      'ui_select.wav',
      'bg_music.ogg',
    ]);
    await images.loadAll([
      'player_sheet.png',
      'enemy_walker.png',
      'enemy_charger.png',
      'coin.png',
      'health.png',
      'tiles.png',
      'ui_buttons.png',
    ]);
    (parent as PlatformerGame).startGame();
  }
}