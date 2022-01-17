import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:game_deneme/langawGame.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.util.fullScreen();
  LangawGame game=LangawGame();
  runApp(game.widget);
}
