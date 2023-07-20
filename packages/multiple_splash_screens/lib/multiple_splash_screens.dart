library multiple_splash_screens;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiple_splash_screens/splash_model.dart';
part 'start_timer.dart';
part 'screen.dart';

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

  const MainIntroScreen(
      {super.key,
      required this.firstScreen,
      required this.secondScreen,
      required this.thirdScreen,
      required this.fourthScreen,
      required this.fiveScreen,
      required this.startButtonChild,
      required this.startIconButton});

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
            builder: (context, value, child) {
              return value
                  ? _firstIntroLogoScreen(widget.firstScreen.child,
                      backgroundColor: widget.firstScreen.backgroundColor)
                  : Container();
            }),
        ValueListenableBuilder(
            valueListenable: showLogoText,
            builder: (context, value, child) {
              return _introTextScreen(
                widget.secondScreen.child,
                context,
              );
            }),
        ValueListenableBuilder(
            valueListenable: showLogoScreen,
            builder: (context, value, child) {
              return _introLogoScreen(widget.thirdScreen.child, context);
            }),
        _startScreen(
          context,
          body: widget.fourthScreen.child,
          iconChild: widget.startIconButton,
          afterChildButton: widget.startButtonChild,
          beforeChildButton: widget.startIconButton,
          backgroundColor: widget.fourthScreen.backgroundColor,
          colorButton: widget.fourthScreen.colorButton,
        )
      ]),
    );
  }
}

_startScreen(
  BuildContext context, {
  Widget? shadowImage,
  double? height,
  double? top,
  Color? backgroundColor = Colors.white,
  Widget? body,
  Widget? afterChildButton,
  Widget? beforeChildButton,
  Widget? iconChild,
  Color? colorButton = Colors.red,
  double? maxWidthButton,
  double? mainWidthButton,
  double? heightButton,
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(horizontal: 60),
}) {
  return ValueListenableBuilder<bool>(
    valueListenable: showWelcomeScreen,
    builder: (context, value, child) => AnimatedPositioned(
      height: value ? height ?? MediaQuery.of(context).size.height : 100,
      width: MediaQuery.of(context).size.width,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 2),
      top: value ? 0 : top ?? MediaQuery.of(context).size.height,
      child: Container(
        color: backgroundColor,
        padding: padding,
        child: Stack(children: [
          Positioned.fill(child: shadowImage ?? Container()),
          Positioned.fill(
              bottom: 0,
              child: Column(children: [
                Expanded(child: body ?? Container()),
                ValueListenableBuilder<bool>(
                    valueListenable: showButtonWelcomeScreen,
                    builder: (context, value, child) => InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              decoration: BoxDecoration(
                                color: colorButton,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              constraints: BoxConstraints(
                                  minWidth: value ? 200 : 60,
                                  maxWidth: value ? 300 : 80,
                                  minHeight: 42,
                                  maxHeight: 54),
                              child: Center(
                                  child: !value
                                      ? beforeChildButton
                                      : afterChildButton)),
                        ))
              ]))
        ]),
      ),
    ),
  );
}
