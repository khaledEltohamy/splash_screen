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
  final Widget startScreenBody;
  final Widget startButtonChild;
  final Widget startIconButton;

  const MainIntroScreen(
      {super.key,
      required this.firstScreen,
      required this.secondScreen,
      required this.thirdScreen,
      required this.fourthScreen,
      required this.fiveScreen,
      required this.startScreenBody,
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
        thridTime: widget.thirdScreen.duration.inSeconds,
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
                  ? _firstIntroLogoScreen(widget.firstScreen.child)
                  : Container();
            }),
        ValueListenableBuilder(
            valueListenable: showLogoText,
            builder: (context, value, child) {
              return _introTextScreen(widget.secondScreen.child, context);
            }),
        ValueListenableBuilder(
            valueListenable: showLogoScreen,
            builder: (context, value, child) {
              return _introLogoScreen(widget.thirdScreen.child, context);
            }),
        _startScreen(context,
            body: widget.fourthScreen.child,
            iconChild: widget.startIconButton,
            childButton: widget.startButtonChild)
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
  Widget? childButton,
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
      height: showWelcomeScreen.value
          ? height ?? MediaQuery.of(context).size.height
          : 100,
      width: MediaQuery.of(context).size.width,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 2),
      top: showWelcomeScreen.value
          ? 0
          : top ?? MediaQuery.of(context).size.height,
      child: Container(
        color: backgroundColor,
        padding: padding,
        child: Stack(children: [
          Positioned.fill(child: shadowImage ?? Container()),
          Positioned.fill(
            child: body ?? Container(),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ValueListenableBuilder<bool>(
                valueListenable: showButtonWelcomeScreen,
                builder: (context, value, child) => InkWell(
                  onTap: () {},
                  child: AnimatedContainer(
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      duration: const Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        color: colorButton,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: BoxConstraints(
                          minWidth: 60,
                          maxWidth: showButtonWelcomeScreen.value
                              ? maxWidthButton ?? 300
                              : mainWidthButton ?? 100,
                          minHeight: 42,
                          maxHeight: heightButton ?? 54),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            childButton ?? Container(),
                            Container(
                              width: 100,
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 4),
                                      blurRadius: 2,
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              child: iconChild,
                            ),
                          ],
                        ),
                      )),
                ),
              ))
        ]),
      ),
    ),
  );
}
