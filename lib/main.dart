import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import "package:flame/game.dart";

// import "package:flame/game.dart";
import 'package:flame/input.dart';
// import 'package:flame/sprite.dart';

// import "dart:math";

// import 'dart:developer' as dv;
// import "RecTouch.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as dv;
import "game_board.dart";
//import 'package:game2048/game_board.dart';

class MyGame extends FlameGame with KeyboardEvents {
  GameBoard? gameBoard;
  MyGame() : super();

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    gameBoard = GameBoard(col: 10, row: 30);
    add(gameBoard!);
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    if (isKeyDown) {
      // gameBoard!.RotateAndMovePiece(keysPressed.first);

      // if (keysPressed.first == LogicalKeyboardKey.space) {
      //   while (gameBoard!.checkNewMove(keysPressed.first));
      //   int c = gameBoard!.collusionIndex ~/ gameBoard!.col;
      //   dv.log("$c");
      //   gameBoard!.blowLines(c);

      //   gameBoard!.newPiece();
      //   return KeyEventResult.handled;
      // }
      bool result = gameBoard!.checkNewMove(keysPressed.first);
      if (!result && keysPressed.first == LogicalKeyboardKey.arrowDown) {
        //the piece moved down and there is a collusion
        //make a new piece
        int gx = gameBoard!.piece!.position!.x.toInt();
        int gy = gameBoard!.piece!.position!.y.toInt();
        int c = gameBoard!.collusionIndex ~/ gameBoard!.col;
        dv.log("$c");
        gameBoard!.blowLines(c);

        gameBoard!.newPiece();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  // @override
  // void render(Canvas c) {
  //   super.render(c);
  // }

  // @override
  // void update(double dt) {
  //   super.update(dt);
  // }
}

void main() {
  final myGame = MyGame();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}
