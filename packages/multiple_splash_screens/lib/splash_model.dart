import 'package:flutter/material.dart';

import 'multiple_splash_screens.dart';

class SplashModel {
  final Duration duration;
  final Widget child;
  final DirectionAnimation? directionAnimation;
  final double? heightStartedScreen, marginTopStartedScreen;
  final Color? backgroundColor, colorButton;

  SplashModel(
      {this.heightStartedScreen,
      this.marginTopStartedScreen,
      this.colorButton,
      this.directionAnimation,
      this.backgroundColor,
      required this.duration,
      required this.child});
}
