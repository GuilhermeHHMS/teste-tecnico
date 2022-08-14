import 'package:bonfire/bonfire.dart';

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

class DinoPlayer extends SimplePlayer with ObjectCollision {
  DinoPlayer()
      : super(
          position: Vector2(50 * 5, 80 * 5),
          size: Vector2(
            32,
            32,
          ),
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
}
