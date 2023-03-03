import 'package:bonfire/bonfire.dart';
import 'package:dino_game/components/controllers/dino_controllers.dart';
import 'package:dino_game/components/enemys/enemy.dart';
import 'package:dino_game/components/itens/buff.dart';
import 'package:dino_game/components/itens/coin.dart';
import 'package:dino_game/components/player/dino_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Starter(),
      debugShowCheckedModeBanner: false,
    ),
  );

  BonfireInjector.instance.put((i) => BlueDinoController());
  BonfireInjector.instance.put((i) => RedDinoController());
  BonfireInjector.instance.put((i) => PinkDinoController());
  BonfireInjector.instance.put((i) => YellowDinoController());
}

int score = 0;
bool activePower = false;

class Starter extends StatefulWidget {
  const Starter({super.key});

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  late GameController controller;

  @override
  Widget build(BuildContext context) {
    Vector2 tileSize = Vector2(32, 32);

    return BonfireWidget(
      map: WorldMapByTiled(
        'arena.json',
        objectsBuilder: {
          'coin': (properties) => Coin(properties.position),
          'buff': (properties) => Buff(properties.position),
        },
        forceTileSize: tileSize,
      ),
      player: DinoPlayer(),
      joystick: Joystick(
        directional: JoystickDirectional(
            isFixed: true,
            size: MediaQuery.of(context).size.height * 0.15,
            margin: const EdgeInsets.all(80),
            color: Colors.red),
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          enable: true,
        ),
      ),
      components: [
        BlueDino(
          Vector2(32 * 18, 32 * 19),
        ),
        RedDino(
          Vector2(32 * 19, 32 * 18),
        ),
        PinkDino(
          Vector2(32 * 20, 32 * 19),
        ),
        YellowDino(
          Vector2(32 * 19, 32 * 20),
        ),
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        smoothCameraEnabled: true,
        smoothCameraSpeed: 2,
      ),
    );
  }
}
