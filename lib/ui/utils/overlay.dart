import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<OverlayEntry> closeableOverlays = [];

/// Removes all the overlays on the scene.
closeOverlays(BuildContext context) {
  closeableOverlays.forEach((overlay) => overlay.remove());
  closeableOverlays.clear();
  if (context != null) FocusScope.of(context).requestFocus();
}

/// Utility class that builds an [OverlayEntry] and registers it, so that when the user clicks outside its child, the overlay gets removed.
class CloseableOverlay {
  _buildPositioned(Offset position, Offset offset, Widget child) {
    return Positioned(
      left: position.dx + offset.dx,
      top: position.dy + offset.dy,
      child: child,
    );
  }

  OverlayEntry buildOverlay(BuildContext context, {@required Widget child, Offset offset = Offset.zero, bool isAbsolute = false}) {
    Offset position = isAbsolute ? Offset.zero : (context.findRenderObject() as RenderBox).localToGlobal(Offset.zero);
    final overlay = OverlayEntry(builder: (builder) => _buildPositioned(position, offset, child));
    closeableOverlays.add(overlay);
    return overlay;
  }
}

/// A widget that closes active [closeableOverlays] when tapped.
class OverlaysCloser extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final AnimationController controller;

  const OverlaysCloser({Key key, this.child, this.onTap, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(controller == null) {
          closeOverlays(context);
        } else {
          controller.reverse();
          controller.addStatusListener((status) {
            if(status == AnimationStatus.dismissed) closeOverlays(context);
          });
        }
        if(onTap != null) onTap();
      },
      child: Container(
        color: Colors.transparent, // Required to register the input
        child: GestureDetector(
          onTap: () {}, // Does not close the overlay when the click is on the widget itself
          child: child,
        ),
      ),
    );
  }
}
