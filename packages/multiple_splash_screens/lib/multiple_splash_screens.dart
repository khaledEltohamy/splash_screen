library multiple_splash_screens;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiple_splash_screens/rock_screen.dart';
import 'package:multiple_splash_screens/splash_model.dart';
import 'dart:math';

part 'start_timer.dart';
part 'screen.dart';
part 'welcomeScreen_buttton.dart';
part 'alpha_screen.dart';
part 'wave_screen.dart';

ValueNotifier<bool> showShadowLogoScreen = ValueNotifier(true);
ValueNotifier<bool> showLogoText = ValueNotifier(false);
ValueNotifier<bool> showLogoScreen = ValueNotifier(false);
ValueNotifier<bool> showWelcomeScreen = ValueNotifier(false);
ValueNotifier<bool> showButtonWelcomeScreen = ValueNotifier(false);

class MainIntroScreen extends StatefulWidget {
  final SplashModel firstScreen;
  final SplashModel secondScreen;
  final SplashModel thirdScreen;
  final SplashModel fourthScreen;
  final SplashModel fiveScreen;
  final Widget startButtonChild;
  final Widget startIconButton;
  final Function()? actionButton;
  final bool? useWaveScreen, useRockScreen;
  final List<Color>? waveColors, rockColors;

  const MainIntroScreen(
      {super.key,
      required this.firstScreen,
      required this.secondScreen,
      required this.thirdScreen,
      required this.fourthScreen,
      required this.fiveScreen,
      required this.startButtonChild,
      required this.startIconButton,
      this.actionButton,
      this.useWaveScreen,
      this.useRockScreen,
      this.waveColors,
      this.rockColors});

  @override
  State<MainIntroScreen> createState() => _MainIntroScreenState();
}

class _MainIntroScreenState extends State<MainIntroScreen> {
  @override
  void initState() {
    startTimer(
        firstTime: widget.firstScreen.duration.inSeconds,
        secondsTime: widget.secondScreen.duration.inSeconds,
        thirdTime: widget.thirdScreen.duration.inSeconds,
        fourthTime: widget.fourthScreen.duration.inSeconds,
        fiveTime: widget.fiveScreen.duration.inSeconds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ValueListenableBuilder(
            valueListenable: showShadowLogoScreen,
            builder: (context, value, child) => AlphaScreen(
                widget.firstScreen.child,
                backgroundColor: widget.firstScreen.backgroundColor)),
        widget.useWaveScreen != null && widget.useWaveScreen == true
            ? WaveScreen(
                colors: widget.waveColors ??
                    const [
                      Color(0xFFFFA27D),
                      Color.fromARGB(255, 240, 102, 47),
                      Color.fromARGB(255, 88, 36, 15),
                    ],
              )
            : Container(),
        widget.useRockScreen != null && widget.useRockScreen == true
            ? RockScreen(
                colors: widget.rockColors ??
                    [Colors.blue.shade900, Colors.blue.shade600, Colors.blue])
            : Container(),
        ValueListenableBuilder(
            valueListenable: showLogoText,
            builder: (context, value, child) {
              return _introTextScreen(widget.secondScreen.child, context,
                  direction: widget.secondScreen.directionAnimation ??
                      DirectionAnimation.VERTICAL);
            }),
        ValueListenableBuilder(
            valueListenable: showLogoScreen,
            builder: (context, value, child) {
              return _introLogoScreen(widget.thirdScreen.child, context);
            }),
        WelcomeScreenWithButton(
          body: widget.fourthScreen.child,
          iconChild: widget.startIconButton,
          afterChildButton: widget.startButtonChild,
          beforeChildButton: widget.startIconButton,
          backgroundColor: widget.fourthScreen.backgroundColor,
          colorButton: widget.fourthScreen.colorButton,
          onTap: widget.actionButton ?? () => print(""),
        ),
      ]),
    );
  }
}
