import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<OverlayEntry> closeableOverlays = [];

/// Removes all the overlays on the scene.
closeOverlays() {
  closeableOverlays.forEach((overlay) => overlay.remove());
  closeableOverlays.clear();
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

  OverlayEntry buildOverlay(BuildContext context, {@required Widget child, Offset offset = Offset.zero}) {
    RenderBox renderBox = context.findRenderObject();
    Offset position = renderBox.localToGlobal(Offset.zero);

    final overlay = OverlayEntry(builder: (builder) => _buildPositioned(position, offset, child));
    closeableOverlays.add(overlay);
    return overlay;
  }
}

/// A widget that closes active [closeableOverlays] when tapped.
class OverlaysCloser extends StatelessWidget {

  final Widget child;

  const OverlaysCloser({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeOverlays,
      child: Container(
        color: Colors.transparent, // Required to register the input
        child: child,
      ),
    );
  }
}
