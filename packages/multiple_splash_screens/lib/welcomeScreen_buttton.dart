part of multiple_splash_screens;

class WelcomeScreenWithButton extends StatelessWidget {
  final double? height, maxWidthButton, mainWidthButton, heightButton, top;
  final Color? backgroundColor, colorButton;
  final Widget? shadowImage,
      body,
      afterChildButton,
      beforeChildButton,
      iconChild;
  final EdgeInsetsGeometry? padding;
  final Function() onTap;
  const WelcomeScreenWithButton({
    super.key,
    required this.onTap,
    this.shadowImage,
    this.height,
    this.top,
    this.backgroundColor = Colors.white,
    this.body,
    this.afterChildButton,
    this.beforeChildButton,
    this.iconChild,
    this.colorButton = Colors.red,
    this.maxWidthButton,
    this.mainWidthButton,
    this.heightButton,
    this.padding = const EdgeInsets.symmetric(horizontal: 60),
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showWelcomeScreen,
      builder: (context, value, child) => AnimatedPositioned(
        height: value ? height ?? MediaQuery.of(context).size.height : 150,
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
                            onTap: onTap,
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 40),
                                decoration: BoxDecoration(
                                  color: colorButton,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                constraints: BoxConstraints(
                                    minWidth: value ? 200 : 60,
                                    maxWidth: value ? 300 : 80,
                                    minHeight: 32,
                                    maxHeight: 42),
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
}
