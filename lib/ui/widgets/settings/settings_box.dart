import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:piktlab/pikt/pikt_settings.dart';
import 'package:piktlab/ui/utils/overlay.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class SettingsBox extends StatefulWidget {
  final PiktSettings settings;

  const SettingsBox({Key? key, required this.settings}) : super(key: key);

  @override
  _SettingsBoxState createState() => _SettingsBoxState();
}

class _SettingsBoxState extends State<SettingsBox> with AnimationMixin {

  Animation<double>? _blur;
  Animation<double>? _size;

  @override
  void initState() {
    controller.curve(Curves.easeInOut);
    _blur = 0.0.tweenTo(15.0).animatedBy(controller);
    _size = 0.0.tweenTo(100.0).animatedBy(controller);
    controller.play(duration: Duration(milliseconds: 80));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: OverlaysCloser(
        controller: controller,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _blur!.value, sigmaY: _blur!.value),
          child: Center(
            child: Container(
              width: _size!.value,
              height: _size!.value,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
