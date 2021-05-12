import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/ui/utils/gradients.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;
  final double height;
  final Color textColor;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key key,
    this.text,
    this.icon,
    this.width,
    this.height,
    this.textColor = AppColors.primary_button_text,
    this.onPressed,
  }) : super(key: key);

  _buildText() => Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1,
          fontSize: UIConstants.primary_button_font_size,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.transparent,
      elevation: 0,
      child: Ink(
        decoration: BoxDecoration(
          gradient: Gradients.buttonGradient,
          borderRadius: BorderRadius.circular(UIConstants.primary_button_border_radius),
        ),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: UIConstants.primary_button_horizontal_padding),
          child: FittedBox(
            child: icon == null
                ? Center(child: _buildText())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon, color: textColor),
                      SizedBox(width: UIConstants.primary_button_icon_text_spacing),
                      _buildText(),
                      SizedBox(width: UIConstants.primary_button_icon_text_spacing * 2),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
