part of multiple_splash_screens;

class AlphaScreen extends StatelessWidget {
  final Widget child;
  final double? right;
  final double? left;
  final double? top;
  final double? bottom;
  final Color? backgroundColor;
  const AlphaScreen(this.child,
      {super.key,
      this.right,
      this.left,
      this.top,
      this.bottom,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        ValueListenableBuilder(
            valueListenable: showShadowLogoScreen,
            builder: (context, value, childValue) {
              return value
                  ? Positioned.fill(
                      right: right ?? 0,
                      left: left ?? 0,
                      top: top ?? 0,
                      bottom: bottom ?? 0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: backgroundColor ?? Colors.white),
                        child: child,
                      ),
                    )
                  : Container();
            }),
      ]),
    );
  }
}
