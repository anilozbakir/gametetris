//import 'dart:html';

//import 'dart:html';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gametetris/piece_maps.dart';

import 'dart:developer' as dv;

import "dart:ui" as d;
import 'dart:developer';

import "dart:math";
import "tile.dart";
import "piece.dart";
import "package:flame/input.dart";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "dart:math";

class GameBoard extends PositionComponent {
  int row, col;
  int _typeIndex = 0;
  Vector2? gameposition;
  GameBoard({required this.row, required this.col}) : super();
  List<Tile>? screenMap;
  Piece? piece;
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    await Tile.loadMainImage();
    screenMap = List.generate(
        col * row,
        (index) =>
            Tile(color: PieceColors.COLOR_BLACK, tilePosition: Vector2.all(0)));
    // // screenMap = List.generate(row, (i) => listLine, growable: false);
    // //Future.delayed(Duration(milliseconds: 1000));
    gameposition = Vector2(50, 20);

    for (int i = 0; i < row * col; i++) {
      int c = (i % col);
      int r = (i / col).toInt();

      var tl = Tile(
          color: PieceColors.COLOR_BLACK, //PieceColors.values[c % 8],
          tilePosition: Vector2(col.toDouble(), row.toDouble()));
      tl.position = Vector2(gameposition!.x + c * 24, gameposition!.y + r * 24);
      // var x = tl.position.x;
      // var y = tl.position.y;
      // dv.log("$i: $x $y");
      tl.scale = Vector2(24 / 32, 24 / 32);
      screenMap![i] = tl;
      add(tl);
    }
    newPiece();
  }

  void newPiece() {
    var randomx = Random();
    var pieceTypeIndex = randomx.nextInt(100);
    pieceTypeIndex %= 4;
    //pieceType %= PieceType.values.length;
    piece = Piece(type: PieceType.values[pieceTypeIndex]);
  }

//for test proposes the piece is rotated without movement ,
//works for four pieces
  void RotateAndMovePiece(LogicalKeyboardKey key) {
    if (key == LogicalKeyboardKey.arrowUp) {
      //   var mapPiece = PieceMaps.maps[piece!.type];
      clearTiles(true);
      piece!.rotation++;
      piece!.rotation %= 4;
      placeTile();
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      clearTiles(true);
      piece!.rotation = 0;
      _typeIndex++;
      _typeIndex %= 4;
      piece!.type = PieceType.values[_typeIndex];

      placeTile();
    } else if (key == LogicalKeyboardKey.arrowRight) {
      clearTiles(true);
      piece!.rotation = 0;
      // if (_typeIndex > 0) {
      //   _typeIndex--;
      // } else {
      //   _typeIndex = 3;
      // }
      _typeIndex--;
      _typeIndex %= 4;
      piece!.type = PieceType.values[_typeIndex];
      placeTile();
    }
  }

  clearTiles(bool setNewColor) {
    var mapPiece = PieceMaps.maps[piece!.type];
    int posx, posy, scindex;
    for (int i = 0; i < 16; i++) {
      posx = piece!.position!.x.toInt() + i % 4;
      posy = piece!.position!.y.toInt() + i ~/ 4;
      scindex = posx.toInt() + posy.toInt() * col;
      if (mapPiece![piece!.rotation][i] != PieceColors.COLOR_BLACK) {
        //clear the tile if it has a color value.
        screenMap![scindex].color = PieceColors.COLOR_BLACK;
        if (setNewColor) screenMap![scindex].getNewColor();
      }
    }
  }

  placeTile() {
    int posx, posy, scindex;
    var mapPiece = PieceMaps.maps[piece!.type];
    for (int i = 0; i < 16; i++) {
      posx = piece!.position!.x.toInt() + i % 4;
      posy = piece!.position!.y.toInt() + i ~/ 4;
      scindex = posx.toInt() + posy.toInt() * col;
      if (mapPiece![piece!.rotation][i] != PieceColors.COLOR_BLACK) {
        //clear the tile if it has a color value.
        screenMap![scindex].color = mapPiece[piece!.rotation][i];
        screenMap![scindex].getNewColor();
      }
      // screenMap![sc_index].color = mapPiece![piece!.rotation][i];
      // screenMap![sc_index].getNewColor();
    }
  }

  bool checkNewMove(LogicalKeyboardKey key, int newRotation) {
    int posx, posy, scindex;
    Vector2 newPosition;
    ;
    int rotation = piece!.rotation;
    newPosition = Vector2(0, 0);
    //  checkVector = Vector2(1, 0);
    var mapPiece = PieceMaps.maps[piece!.type];
    if (key == LogicalKeyboardKey.arrowDown) {
      newPosition = Vector2(0, 1);
      //  checkVector = Vector2(1, 0);
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      newPosition = Vector2(-1, 0);
      // checkVector = Vector2(0, 1);
    } else if (key == LogicalKeyboardKey.arrowRight) {
      newPosition = Vector2(1, 0);
      // checkVector = Vector2(0, 1);
    } else if (key == LogicalKeyboardKey.arrowUp) {
      newRotation = rotation++;
      newRotation %= 4;
      // checkVector = Vector2(1, 1);
    }
    clearTiles(
        false); //clear the old tiles from screen memory(not screen itself)
    for (int i = 0; i < 16; i++) {
      posx = piece!.position!.x.toInt() + newPosition.x.toInt() + i % 4;

      posy = piece!.position!.y.toInt() + newPosition.y.toInt() + i ~/ 4;
      scindex = posx.toInt() + posy.toInt() * col;

      // if ((posx < 0 || posx > col || posy >= row || (scindex < 0)) ||
      //     (screenMap![scindex].color != PieceColors.COLOR_BLACK &&
      //         mapPiece![newRotation][i] != PieceColors.COLOR_BLACK)) {
      if (mapPiece![newRotation][i] != PieceColors.COLOR_BLACK &&
          (((posx == -1) && key == LogicalKeyboardKey.arrowLeft) ||
              ((posx == (col)) && key == LogicalKeyboardKey.arrowRight) ||
              ((posy == (row)) && key == LogicalKeyboardKey.arrowDown) ||
              screenMap![scindex].color != PieceColors.COLOR_BLACK)) {
        dv.log(("collusion $posx $posy "));
        if (scindex < 0) {
          dv.log("index fault");
        }
        placeTile(); //place old tile back
        return false;
      }
    }
    //no collusion place it to its new location
    clearTiles(true); //clear the old tiles from screen
    piece!.position = newPosition + piece!.position!;
    rotation = newRotation;

    placeTile();
    return true;
  }

  // checkMoveAndPlace(LogicalKeyboardKey key) {
  //   bool process = false;
  //   if (key == LogicalKeyboardKey.arrowDown) {
  //   } else if (key == LogicalKeyboardKey.arrowLeft) {
  //   } else if (key == LogicalKeyboardKey.arrowDown) {}
  // }

  @override
  void render(Canvas c) {
    super.render(c);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
