import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({Key key}) : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {

  Color _color = AppColors.color_picker_default;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: UIConstants.toolbar_color_picker_radius,
        height: UIConstants.toolbar_color_picker_radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _color,
          border: Border.all(color: AppColors.toolbar_color_picker_border, width: UIConstants.toolbar_color_picker_border_width)
        ),
      ),
      onPressed: () {},
    );
  }
}
