import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollListener extends StatelessWidget {
  final void Function(PointerScrollEvent event) onScroll;
  final Widget child;

  const ScrollListener({Key key, @required this.onScroll, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) onScroll(pointerSignal);
      },
      child: child,
    );
  }
}
