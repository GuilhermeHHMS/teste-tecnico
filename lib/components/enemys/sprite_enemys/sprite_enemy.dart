import 'package:bonfire/bonfire.dart';

class BlueSprite {
  static Future<SpriteAnimation> _imageFrames(String filePath) {
    return SpriteAnimation.load(
      'enemy/$filePath',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.9,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _imageFrames('blue_idle_left.png');
  static Future<SpriteAnimation> get idleRight =>
      _imageFrames('blue_idle_right.png');
  static Future<SpriteAnimation> get runRight =>
      _imageFrames('blue_run_right.png');
  static Future<SpriteAnimation> get runLeft =>
      _imageFrames('blue_run_left.png');
}

class RedSprite {
  static Future<SpriteAnimation> _imageFrames(String filePath) {
    return SpriteAnimation.load(
      'enemy/$filePath',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.5,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _imageFrames('red_idle_left.png');
  static Future<SpriteAnimation> get idleRight =>
      _imageFrames('red_idle_right.png');
  static Future<SpriteAnimation> get runRight =>
      _imageFrames('red_run_right.png');
  static Future<SpriteAnimation> get runLeft =>
      _imageFrames('red_run_left.png');
}

class PinkSprite {
  static Future<SpriteAnimation> _imageFrames(String filePath) {
    return SpriteAnimation.load(
      'enemy/$filePath',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.6,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _imageFrames('pink_idle_left.png');
  static Future<SpriteAnimation> get idleRight =>
      _imageFrames('pink_idle_right.png');
  static Future<SpriteAnimation> get runRight =>
      _imageFrames('pink_run_right.png');
  static Future<SpriteAnimation> get runLeft =>
      _imageFrames('pink_run_left.png');
}

class YellowSprite {
  static Future<SpriteAnimation> _imageFrames(String filePath) {
    return SpriteAnimation.load(
      'enemy/$filePath',
      SpriteAnimationData.sequenced(
        amount: 8,
        stepTime: 0.8,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _imageFrames('yellow_idle_left.png');
  static Future<SpriteAnimation> get idleRight =>
      _imageFrames('yellow_idle_right.png');
  static Future<SpriteAnimation> get runRight =>
      _imageFrames('yellow_run_right.png');
  static Future<SpriteAnimation> get runLeft =>
      _imageFrames('yellow_run_left.png');
}
