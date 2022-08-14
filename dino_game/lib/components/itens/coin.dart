import 'package:bonfire/bonfire.dart';
import 'package:dino_game/components/itens/itens_sprite_sheet.dart';
import 'package:dino_game/main.dart';

class Coin extends GameDecoration with Sensor {
  double dt = 0;
  Coin(Vector2 position)
      : super.withSprite(
            sprite: CommonItems.coinSprite,
            position: position,
            size: Vector2.all(40)) {
    setupSensorArea(intervalCheck: 100);
  }
  @override
  void update(double dt) {
    this.dt = dt;
    super.update(dt);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      removeFromParent();
    }
  }
}
