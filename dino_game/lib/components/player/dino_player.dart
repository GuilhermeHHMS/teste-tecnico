import 'package:bonfire/bonfire.dart';
import 'package:dino_game/main.dart';
import 'package:flutter/material.dart';

class DinoSprite {
  static Future<SpriteAnimation> _imageFrames(String filePath) {
    return SpriteAnimation.load(
      'player/$filePath',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.10,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _imageFrames('dino_idle_left.png');
  static Future<SpriteAnimation> get idleRight =>
      _imageFrames('dino_idle_right.png');
  static Future<SpriteAnimation> get runRight =>
      _imageFrames('dino_run_right.png');
  static Future<SpriteAnimation> get runLeft =>
      _imageFrames('dino_run_left.png');
}

class SuperDinoPlayer {
  static Future<SpriteAnimation> _imageFrames(String filePath) {
    return SpriteAnimation.load(
      'player/$filePath',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.10,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  var superAnimation = SimpleDirectionAnimation(
    idleRight: SuperDinoPlayer.idleRight,
    runRight: SuperDinoPlayer.runRight,
    idleLeft: SuperDinoPlayer.idleLeft,
    runLeft: SuperDinoPlayer.runLeft,
  );
  static Future<SpriteAnimation> get idleLeft =>
      _imageFrames('dino_super_idle_left.png');
  static Future<SpriteAnimation> get idleRight =>
      _imageFrames('dino_super_idle_right.png');
  static Future<SpriteAnimation> get runRight =>
      _imageFrames('dino_run_right.png');
  static Future<SpriteAnimation> get runLeft =>
      _imageFrames('dino_run_left.png');
}

class DinoPlayer extends SimplePlayer with ObjectCollision {
  DinoPlayer()
      : super(
          position: Vector2(32 * 19, 32 * 25),
          size: Vector2(32, 32),
          life: 1,
          animation: SimpleDirectionAnimation(
            idleRight: DinoSprite.idleRight,
            runRight: DinoSprite.runRight,
            idleLeft: DinoSprite.idleLeft,
            runLeft: DinoSprite.runLeft,
          ),
        ) {
    enabledDiagonalMovements = false;

    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(6, 15),
          )
        ],
      ),
    );
  }

//Problemas com animação

  @override
  void update(double dt) {
    super.update(dt);
    // if (activePower == true) {
    //   if (lastDirectionHorizontal == Direction.left) {
    //     animation?.playOnce(SuperDinoPlayer.idleLeft, runToTheEnd: true);
    //   } else {
    //     animation?.playOnce(SuperDinoPlayer.idleRight, runToTheEnd: true);
    //   }
    // }
  }

  @override
  void die() async {
    removeFromParent();
    super.die();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Card(
              margin: const EdgeInsets.all(20),
              elevation: 0,
              child: Text(
                'Que pena... Você Perdeu.\nSeu Score é: $score',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        });
  }
}
