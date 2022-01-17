import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LandawGame extends Game with TapDetector{

  Size screenSize;
  bool hasWon = false;

  LandawGame(){

  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
        screenCenterX - 75,
        screenCenterY - 75,
        150,
        150
    );
    Paint boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);


  }

  @override
  void update(double t) {
    //print(screenSize.width);
  }

  @override
  void resize(Size size) {
    screenSize=size;
    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (details.globalPosition.dx >= screenCenterX - 75
        && details.globalPosition.dx <= screenCenterX + 75
        && details.globalPosition.dy >= screenCenterY - 75
        && details.globalPosition.dy <= screenCenterY + 75
    ) {
      hasWon =! hasWon;
      //hasWon=true;
    }
    super.onTapDown(details);
  }

}