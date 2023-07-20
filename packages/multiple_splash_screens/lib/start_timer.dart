part of multiple_splash_screens;

Future<void> startTimer({
  required int firstTime,
  required int secondsTime,
  required int thirdTime,
  required int fourthTime,
  required int fiveTime,
}) async {
  Timer.periodic(const Duration(seconds: 2), (timer) {
    if (timer.tick == firstTime) {
      print("firstTime ${timer.tick}");
      showShadowLogoScreen.value = false;
    }

    if (timer.tick == secondsTime) {
      print("secondsTime ${timer.tick}");
      showLogoText.value = true;
    }
    if (timer.tick == thirdTime) {
      print("thirdTime ${timer.tick}");
      showLogoScreen.value = true;
    }
    if (timer.tick == fourthTime) {
      print("fourthTime ${timer.tick}");
      showWelcomeScreen.value = true;
    }
    if (timer.tick == fiveTime) {
      print("fiveTime ${timer.tick}");
      showButtonWelcomeScreen.value = true;
    }
    if (timer.tick == (fiveTime + 2)) {
      print("cancel ${timer.tick}");
      timer.cancel();
    }
  });
}
