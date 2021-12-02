import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/tools/tools.dart';
import 'package:piktlab/ui/widgets/toolbar/color_picker.dart';
import 'package:piktlab/ui/widgets/toolbar/toolbar_button.dart';

/// The column on the left of the workspace that contains image-based tools.
class Toolbar extends StatefulWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {

  _buildButtonSpacer()  => const SizedBox(height: UIConstants.toolbar_buttons_spacing);
  _buildSectionSpacer() => const SizedBox(height: UIConstants.toolbar_sections_spacing);

  List<Widget> _buildButtons() {
    return [
      ToolbarButton.tool(tool: Pencil()),
      _buildButtonSpacer(),
      const SizedBox(height: 5),
      const ToolbarColorPicker(),
      const SizedBox(height: 5),
      _buildButtonSpacer(),
      ToolbarButton.tool(tool: Eraser()),
      _buildButtonSpacer(),
      ToolbarButton.tool(tool: Picker()),
      _buildSectionSpacer(),
      ToolbarButton.tool(tool: Stringify()),
      _buildSectionSpacer(),
      ToolbarButton.tool(tool: Resize()),
      _buildButtonSpacer(),
      ToolbarButton.tool(tool: Grid(), isIndependentSelection: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIConstants.toolbar_width,
      color: AppColors.workspace_toolbar,
      child: ListView(
        children: [
          const SizedBox(height: UIConstants.toolbar_margin_top),
          ..._buildButtons(),
        ],
      ),
    );
  }
}
