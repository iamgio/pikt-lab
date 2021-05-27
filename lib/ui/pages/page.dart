import 'package:flutter/material.dart';
import 'package:piktlab/ui/window.dart';

/// A scaffold with a custom window frame.
class UIPage extends StatelessWidget {
  final Widget child;
  final Widget titleBar;
  final Color titleBarColor;
  final double titleBarPaddingBottom;
  final BoxDecoration decoration;

  const UIPage({Key key, this.child, this.titleBar, this.titleBarColor, this.titleBarPaddingBottom = 0, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final titleBarHeight = Window.titleBarHeight + titleBarPaddingBottom;

    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: decoration),
          if (titleBarColor != null)
            Container(
              height: titleBarHeight,
              color: titleBarColor,
            ),
          WindowFrame(
            child: titleBarColor == null
                ? child
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: titleBarHeight,
                        child: titleBar,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: mediaQuery.size.width,
                          maxHeight: mediaQuery.size.height - titleBarHeight,
                        ),
                        child: child,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
