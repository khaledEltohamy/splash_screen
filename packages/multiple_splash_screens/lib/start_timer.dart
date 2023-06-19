part of multiple_splash_screens;

Future<void> startTimer({
  required int firstTime,
  required int secondsTime,
  required int thridTime,
  required int fourthTime,
  required int fiveTime,
}) async {
  Timer.periodic(const Duration(seconds: 2), (timer) {
    if (timer.tick == firstTime) {
      showShadowLogoScreen.value = false;
    }
    if (timer.tick == secondsTime) {
      showLogoText.value = true;
    }
    if (timer.tick == thridTime) {
      showLogoScreen.value = true;
    }
    if (timer.tick == fourthTime) {
      showWelcomeScreen.value = true;
    }
    if (timer.tick == fiveTime) {
      showButtonWelcomeScreen.value = true;
      timer.cancel();
    }
  });
}
