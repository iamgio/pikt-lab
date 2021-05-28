import 'dart:math';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_image.dart';
import 'package:piktlab/pikt/pikt_project.dart';
import 'package:piktlab/tools/tools.dart';
import 'package:piktlab/ui/pages/workspace_page.dart';
import 'package:piktlab/ui/utils/scroll_listener.dart';
import 'package:piktlab/ui/widgets/keys/key_combination.dart';
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
  double _scale;


  @override
  void initState() {
    _setInitialScale();

    // Grid listener
    final grid = Grid();
    grid.addListener(() {
      if(mounted) {
        setState(() {
          _showGrid = grid.isActive;
        });
      }
    });

    super.initState();
  }

  _setInitialScale() {
    // Set scale based on height.
    _scale = (WorkspacePage.availableHeight / _image.height / UIConstants.canvas_pixel_size).roundToDouble();

    // Set scale based on width if it exceeds window width divided by max_autosizize_width_factor.
    if(_scale * _image.width * UIConstants.canvas_pixel_size >= appWindow.size.width / UIConstants.canvas_max_autosize_width_factor) {
      _scale = appWindow.size.width / UIConstants.canvas_max_autosize_width_factor / _image.width / UIConstants.canvas_pixel_size;
    }
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
                project: widget.project,
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
        if(_scale < UIConstants.canvas_min_scale) _scale = UIConstants.canvas_min_scale;
      });
    } else {
      _scrollTo(event.scrollDelta.dy * _scale);
    }
  }

  _scrollTo(double position) {
    position += _scrollController.offset;
    _scrollController.jumpTo(position < 0 ? 0 : min(position, _scrollController.position.maxScrollExtent));
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      onKey: (key) {
        _isCtrlDown = key.isControlPressed;
        if(key is RawKeyDownEvent) {
          keyCombinations.forEach((combination) {
            if (combination.matches(key)) combination.onPress(key, widget.project);
          });
        }
      },
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
