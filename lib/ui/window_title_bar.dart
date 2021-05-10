import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/lang.dart';

// https://pub.dev/packages/bitsdojo_window

class WindowTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _LeftSide(),
        _RightSide(),
      ],
    );
  }

  static void init() {
    doWhenWindowReady(() {
      appWindow.title = lang['title'];
      appWindow.size = Size(700, 500);
      appWindow.alignment = Alignment.center;
      appWindow.maximize();
      appWindow.show();
    });
  }
}

class _LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        child: Column(
          children: [
            WindowTitleBarBox(child: MoveWindow()),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}

class _RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [Expanded(child: MoveWindow()), _WindowButtons()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WindowButtons extends StatelessWidget {

  final _buttonColors = WindowButtonColors(
    iconNormal: Colors.white70,
    iconMouseDown: Colors.white,
    mouseOver: Colors.white70.withOpacity(.2),
    mouseDown: Colors.white70.withOpacity(.4),
  );

  final _closeButtonColors = WindowButtonColors(
    iconNormal: Colors.white70,
    iconMouseOver: Colors.white,
    mouseOver: Color(0xFFD32F2F),
    mouseDown: Color(0xFFB71C1C),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: _buttonColors),
        MaximizeWindowButton(colors: _buttonColors),
        CloseWindowButton(colors: _closeButtonColors),
      ],
    );
  }
}
