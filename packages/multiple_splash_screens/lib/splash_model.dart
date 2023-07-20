import 'package:flutter/material.dart';

class SplashModel {
  final Duration duration;
  final Widget child;
  final double? heightStartedScreen, marginTopStartedScreen;
  final Color? backgroundColor, colorButton;

  SplashModel(
      {this.heightStartedScreen,
      this.marginTopStartedScreen,
      this.colorButton,
      this.backgroundColor,
      required this.duration,
      required this.child});
}
