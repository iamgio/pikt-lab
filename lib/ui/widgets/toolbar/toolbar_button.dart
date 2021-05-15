import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/tools/tools.dart';
import 'package:piktlab/ui/utils/overlay.dart';

class ToolbarButton extends StatefulWidget {
  final Tool tool;
  final bool isIndependentSelection;
  final Widget icon;
  final ValueChanged<bool> onSelected;

  const ToolbarButton({Key key, this.tool, this.isIndependentSelection = false, this.icon, this.onSelected}) : super(key: key);

  ToolbarButton.svg({this.tool, this.isIndependentSelection = false, String icon, this.onSelected}) :
        icon = SvgPicture.asset('images/toolbar/$icon.svg', color: AppColors.toolbar_icon, width: UIConstants.toolbar_icon_size);

  @override
  _ToolbarButtonState createState() => _ToolbarButtonState();
}

class _ToolbarButtonState extends State<ToolbarButton> {
  bool _isSelected = false;

  @override
  void initState() {
    // Register tool listener
    if(!widget.isIndependentSelection) {
      addToolListener((tool) {
        if ((_isSelected && tool != widget.tool) || (!_isSelected && tool == widget.tool)) {
          setState(() {
            _isSelected = tool == widget.tool;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = UIConstants.toolbar_icon_size + UIConstants.toolbar_icon_padding * 2;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: size,
        maxHeight: size,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_isSelected)
            Center(
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: AppColors.workspace_primary,
                  borderRadius: BorderRadius.circular(360),
                ),
              ),
            ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                _isSelected ^= true;
                if(!widget.isIndependentSelection) tool = _isSelected ? widget.tool : Tool.none;
                widget.onSelected?.call(_isSelected);
                closeOverlays();
              });
            },
            padding: EdgeInsets.all(UIConstants.toolbar_icon_padding),
            shape: CircleBorder(),
            hoverColor: AppColors.toolbar_icon.withOpacity(UIConstants.toolbar_icon_hover_opacity),
            child: widget.icon,
          ),
        ],
      ),
    );
  }
}
