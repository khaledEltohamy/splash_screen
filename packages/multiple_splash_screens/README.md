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



https://github.com/khaledEltohamy/splash_screen/assets/107731665/84f9e727-599d-4282-b0e2-c445646c8744



## Features



## Getting started


## Usage



```dart


 class Example extends StatelessWidget {
   const Example({super.key});

   @override
   Widget build(BuildContext context) {
     return MainIntroScreen(
       startScreenBody: Text("startScreenBody"),
       startButtonChild: Text("startButtonChild"),
       startIconButton: Text("startIconButton"),
       firstScreen: SplashModel(
        duration: const Duration(seconds: 2),
        child: Text("firstIntroChildta")),
       fiveScreen: SplashModel(
        duration: const Duration(seconds: 4), child: Text("introTextChild")),
    fourthScreen: SplashModel(
        duration: const Duration(seconds: 6), child: Text("introLogoChild")),
    secondScreen: SplashModel(
        duration: const Duration(seconds: 8), child: Text("startScreenBody")),
    thirdScreen: SplashModel(
        duration: const Duration(seconds: 10),
        child: Text("startIconButton")),
  );
  }
 }

```

## Additional information


