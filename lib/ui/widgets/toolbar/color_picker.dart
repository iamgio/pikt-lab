import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/color_scheme.dart';
import 'package:piktlab/ui/tools/tools.dart';

class ToolbarColorPicker extends StatefulWidget {
  const ToolbarColorPicker({Key key}) : super(key: key);

  @override
  _ToolbarColorPickerState createState() => _ToolbarColorPickerState();
}

class _ToolbarColorPickerState extends State<ToolbarColorPicker> {
  Color _color = currentColor;
  OverlayEntry _pickerOverlay;

  _buildFloatingPickerPopup() {
    RenderBox renderBox = context.findRenderObject();
    Offset offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx + UIConstants.color_picker_offset_x,
          top: offset.dy,
          child: ColorPickerOverlay(
            initialColor: _color,
            onColorChanged: (color) {
              setState(() {
                _color = color;
              });
              currentColor = color;
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        RawMaterialButton(
          fillColor: _color,
          shape: CircleBorder(),
          child: Container(
            width: UIConstants.toolbar_color_picker_size,
            height: UIConstants.toolbar_color_picker_size,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.toolbar_color_picker_border, width: UIConstants.toolbar_color_picker_border_width)),
          ),
          onPressed: () {
            _pickerOverlay = _buildFloatingPickerPopup();
            Overlay.of(context).insert(_pickerOverlay);
          },
        ),
      ],
    );
  }
}

/// Pop-up over the color picker toolbar button.
class ColorPickerOverlay extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color> onColorChanged;

  const ColorPickerOverlay({Key key, this.initialColor, this.onColorChanged}) : super(key: key);

  @override
  _ColorPickerOverlayState createState() => _ColorPickerOverlayState();
}

class _ColorPickerOverlayState extends State<ColorPickerOverlay> {
  HSVColor _color;

  TextEditingController _hexController;
  String _lastValidHex; // Takes _hexController value only if its length is either 6 or 7.

  set color(HSVColor value) {
    _hexController.text = _setColorWithoutTextfieldUpdate(value).hex;
  }

  Color _setColorWithoutTextfieldUpdate(HSVColor value) {
    setState(() {
      _color = value;
    });
    final color = value.toColor();
    widget.onColorChanged(color);
    return color;
  }

  @override
  void initState() {
    _color = HSVColor.fromColor(widget.initialColor);
    _lastValidHex = widget.initialColor.hex;
    _initHexController();
    super.initState();
  }

  _initHexController() {
    _hexController = TextEditingController(text: _color.toColor().hex)
      ..addListener(() {
        if (_hexController.text != _color.toColor().hex) {
          if(_hexController.text.length == 6 || _hexController.text.length == 7) {
            _lastValidHex = _hexController.text;
          }
          _setColorWithoutTextfieldUpdate(HSVColor.fromColor(HexColor.fromHex(_lastValidHex)));
        }
      });
  }

  TextStyle get _textStyle => TextStyle(
        color: AppColors.color_picker_text,
      );

  _buildPickerArea() => Container(
        width: UIConstants.color_picker_area_size,
        height: UIConstants.color_picker_area_size,
        child: ColorPickerArea(
          _color,
          (color) {
            FocusScope.of(context).unfocus();
            this.color = color;
          },
          PaletteType.hsv,
        ),
      );

  _buildSlider() => Container(
    width: UIConstants.color_picker_slider_width,
    height: UIConstants.color_picker_area_size + UIConstants.color_picker_slider_height,
    child: RotatedBox(
      quarterTurns: -1,
      child: ColorPickerSlider(
        TrackType.hue,
        _color,
        (color) {
          FocusScope.of(context).unfocus();
          this.color = color;
        },
        fullThumbColor: true,
        displayThumbColor: true,
      ),
    ),
  );

  _buildHexField() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.color_picker_hex_border_radius),
      borderSide: BorderSide(
        color: AppColors.color_picker_text.withOpacity(UIConstants.color_picker_hex_border_opacity),
        width: UIConstants.color_picker_hex_border_width,
      ),
    );
    return TextField(
      controller: _hexController,
      style: _textStyle.copyWith(fontSize: UIConstants.color_picker_hex_font_size),
      cursorColor: AppColors.color_picker_text,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  _buildRGBPicker() => Row(
        children: [
          _buildPickerArea(),
          _buildSlider(),
          SizedBox(width: UIConstants.color_picker_horizontal_spacing),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    '#  ',
                    style: _textStyle.copyWith(
                      fontSize: UIConstants.color_picker_hex_font_size,
                      color: AppColors.color_picker_text.withOpacity(
                        UIConstants.color_picker_hex_prefix_opacity,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: UIConstants.color_picker_hex_width,
                    child: _buildHexField(),
                  )
                ],
              ),
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(UIConstants.color_picker_radius),
        child: Container(
          height: UIConstants.color_picker_area_size + UIConstants.color_picker_slider_height * 2,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: UIConstants.color_picker_blur, sigmaY: UIConstants.color_picker_blur),
            child: Container(
              padding: EdgeInsets.all(UIConstants.color_picker_padding),
              color: AppColors.color_picker,
              child: _buildRGBPicker(),
            ),
          ),
        ),
      ),
    );
  }
}
