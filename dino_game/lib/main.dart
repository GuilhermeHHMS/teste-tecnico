import 'package:bonfire/bonfire.dart';
import 'package:dino_game/components/enemys/enemy.dart';
import 'package:dino_game/components/itens/coin.dart';

import 'package:dino_game/components/player/dino_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Starter(),
    ),
  );
}

const double tileSize = 32;

class Starter extends StatefulWidget {
  const Starter({super.key});

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    Vector2 vector = Vector2(20, 20);
    return BonfireTiledWidget(
      map: TiledWorldMap(
        'arena.json',
        objectsBuilder: {
          'coin': (properties) => Coin(properties.position),
        },
        forceTileSize: const Size(tileSize, tileSize),
      ),
      player: DinoPlayer(),
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          enable: true,
        ),
      ),
      components: [
        Coin(vector),
        YellowDino(),
        PinkDino(),
        RedDino(),
        BlueDino(),
      ],
    );
  }
}
