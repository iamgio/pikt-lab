import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_project.dart';
import 'package:piktlab/pikt/pixel.dart';
import 'package:piktlab/tools/tools.dart';

class PixelPreview extends StatefulWidget {
  final PiktProject project;
  final Pixel pixel;
  final double scale;
  final bool showGrid;

  const PixelPreview({Key key, this.project, this.pixel, this.scale, this.showGrid}) : super(key: key);

  @override
  _PixelPreviewState createState() => _PixelPreviewState();
}

class _PixelPreviewState extends State<PixelPreview> {
  Color _color;

  @override
  void initState() {
    _color = widget.pixel.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (tool.runtimeType) {
          case Pencil:
            setState(() {
              _color = currentColor;
            });
            break;
          case Eraser:
            setState(() {
              _color = Colors.white; // todo whitespace from scheme
            });
            break;
          case Picker:
            currentColor = _color;
            break;
        }
      },
      child: Container(
        width: UIConstants.canvas_pixel_size * widget.scale,
        height: UIConstants.canvas_pixel_size * widget.scale,
        decoration: BoxDecoration(
          color: _color,
          border: widget.showGrid ? Border.all(color: AppColors.grid, width: widget.scale / UIConstants.canvas_grid_factor) : Border.fromBorderSide(BorderSide.none),
        ),
      ),
    );
  }
}
