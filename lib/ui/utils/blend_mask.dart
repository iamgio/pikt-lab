import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// https://stackoverflow.com/questions/64720306/flutter-blend-mask-multiple-widgets-under-another-widget-in-a-stack

/// Applies a BlendMode to its child.
class BlendMask extends SingleChildRenderObjectWidget {
  final BlendMode _blendMode;
  final double _opacity;

  BlendMask({
    required BlendMode blendMode,
    double opacity = 1.0,
    Key? key,
    Widget? child,
  })  : _blendMode = blendMode,
        _opacity = opacity,
        super(key: key, child: child);

  @override
  RenderObject createRenderObject(context) {
    return _RenderBlendMask(_blendMode, _opacity);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderBlendMask renderObject) {
    renderObject._blendMode = _blendMode;
    renderObject._opacity = _opacity;
  }
}

class _RenderBlendMask extends RenderProxyBox {
  BlendMode _blendMode;
  double _opacity;

  _RenderBlendMask(BlendMode blendMode, double opacity)
      : _blendMode = blendMode,
        _opacity = opacity;

  @override
  void paint(context, offset) {
    // Create a new layer and specify the blend mode and opacity to composite it with:
    context.canvas.saveLayer(
      offset & size,
      Paint()
        ..blendMode = _blendMode
        ..color = Color.fromARGB((_opacity * 255).round(), 255, 255, 255),
    );

    super.paint(context, offset);

    // Composite the layer back into the canvas using the blendmode:
    context.canvas.restore();
  }
}
