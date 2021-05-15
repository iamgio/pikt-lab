import 'package:flutter/material.dart';
import 'package:piktlab/pikt/pikt_image.dart';
import 'package:piktlab/pikt/pixel.dart';

class PiktImagePreview extends StatefulWidget {
  final PiktImage image;
  final double scale;
  final bool showGrid;

  const PiktImagePreview({Key key, this.image, this.scale = 1.0, this.showGrid = false}) : super(key: key);

  @override
  _PiktImagePreviewState createState() => _PiktImagePreviewState();
}

class _PiktImagePreviewState extends State<PiktImagePreview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.image.width,
          (x) => Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.image.height,
              (y) => PixelPreview(
                pixel: widget.image.pixels[y * widget.image.width + x],
                scale: widget.scale,
                showGrid: widget.showGrid,
              ),
            ),
          ),
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
      width: 10 * scale,
      height: 10 * scale,
      decoration: BoxDecoration(
        color: pixel.color,
        border: showGrid ? Border.all(color: Colors.black, width: 1) : Border.fromBorderSide(BorderSide.none),
      ),
    );
  }
}
