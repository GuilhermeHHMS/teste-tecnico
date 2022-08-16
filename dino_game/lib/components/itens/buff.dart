import 'package:bonfire/bonfire.dart';
import 'package:dino_game/components/itens/itens_sprite_sheet.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

double temp = 5;

class Buff extends GameDecoration with Sensor {
  double dt = 0;

  Buff(Vector2 position)
      : super.withSprite(
            sprite: CommonItems.buffSprite,
            position: position,
            size: Vector2.all(40)) {
    setupSensorArea(intervalCheck: 100);
  }
  late Timer timer = Timer(5, autoStart: false, repeat: false);
  @override
  void update(double dt) {
    this.dt = dt;
    timer.update(dt);
    if (timer.isRunning()) {
      activePower = true;

      if (timer.current >= 4) {
        timer.stop();
        activePower = false;
        removeFromParent();
      }
    }

    super.update(dt);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      timer.repeat;
      timer.start();
    }
  }
}
