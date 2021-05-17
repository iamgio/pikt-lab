import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_image.dart';
import 'package:piktlab/pikt/pikt_project.dart';
import 'package:piktlab/tools/tools.dart';
import 'package:piktlab/ui/utils/scroll_listener.dart';
import 'package:piktlab/ui/widgets/pixel_preview.dart';

class PiktImagePreview extends StatefulWidget {

  final PiktProject project;

  const PiktImagePreview({Key key, this.project}) : super(key: key);

  @override
  _PiktImagePreviewState createState() => _PiktImagePreviewState();
}

class _PiktImagePreviewState extends State<PiktImagePreview> {

  PiktImage get _image => widget.project.image;

  FocusNode _focus = FocusNode();
  ScrollController _scrollController = ScrollController();

  bool _showGrid = false;
  bool _isCtrlDown = false;
  double _scale = 1.0;


  @override
  void initState() {
    final grid = Grid();
    grid.addListener(() {
      setState(() {
        _showGrid = grid.isActive;
      });
    });
    super.initState();
  }

  _buildGrid() => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          _image.width,
          (x) => Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _image.height,
              (y) => PixelPreview(
                pixel: _image.pixels[y * _image.width + x],
                scale: _scale,
                showGrid: _showGrid,
              ),
            ),
          ),
        ),
      );

  _onScroll(PointerScrollEvent event) {
    if (_isCtrlDown) {
      setState(() {
        _scale += -event.scrollDelta.dy / UIConstants.canvas_zoom_factor;
      });
    } else {
      _scrollTo(event.scrollDelta.dy * _scale);
    }
  }

  _scrollTo(double position) {
    position += _scrollController.offset;
    _scrollController.jumpTo(position < 0 ? 0 : (position > _scrollController.position.maxScrollExtent ? _scrollController.position.maxScrollExtent : position));
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      onKey: (key) => _isCtrlDown = key.isControlPressed,
      focusNode: _focus,
      autofocus: true,
      child: ScrollListener(
        onScroll: _onScroll,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: NeverScrollableScrollPhysics(),
          child: _buildGrid(),
        ),
      ),
    );
  }
}
