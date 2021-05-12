import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/lang.dart';

// https://pub.dev/packages/bitsdojo_window

class Window {
  /// Sets custom window via bitsdojo_window
  static void init() {
    doWhenWindowReady(() {
      appWindow.title = lang['title'];
      appWindow.size = Size(1280, 720);
      appWindow.minSize = Size(768, 432);
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }

  static double get titleBarHeight => appWindow.titleBarHeight;
}

class WindowFrame extends StatelessWidget {

  final Widget child;

  WindowFrame({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WindowBorder(
          color: Colors.transparent,
          child: _WindowTitleBar(),
        ),
        child,
      ],
    );
  }
}

class _WindowTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _LeftSide(),
        _RightSide(),
      ],
    );
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
    iconNormal: AppColors.title_bar_button.withOpacity(.8),
    iconMouseDown: AppColors.title_bar_button,
    mouseOver: AppColors.title_bar_button.withOpacity(.2),
    mouseDown: AppColors.title_bar_button.withOpacity(.35),
  );

  final _closeButtonColors = WindowButtonColors(
    iconNormal: AppColors.title_bar_button.withOpacity(.8),
    iconMouseOver: AppColors.title_bar_button,
    mouseOver: AppColors.title_bar_close_over,
    mouseDown: AppColors.title_bar_close_pressed,
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
