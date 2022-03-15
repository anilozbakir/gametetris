//import 'dart:html';

import 'package:flame/components.dart';
import 'dart:ui' as d;
import "piece.dart";

class Tile extends SpriteComponent {
  static Sprite? mainPicture;
  static Vector? imageDimensions;
  static Map<PieceColors, int>? colorToInt;
  static loadMainImage() async {
    //for performance load the main picture once.
    //then cut and move the frame window for what color you want.
    mainPicture =
        await Sprite.load("pieces_Inkspace.png", srcSize: Vector2.all(32));
    colorToInt = {};
    int index = 0;
    PieceColors.values.forEach((element) {
      colorToInt![element] = index++;
    });
  }

  PieceColors color;

  Vector2
      tilePosition; //the screen is seen as a matrix with equal dimensions of tiles
  // so this value is matrix x,y locations.
  // Tile({this.color = PieceColors.COLOR_BLACK, required this.tilePosition}) {}
  // @override
  // Future<void> onLoad() async {
  //   await super.onLoad();
  //   this.sprite =
  //       await Sprite.load("pieces_Inkspace.png", srcSize: Vector2.all(32));
  //   // this.sprite = mainPicture;

  //   //  getNewColor();

  //   //  this.sprite!.srcPosition = position;
  // }

  Tile({required this.color, required this.tilePosition})
      : super(size: Vector2.all(32)) {
    sprite = Sprite(mainPicture!.image, srcSize: Vector2.all(32));
    // sprite!.srcPosition = Vector2(32, 32);
    getNewColor();
  }

  void getNewColor() {
    int i = colorToInt![color] ?? 0;
    int row, col;
    row = i ~/ 4;
    col = i % 4;
    sprite!.srcPosition =
        Vector2(col * this.sprite!.srcSize.x, row * this.sprite!.srcSize.y);
  }

  void ForceNewColor(PieceColors colorr) {
    this.color = colorr;
    getNewColor();
  }
}
