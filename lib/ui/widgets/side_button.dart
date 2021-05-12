import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/ui/utils/blend_mask.dart';

class SideButton extends StatefulWidget {
  final Widget icon;
  final double scaleFactor;
  final VoidCallback onPressed;

  const SideButton({Key key, this.icon, this.scaleFactor = 1.0, this.onPressed})
      : super(key: key);

  @override
  _SideButtonState createState() => _SideButtonState();
}

class _SideButtonState extends State<SideButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return BlendMask(
      opacity: _isHover ? 1 : .7,
      blendMode: BlendMode.overlay,
      child: MouseRegion(
        onEnter: (e) {
          setState(() {
            _isHover = true;
          });
        },
        onExit: (e) {
          setState(() {
            _isHover = false;
          });
        },
        child: IconButton(
          iconSize: MediaQuery.of(context).size.width * widget.scaleFactor / 25,
          color: AppColors.LANDING_PAGE_SIDE_BUTTONS,
          onPressed: widget.onPressed,
          icon: widget.icon,
        ),
      ),
    );
  }
}
