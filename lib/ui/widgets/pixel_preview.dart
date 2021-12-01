import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_project.dart';
import 'package:piktlab/pikt/pixel.dart';
import 'package:piktlab/tools/tools.dart';
import 'package:piktlab/ui/utils/overlay.dart';

class PixelPreview extends StatefulWidget {
  final PiktProject project;
  final Pixel pixel;
  final double scale;
  final bool showGrid;

  const PixelPreview({
    Key? key,
    required this.project,
    required this.pixel,
    required this.scale,
    required this.showGrid,
  }) : super(key: key);

  @override
  _PixelPreviewState createState() => _PixelPreviewState();
}

class _PixelPreviewState extends State<PixelPreview> {
  Color? _color;

  @override
  void initState() {
    _color = widget.pixel.color;
    super.initState();
  }

  _setColor(Color color) {
    widget.pixel.color = color;
    setState(() {
      _color = color;
    });
  }

  _handleChanges(Tool tool) {
    closeOverlays(context);
    switch (tool.runtimeType) {
      case Pencil:
        _setColor(currentColor);
        break;
      case Eraser:
        _setColor(Colors.white); // todo whitespace from scheme
        break;
      case Picker:
        currentColor = _color;
        currentTool = Pencil();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleChanges(currentTool),
      onSecondaryTap: () => _handleChanges(currentTool is Eraser ? Pencil() : Eraser()),
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
