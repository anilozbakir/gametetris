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
    piece = Piece(type: PieceType.J_BLOCK);
  }

  void RotateAndMovePiece(LogicalKeyboardKey key) {
    if (key == LogicalKeyboardKey.arrowUp) {
      //   var mapPiece = PieceMaps.maps[piece!.type];
      clearTiles();
      piece!.rotation++;
      piece!.rotation %= 4;
      placeTile();
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      clearTiles();
      piece!.rotation = 0;
      _typeIndex++;
      _typeIndex %= 4;
      piece!.type = PieceType.values[_typeIndex];

      placeTile();
    } else if (key == LogicalKeyboardKey.arrowRight) {
      clearTiles();
      piece!.rotation = 0;
      if (_typeIndex > 0) {
        _typeIndex--;
      } else {
        _typeIndex = 3;
      }

      _typeIndex %= 4;
      piece!.type = PieceType.values[_typeIndex];
      placeTile();
    }
  }

  clearTiles() {
    for (int i = 0; i < 16; i++) {
      int posx = piece!.position!.x.toInt() + i % 4;
      int posy = piece!.position!.y.toInt() + i ~/ 4;
      int sc_index = posx.toInt() + posy.toInt() * col;
      screenMap![sc_index].color = PieceColors.COLOR_BLACK;
      screenMap![sc_index].getNewColor();
    }
  }

  placeTile() {
    var mapPiece = PieceMaps.maps[piece!.type];
    for (int i = 0; i < 16; i++) {
      int posx = piece!.position!.x.toInt() + i % 4;
      int posy = piece!.position!.y.toInt() + i ~/ 4;
      int sc_index = posx.toInt() + posy.toInt() * col;
      screenMap![sc_index].color = mapPiece![piece!.rotation][i];
      screenMap![sc_index].getNewColor();
      ;
    }
  }

  @override
  void render(Canvas c) {
    super.render(c);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
