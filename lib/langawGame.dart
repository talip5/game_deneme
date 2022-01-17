import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:game_deneme/components/fly.dart';
import 'package:game_deneme/components/backyard.dart';

class LangawGame extends Game with TapDetector{
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  Backyard background;

  LangawGame(){
    initialize();
  }

  void initialize() async{
    flies = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    spawnFly();
    background = Backyard(this);
    //print(screenSize.width);
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
    print(flies.length);
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);

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