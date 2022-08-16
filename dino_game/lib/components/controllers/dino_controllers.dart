import 'package:bonfire/bonfire.dart';

import '../enemys/enemy.dart';

class BlueDinoController extends StateController<BlueDino> {
  @override
  void update(double dt, component) {}

  void respawn(Vector2 position) {
    final hasGameRaf = component?.hasGameRef ?? false;
    if (hasGameRaf && !gameRef.camera.isMoving) {
      final dino = BlueDino(position);
      gameRef.add(dino);
    }
  }
}

class YellowDinoController extends StateController<YellowDino> {
  @override
  void update(double dt, component) {}

  void respawn(Vector2 position) {
    final hasGameRaf = component?.hasGameRef ?? false;
    if (hasGameRaf && !gameRef.camera.isMoving) {
      final dino = YellowDino(position);
      gameRef.add(dino);
    }
  }
}

class RedDinoController extends StateController<RedDino> {
  @override
  void update(double dt, component) {}

  void respawn(Vector2 position) {
    final hasGameRaf = component?.hasGameRef ?? false;
    if (hasGameRaf && !gameRef.camera.isMoving) {
      final dino = RedDino(position);
      gameRef.add(dino);
    }
  }
}

class PinkDinoController extends StateController<PinkDino> {
  @override
  void update(double dt, component) {}

  void respawn(Vector2 position) {
    final hasGameRaf = component?.hasGameRef ?? false;
    if (hasGameRaf && !gameRef.camera.isMoving) {
      final dino = PinkDino(position);
      gameRef.add(dino);
    }
  }
}
