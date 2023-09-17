import 'dart:async';

import 'package:flutter/material.dart';

class RockScreen extends StatefulWidget {
  final List<Color> colors;
  RockScreen({super.key, required this.colors});

  @override
  State<RockScreen> createState() => _RockScreenState();
}

class _RockScreenState extends State<RockScreen> {
  ValueNotifier<bool> first = ValueNotifier(false);
  ValueNotifier<bool> two = ValueNotifier(false);
  ValueNotifier<bool> three = ValueNotifier(false);
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (timer.tick == 1) {
        first.value = true;
      }

      if (timer.tick == 2) {
        two.value = true;
      }
      if (timer.tick == 3) {
        three.value = true;
      }

      if (timer.tick == (3 + 2)) {
        timer.cancel();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: first,
              builder: (BuildContext context, value, Widget? child) =>
                  AnimatedContainer(
                alignment: Alignment.topCenter,
                color: widget.colors[0],
                duration: const Duration(seconds: 2),
                width: 100,
                height: value ? MediaQuery.sizeOf(context).height : 0,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: two,
              builder: (BuildContext context, value, Widget? child) =>
                  AnimatedContainer(
                color: widget.colors[1],
                duration: const Duration(seconds: 2),
                width: 100,
                height: value ? MediaQuery.sizeOf(context).height : 0,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: three,
              builder: (BuildContext context, value, Widget? child) =>
                  AnimatedContainer(
                color: widget.colors[2],
                duration: const Duration(seconds: 2),
                width: 100,
                height: value ? MediaQuery.sizeOf(context).height : 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
