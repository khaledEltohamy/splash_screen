<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->



## Features



## Getting started


## Usage



```dart


class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainIntroScreen(
        // first phase your application
        firstScreen: SplashModel(
            duration: const Duration(seconds: 2),
            child: const Center(child: FlutterLogo())),
        // Middle screen to set name your application
        secondScreen: SplashModel(
            duration: const Duration(seconds: 3),
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


```

## Additional information


