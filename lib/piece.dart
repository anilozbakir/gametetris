import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'dart:developer' as dv;

import "dart:ui" as d;
import 'dart:developer';

import "dart:math";
import "piece_maps.dart";

enum PieceType { I_BLOCK, J_BLOCK, L_BLOCK, O_BLOCK, S_BLOCK, T_BLOCK, Z_BLOCK }
enum PieceColors {
  COLOR_BLACK,
  COLOR_LIGHT_BLUE,
  COLOR_BLUE,
  COLOR_ORANGE,
  COLOR_YELLOW,
  COLOR_GREEN,
  COLOR_PURPLE,
  COLOR_RED
}

class Piece {
  PieceType type;
  int rotation = 0;
  Vector2? position;
  Piece({required this.type}) {
    position = Vector2(5, 0); //start from mid screen
  }
}
