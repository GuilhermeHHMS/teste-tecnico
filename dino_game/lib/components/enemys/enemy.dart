import 'package:bonfire/bonfire.dart';
import 'package:dino_game/components/enemys/sprite_enemys/sprite_enemy.dart';
import 'package:dino_game/components/player/dino_player.dart';
import 'package:dino_game/main.dart';

class BlueDino extends SimpleEnemy
    with AutomaticRandomMovement, ObjectCollision {
  BlueDino()
      : super(
          position: Vector2(45 * 5, 50 * 5),
          size: Vector2(32, 32),
          speed: 1,
          animation: SimpleDirectionAnimation(
            idleRight: BlueSprite.idleRight,
            runRight: BlueSprite.runRight,
            idleLeft: BlueSprite.idleLeft,
            runLeft: BlueSprite.runLeft,
          ),
          life: 1,
        ) {
    setupCollision(CollisionConfig(
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(20, 20),
          align: Vector2(6, 15),
        ),
      ],
    ));
  }
  @override
  void update(dt) {
    runRandomMovement(
      10,
      maxDistance: 128,
      runOnlyVisibleInCamera: false,
      speed: 10,
      timeKeepStopped: 2000,
    );

    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (onCollision(DinoPlayer(), true)) {
          simpleAttackMelee(
            damage: 10,
            size: Vector2(40, 40),
          );
        }
      },
      radiusVision: tileSize * 20,
    );
    super.update(0.1);
  }
}

class RedDino extends SimpleEnemy
    with AutomaticRandomMovement, ObjectCollision {
  RedDino()
      : super(
          position: Vector2(50 * 5, 50 * 5),
          speed: 1,
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: RedSprite.idleRight,
            runRight: RedSprite.runRight,
            idleLeft: RedSprite.idleLeft,
            runLeft: RedSprite.runLeft,
          ),
        ) {
    setupCollision(CollisionConfig(
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(20, 20),
          align: Vector2(6, 15),
        )
      ],
    ));
  }
  @override
  void update(dt) {
    runRandomMovement(
      10,
      maxDistance: 32,
      minDistance: 32,
      runOnlyVisibleInCamera: false,
      speed: 10,
      timeKeepStopped: 2000,
    );
    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (onCollision(DinoPlayer(), true)) {
          simpleAttackMelee(
            damage: 10,
            size: Vector2(40, 40),
          );
        }
      },
      radiusVision: tileSize * 20,
    );
    super.update(0.1);
  }
}

class PinkDino extends SimpleEnemy
    with AutomaticRandomMovement, ObjectCollision {
  PinkDino()
      : super(
          position: Vector2(60 * 5, 50 * 5),
          speed: 1,
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: PinkSprite.idleRight,
            runRight: PinkSprite.runRight,
            idleLeft: PinkSprite.idleLeft,
            runLeft: PinkSprite.runLeft,
          ),
        ) {
    setupCollision(CollisionConfig(
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(20, 20),
          align: Vector2(6, 15),
        )
      ],
    ));
  }
  @override
  void update(dt) {
    runRandomMovement(
      10,
      maxDistance: 32,
      minDistance: 32,
      runOnlyVisibleInCamera: false,
      speed: 10,
      timeKeepStopped: 2000,
    );
    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (onCollision(DinoPlayer(), true)) {
          simpleAttackMelee(
            damage: 10,
            size: Vector2(40, 40),
          );
        }
      },
      radiusVision: tileSize * 20,
    );
    super.update(0.1);
  }
}

class YellowDino extends SimpleEnemy
    with AutomaticRandomMovement, ObjectCollision {
  YellowDino()
      : super(
          position: Vector2(50 * 5, 40 * 5),
          speed: 1,
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: YellowSprite.idleRight,
            runRight: YellowSprite.runRight,
            idleLeft: YellowSprite.idleLeft,
            runLeft: YellowSprite.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(6, 15),
          ),
        ],
      ),
    );
  }

  @override
  void update(dt) {
    runRandomMovement(
      10,
      maxDistance: 32,
      minDistance: 32,
      runOnlyVisibleInCamera: false,
      speed: 10,
      timeKeepStopped: 10,
    );
    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (onCollision(DinoPlayer(), true)) {
          simpleAttackMelee(
            damage: 10,
            size: Vector2(40, 40),
          );
        }
      },
      radiusVision: tileSize * 20,
    );
    super.update(0.1);
  }
}
