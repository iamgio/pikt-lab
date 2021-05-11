import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/lang.dart';

// https://pub.dev/packages/bitsdojo_window

class Window extends StatelessWidget {

  final Widget child;

  Window({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        WindowBorder(
          color: Colors.transparent,
          child: _WindowTitleBar(),
        ),
      ],
    );
  }

  /// Sets custom window via bitsdojo_window
  static void init() {
    doWhenWindowReady(() {
      appWindow.title = lang['title'];
      appWindow.size = Size(700, 500);
      appWindow.minSize = appWindow.size;
      appWindow.alignment = Alignment.center;
      appWindow.maximize();
      appWindow.show();
    });
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
    iconNormal: AppColors.TITLE_BAR_BUTTON.withOpacity(.8),
    iconMouseDown: AppColors.TITLE_BAR_BUTTON,
    mouseOver: AppColors.TITLE_BAR_BUTTON.withOpacity(.2),
    mouseDown: AppColors.TITLE_BAR_BUTTON.withOpacity(.35),
  );

  final _closeButtonColors = WindowButtonColors(
    iconNormal: AppColors.TITLE_BAR_BUTTON.withOpacity(.8),
    iconMouseOver: AppColors.TITLE_BAR_BUTTON,
    mouseOver: AppColors.TITLE_BAR_CLOSE_OVER,
    mouseDown: AppColors.TITLE_BAR_CLOSE_PRESSED,
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
