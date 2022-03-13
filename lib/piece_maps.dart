import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'dart:developer' as dv;

import "dart:ui" as d;
import 'dart:developer';

import "dart:math";
import "piece.dart";

class PieceMaps {
  static Map<PieceType, List<List<PieceColors>>> maps = {
    PieceType.I_BLOCK: [
      //map all the rotations of i_block
      // 0 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
      ],
      // 90 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE
      ],
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_BLACK,
      ],
      // 90 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE
      ],
    ],

    //j_Block_Map

    PieceType.J_BLOCK: [
      //map all the rotations of i_block
      // 0 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
      ],
      // 90 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK
      ],
      //180 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
      ],
      // 270 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE
      ],
    ],
    PieceType.L_BLOCK: [
      //map all the rotations of i_block
      // 0 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
      ],
      // 90 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK
      ],
      //180 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLUE,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
      ],
      // 270 degrees
      [
        //row1
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 2
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 3
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        PieceColors.COLOR_BLACK,
        //row 4
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE,
        PieceColors.COLOR_LIGHT_BLUE
      ],
    ]
  };

  // l_Block_Map

  // o_Block_Map

//s_Block_Map

//t_Block_Map

//z_Block_Map

}
