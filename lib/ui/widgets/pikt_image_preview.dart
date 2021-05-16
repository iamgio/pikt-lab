import 'package:flutter/material.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_image.dart';
import 'package:piktlab/pikt/pixel.dart';
import 'package:piktlab/ui/utils/scroll_listener.dart';

class PiktImagePreview extends StatefulWidget {
  final PiktImage image;
  final bool showGrid;

  const PiktImagePreview({Key key, this.image, this.showGrid = false}) : super(key: key);

  @override
  _PiktImagePreviewState createState() => _PiktImagePreviewState();
}

class _PiktImagePreviewState extends State<PiktImagePreview> {

  FocusNode _focus = FocusNode();
  ScrollController _scrollController = ScrollController();

  bool _isCtrlDown = false;
  double _scale = 1.0;

  _buildGrid() => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.image.width,
          (x) => Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.image.height,
              (y) => PixelPreview(
                pixel: widget.image.pixels[y * widget.image.width + x],
                scale: _scale,
                showGrid: widget.showGrid,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      onKey: (key) => _isCtrlDown = key.isControlPressed,
      focusNode: _focus,
      autofocus: true,
      child: ScrollListener(
        onScroll: (event) {
          if(_isCtrlDown) {
            setState(() {
              _scale += -event.scrollDelta.dy / UIConstants.canvas_zoom_factor;
            });
          } else {
            _scrollController.jumpTo(_scrollController.position.pixels + event.scrollDelta.dy * _scale);
          }
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: NeverScrollableScrollPhysics(),
          child: _buildGrid(),
        ),
      ),
    );
  }
}

class PixelPreview extends StatelessWidget {
  final Pixel pixel;
  final double scale;
  final bool showGrid;

  const PixelPreview({Key key, this.pixel, this.scale, this.showGrid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIConstants.canvas_pixel_size * scale,
      height: UIConstants.canvas_pixel_size * scale,
      decoration: BoxDecoration(
        color: pixel.color,
        border: showGrid ? Border.all(color: Colors.black, width: 1) : Border.fromBorderSide(BorderSide.none),
      ),
    );
  }
}
