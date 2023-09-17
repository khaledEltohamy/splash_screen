import 'package:flutter/material.dart';
import 'package:multiple_splash_screens/multiple_splash_screens.dart';
import 'package:multiple_splash_screens/splash_model.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainIntroScreen(
        useRockScreen: true,
        rockColors: [Colors.blue.shade900, Colors.blue.shade600, Colors.blue],
        waveColors: const [
          Color(0xFFFFA27D),
          Color.fromARGB(255, 240, 102, 47),
          Color.fromARGB(255, 88, 36, 15),
        ],
        // first phase your application
        firstScreen: SplashModel(
            directionAnimation: DirectionAnimation.VERTICAL,
            duration: const Duration(seconds: 2),
            child: const Center(child: FlutterLogo())),
        // Middle screen to set name your application
        secondScreen: SplashModel(
            duration: const Duration(seconds: 3),
            directionAnimation: DirectionAnimation.VERTICAL,
            child: const Text("Application name",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 28),
                textAlign: TextAlign.center)),
        // Middle screen to set Application Logo
        thirdScreen: SplashModel(
            duration: const Duration(seconds: 4), child: const FlutterLogo()),
        // started screen your application
        fourthScreen: SplashModel(
            backgroundColor: Colors.grey.shade200,
            colorButton: Colors.white,
            duration: const Duration(seconds: 6),
            child: const Center(child: FlutterLogo())),
        // this is Intro started screen
        fiveScreen: SplashModel(
            duration: const Duration(seconds: 8), child: Container()),
        // button started
        startButtonChild: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: const Text("GET STARTED", textAlign: TextAlign.start)),

        startIconButton:
            const Center(child: Icon(Icons.forward, color: Colors.blue)),
      ),
    );
  }
}
