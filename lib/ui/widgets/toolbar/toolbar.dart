import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/tools/tools.dart';
import 'package:piktlab/ui/widgets/toolbar/color_picker.dart';
import 'package:piktlab/ui/widgets/toolbar/toolbar_button.dart';

/// The column on the left of the workspace that contains image-based tools.
class Toolbar extends StatefulWidget {
  const Toolbar({Key key}) : super(key: key);

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {

  _buildButtonSpacer()  => SizedBox(height: UIConstants.toolbar_buttons_spacing);
  _buildSectionSpacer() => SizedBox(height: UIConstants.toolbar_sections_spacing);

  List<Widget> _buildButtons() {
    return [
      ToolbarButton.svg(tool: Tool.pencil, icon: 'pencil'),
      _buildButtonSpacer(),
      SizedBox(height: 5),
      ToolbarColorPicker(),
      SizedBox(height: 5),
      _buildButtonSpacer(),
      ToolbarButton.svg(tool: Tool.eraser, icon: 'eraser'),
      _buildButtonSpacer(),
      ToolbarButton.svg(tool: Tool.picker, icon: 'color_picker'),
      _buildSectionSpacer(),
      ToolbarButton.svg(tool: Tool.string, icon: 'string'),
      _buildSectionSpacer(),
      ToolbarButton.svg(tool: Tool.resize, icon: 'resize'),
      _buildButtonSpacer(),
      ToolbarButton.svg(tool: Tool.grid, isIndependentSelection: true, icon: 'grid'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIConstants.toolbar_width,
      color: AppColors.workspace_toolbar,
      child: ListView(
        children: [
          SizedBox(height: UIConstants.toolbar_margin_top),
          ..._buildButtons(),
        ],
      ),
    );
  }
}
