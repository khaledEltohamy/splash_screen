part of multiple_splash_screens;

class FirstScreen extends StatelessWidget {
  final Widget child;
  final double? right;
  final double? left;
  final double? top;
  final double? bottom;
  final Color? backgroundColor;
  const FirstScreen(
      {super.key,
      required this.child,
      this.right,
      this.left,
      this.top,
      this.bottom,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          ValueListenableBuilder(
              valueListenable: showShadowLogoScreen,
              builder: (context, value, childValue) {
                return value ? _firstIntroLogoScreen(child) : Container();
              }),
        ]),
      ),
    );
  }
}

_firstIntroLogoScreen(Widget child,
    {double? right,
    double? left,
    double? top,
    double? bottom,
    Color? backgroundColor}) {
  return Positioned.fill(
    right: right ?? 0,
    left: left ?? 0,
    top: top ?? 0,
    bottom: bottom ?? 0,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(color: backgroundColor ?? Colors.white),
      child: Opacity(
        opacity: 1,
        child: child,
      ),
    ),
  );
}

_introLogoScreen(
  Widget child,
  BuildContext context, {
  double? right,
  double? left,
  double? top,
  double? height,
}) {
  return AnimatedPositioned(
    height: showLogoScreen.value ? height ?? 100 : 0,
    top: showLogoScreen.value
        ? top ?? MediaQuery.of(context).size.height * 0.3
        : 0,
    right: right ?? 40,
    left: left ?? 40,
    duration: const Duration(seconds: 1),
    child: showLogoScreen.value ? child : Container(),
  );
}

_introTextScreen(
  Widget child,
  BuildContext context, {
  double? right,
  double? left,
  double? bottom,
  double? height,
}) {
  return AnimatedPositioned(
    height: showLogoText.value ? height ?? 90 : 0,
    bottom: showLogoText.value
        ? bottom ?? MediaQuery.of(context).size.height * 0.4
        : 0,
    right: right ?? 40,
    left: left ?? 40,
    duration: const Duration(seconds: 1),
    child: child,
  );
}
