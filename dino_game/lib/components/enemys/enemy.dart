import 'package:bonfire/bonfire.dart';
import 'package:dino_game/components/controllers/dino_controllers.dart';
import 'package:dino_game/components/enemys/sprite_enemys/sprite_enemy.dart';
import 'package:dino_game/main.dart';

List<Vector2> res = [
  Vector2(32 * 18, 32 * 19),
  Vector2(32 * 19, 32 * 18),
  Vector2(32 * 20, 32 * 19),
  Vector2(32 * 19, 32 * 20),
];

class BlueDino extends SimpleEnemy
    with
        AutomaticRandomMovement,
        ObjectCollision,
        UseStateController<BlueDinoController> {
  BlueDino(Vector2 position)
      : super(
          position: position,
          size: Vector2(32, 32),
          life: 10,
          speed: 1,
          animation: SimpleDirectionAnimation(
            idleRight: BlueSprite.idleRight,
            runRight: BlueSprite.runRight,
            idleLeft: BlueSprite.idleLeft,
            runLeft: BlueSprite.runLeft,
          ),
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
      minDistance: 64,
      runOnlyVisibleInCamera: false,
      speed: 10,
      timeKeepStopped: 0,
    );

    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (activePower == false) {
          simpleAttackMelee(
            damage: 10,
            size: Vector2(40, 40),
          );
        } else {
          removeFromParent();
          score += 100;
          controller.respawn(res[0]);
        }
      },
      radiusVision: 32 * 20,
    );
    super.update(0.1);
  }
}

class RedDino extends SimpleEnemy
    with
        AutomaticRandomMovement,
        ObjectCollision,
        UseStateController<RedDinoController> {
  RedDino(Vector2 position)
      : super(
          position: position,
          speed: 1,
          life: 10,
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
      maxDistance: 128,
      minDistance: 64,
      runOnlyVisibleInCamera: false,
      speed: 10,
      timeKeepStopped: 0,
    );
    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (activePower == false) {
          simpleAttackMelee(
            damage: 10,
            size: Vector2(40, 40),
          );
        } else {
          removeFromParent();
          score += 100;
          controller.respawn(res[1]);
        }
      },
      radiusVision: 32 * 20,
    );
    super.update(0.1);
  }
}

class PinkDino extends SimpleEnemy
    with
        AutomaticRandomMovement,
        ObjectCollision,
        UseStateController<PinkDinoController> {
  PinkDino(Vector2 position)
      : super(
          position: position,
          speed: 1,
          life: 10,
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
      maxDistance: 128,
      minDistance: 64,
      runOnlyVisibleInCamera: false,
      speed: 10,
      timeKeepStopped: 0,
    );
    seeAndMoveToPlayer(
      closePlayer: (player) {
        if (activePower == false) {
          simpleAttackMelee(
            damage: 10,
            size: Vector2(40, 40),
          );
        } else {
          removeFromParent();
          score += 100;
          controller.respawn(res[2]);
        }
      },
      radiusVision: 32 * 20,
    );

    super.update(0.1);
  }
}

class YellowDino extends SimpleEnemy
    with
        AutomaticRandomMovement,
        ObjectCollision,
        UseStateController<YellowDinoController> {
  YellowDino(Vector2 position)
      : super(
          position: position,
          speed: 1,
          life: 10,
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
    runRandomMovement(10,
        maxDistance: 128,
        minDistance: 64,
        runOnlyVisibleInCamera: false,
        speed: 10,
        timeKeepStopped: 0);
    seeAndMoveToPlayer(
      closePlayer: (player) {
        _touch();
      },
      radiusVision: 32 * 20,
    );
    super.update(0.1);
  }

  void _touch() {
    if (activePower == false) {
      simpleAttackMelee(
        damage: 10,
        size: Vector2(40, 40),
      );
    } else {
      removeFromParent();
      score += 100;
      controller.respawn(res[3]);
    }
  }
}
