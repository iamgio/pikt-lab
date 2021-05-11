import 'package:flutter/material.dart';
import 'package:piktlab/ui/window.dart';

/// A scaffold with a custom window frame.
class UIPage extends StatelessWidget {

  final Widget child;
  final BoxDecoration decoration;

  const UIPage({Key key, this.child, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: decoration),
          WindowFrame(
            child: child,
          ),
        ],
      ),
    );
  }
}
