import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:game_deneme/components/fly.dart';

class LangawGame extends Game with TapDetector{
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;

  LangawGame(){
    initialize();
  }

  void initialize() async{
    flies = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    spawnFly();
    print(screenSize.width);
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
    print(flies.length);
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    flies.forEach((Fly fly) => fly.render(canvas));

  }

  @override
  void update(double t) {
    //print(screenSize.width);
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  @override
  void resize(Size size) {
    screenSize=size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

@override
  void onTapDown(TapDownDetails details) {
  flies.forEach((Fly fly) {
    if (fly.flyRect.contains(details.globalPosition)) {
      fly.onTapDown();
    }
  });
    super.onTapDown(details);
  }
}