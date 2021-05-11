import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
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
    this.textColor = AppColors.PRIMARY_BUTTON_TEXT,
    this.onPressed,
  }) : super(key: key);

  _buildText() => Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1,
          fontSize: 12,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: Gradients.buttonGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: FittedBox(
            child: icon == null
                ? Center(child: _buildText())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon, color: textColor),
                      SizedBox(width: 8),
                      _buildText(),
                      SizedBox(width: 16),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
