part of multiple_splash_screens;

class WaveScreen extends StatefulWidget {
  final List<Color> colors;
  WaveScreen({super.key, required this.colors});

  @override
  State<WaveScreen> createState() => _WaveScreenState();
}

class _WaveScreenState extends State<WaveScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;
  int maxDuration = 7;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: maxDuration))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isPlaying = false;
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: CustomPaint(
              painter: LiquidPainter(_controller.value * maxDuration,
                  maxDuration.toDouble(), widget.colors),
            ),
          );
        });
  }
}

/// A custom painter that creates a liquid-like animation using a sine wave.
class LiquidPainter extends CustomPainter {
  final double value;
  final double maxValue;
  final List<Color> colors;

  /// Creates a [LiquidPainter] with the given [value] and [maxValue].
  LiquidPainter(this.value, this.maxValue, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    double diameter = max(size.height, size.width);
    double diameterDefault = min(size.height, size.width);
    double diameterHeight = max(size.height, size.width);
    double radius = diameter / 2;

    // Defining coordinate points. The wave starts from the bottom and ends at the top as the value changes.
    double pointX = 0;
    double pointY2 =
        diameterHeight - ((diameterHeight + 10) * (value / maxValue));

    double pointY = diameter -
        ((diameter + 10) *
            (value /
                maxValue)); // 10 is an extra offset added to fill the circle completely

    Path path = Path();
    path.moveTo(pointX, pointY);

    // Amplitude: the height of the sine wave
    double amplitude = 10;

    // Period: the time taken to complete one full cycle of the sine wave.
    // f = 1/p, the more the value of the period, the higher the frequency.
    double period = value / maxValue;

    // Phase Shift: the horizontal shift of the sine wave along the x-axis.
    double phaseShift = value * pi;

    // Plotting the sine wave by connecting various paths till it reaches the diameter.
    // Using this formula: y = A * sin(ωt + φ) + C
    for (double i = 0; i <= diameter; i++) {
      path.lineTo(
        i + pointX,
        pointY + amplitude * sin((i * 2 * period * pi / diameter) + phaseShift),
      );
    }

    // Plotting a vertical line which connects the right end of the sine wave.
    path.lineTo(pointX + diameter, diameter);
    // Plotting a vertical line which connects the left end of the sine wave.
    path.lineTo(pointX, diameter);
    // Closing the path.
    path.close();

    Paint paint = Paint()
      ..shader = SweepGradient(
          colors: colors,
          startAngle: pi / 2,
          endAngle: 5 * pi / 2,
          tileMode: TileMode.clamp,
          stops: const [
            0.25,
            0.35,
            0.5,
          ]).createShader(
          Rect.fromCircle(center: Offset(diameter, diameter), radius: radius))
      ..style = PaintingStyle.fill;

    // Clipping rectangular-shaped path to Oval.
    // Path circleClip = Path()
    //   ..addOval(Rect.fromCenter(
    //       center: Offset(radius, radius), width: diameter, height: diameter));
    // canvas.clipPath(circleClip, doAntiAlias: true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LiquidHalfToHalfPainter extends CustomPainter {
  final double value;
  final double maxValue;
  final List<Color> colors;

  /// Creates a [LiquidPainter] with the given [value] and [maxValue].
  LiquidHalfToHalfPainter(this.value, this.maxValue, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    double diameter = min(size.height, size.width);
    double diameterHeight = max(size.height, size.width);
    double radius = diameter / 2;

    // Defining coordinate points. The wave starts from the bottom and ends at the top as the value changes.
    double pointX = 0;
    double pointY2 =
        diameterHeight - ((diameterHeight + 10) * (value / maxValue));
// 10 is an extra offset added to fill the circle completely

    Path path = Path();
    path.moveTo(pointX, pointY2);

    // Amplitude: the height of the sine wave
    double amplitude = 10;

    // Period: the time taken to complete one full cycle of the sine wave.
    // f = 1/p, the more the value of the period, the higher the frequency.
    double period = value / maxValue;

    // Phase Shift: the horizontal shift of the sine wave along the x-axis.
    double phaseShift = value * pi;

    // Plotting the sine wave by connecting various paths till it reaches the diameter.
    // Using this formula: y = A * sin(ωt + φ) + C
    for (double i = 0; i <= diameter; i++) {
      path.lineTo(
        i + pointX,
        pointY2 +
            amplitude * sin((i * 2 * period * pi / diameter) + phaseShift),
      );
    }

    // Plotting a vertical line which connects the right end of the sine wave.
    path.lineTo(pointX + diameter, diameter);
    // Plotting a vertical line which connects the left end of the sine wave.
    path.lineTo(pointX, diameter);
    // Closing the path.
    path.close();

    Paint paint = Paint()
      ..shader = SweepGradient(
          colors: colors,
          startAngle: pi / 2,
          endAngle: 5 * pi / 2,
          tileMode: TileMode.clamp,
          stops: const [
            0.25,
            0.35,
            0.5,
          ]).createShader(
          Rect.fromCircle(center: Offset(diameter, diameter), radius: radius))
      ..style = PaintingStyle.fill;

    // Clipping rectangular-shaped path to Oval.
    // Path circleClip = Path()
    //   ..addOval(Rect.fromCenter(
    //       center: Offset(radius, radius), width: diameter, height: diameter));
    // canvas.clipPath(circleClip, doAntiAlias: true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LiquidHalfPainter extends CustomPainter {
  final double value;
  final double maxValue;
  final List<Color> colors;

  /// Creates a [LiquidPainter] with the given [value] and [maxValue].
  LiquidHalfPainter(this.value, this.maxValue, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    double diameter = min(size.height, size.width);

    double radius = diameter / 2;

    // Defining coordinate points. The wave starts from the bottom and ends at the top as the value changes.
    double pointX = 0;

    double pointY = diameter -
        ((diameter + 10) *
            (value /
                maxValue)); // 10 is an extra offset added to fill the circle completely

    Path path = Path();
    path.moveTo(pointX, pointY);

    // Amplitude: the height of the sine wave
    double amplitude = 10;

    // Period: the time taken to complete one full cycle of the sine wave.
    // f = 1/p, the more the value of the period, the higher the frequency.
    double period = value / maxValue;

    // Phase Shift: the horizontal shift of the sine wave along the x-axis.
    double phaseShift = value * pi;

    // Plotting the sine wave by connecting various paths till it reaches the diameter.
    // Using this formula: y = A * sin(ωt + φ) + C
    for (double i = 0; i <= diameter; i++) {
      path.lineTo(
        i + pointX,
        pointY + amplitude * sin((i * 2 * period * pi / diameter) + phaseShift),
      );
    }

    // Plotting a vertical line which connects the right end of the sine wave.
    path.lineTo(pointX + diameter, diameter);
    // Plotting a vertical line which connects the left end of the sine wave.
    path.lineTo(pointX, diameter);
    // Closing the path.
    path.close();

    Paint paint = Paint()
      ..shader = SweepGradient(
          colors: colors,
          startAngle: pi / 2,
          endAngle: 5 * pi / 2,
          tileMode: TileMode.clamp,
          stops: const [
            0.25,
            0.35,
            0.5,
          ]).createShader(
          Rect.fromCircle(center: Offset(diameter, diameter), radius: radius))
      ..style = PaintingStyle.fill;

    // Clipping rectangular-shaped path to Oval.
    // Path circleClip = Path()
    //   ..addOval(Rect.fromCenter(
    //       center: Offset(radius, radius), width: diameter, height: diameter));
    // canvas.clipPath(circleClip, doAntiAlias: true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
