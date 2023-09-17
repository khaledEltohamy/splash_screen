part of multiple_splash_screens;

_introLogoScreen(
  Widget child,
  BuildContext context, {
  double? right,
  double? left,
  double? top,
  double? height,
}) {
  top ??= MediaQuery.of(context).size.height * 0.3;
  return AnimatedPositioned(
    height: showLogoScreen.value ? height ?? 100 : 0,
    top: showLogoScreen.value ? top : 0,
    right: right ?? 40,
    left: left ?? 40,
    duration: const Duration(seconds: 1),
    child: showLogoScreen.value ? child : Container(),
  );
}

_introTextScreen(
  Widget child,
  BuildContext context, {
  double? right = 40,
  required DirectionAnimation direction,
  double? left = 40,
  double? bottom = 90,
  double? width,
  double? top,
  double? height,
}) {
  bool value = showLogoText.value;
  bottom ??= MediaQuery.of(context).size.height * 0.4;
  top ??= MediaQuery.of(context).size.height * 0.5;
  right ??= MediaQuery.of(context).size.width * 0.5;
  left ??= MediaQuery.of(context).size.width * 0.5;
  width ??= MediaQuery.of(context).size.width * 0.8;
  height ??= MediaQuery.of(context).size.height * 0.4;
  switch (direction) {
    case DirectionAnimation.HORIZONTAL:
      {
        return AnimatedPositioned(
          width: value ? width : 0,
          right: value ? right : 0,
          bottom: value ? bottom : 0,
          top: value ? top : 0,
          duration: const Duration(seconds: 1),
          child: child,
        );
      }
    case DirectionAnimation.VERTICAL:
      {
        return AnimatedPositioned(
          height: value ? height : 0,
          bottom: value ? bottom : 0,
          right: value ? right : 0,
          left: value ? left : 0,
          duration: const Duration(seconds: 1),
          child: child,
        );
      }
    default:
  }
}

enum DirectionAnimation { HORIZONTAL, VERTICAL }
