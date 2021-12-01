import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_project.dart';
import 'package:piktlab/ui/pages/page.dart';
import 'package:piktlab/ui/utils/gradients.dart';
import 'package:piktlab/ui/utils/overlay.dart';
import 'package:piktlab/ui/widgets/panel/panel.dart';
import 'package:piktlab/ui/widgets/pikt_image_preview.dart';
import 'package:piktlab/ui/widgets/toolbar/toolbar.dart';
import 'package:piktlab/ui/window.dart';

class WorkspacePage extends StatelessWidget {
  final PiktProject project;

  const WorkspacePage({Key? key, required this.project}) : super(key: key);

  _buildPreview() => Center(
        child: FutureBuilder(
          future: project.image.read(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done ? PiktImagePreview(project: project) : Container();
          },
        ),
      );

  _buildTitleBarIcon({IconData? icon, VoidCallback? onPressed}) => IconButton(
    icon: Icon(icon),
    color: AppColors.workspace_title_bar_icon,
    iconSize: UIConstants.workspace_title_bar_icon_size,
    onPressed: onPressed,
  );

  _buildTitleBarRow() {
    final spacing = UIConstants.workspace_title_bar_icon_spacing;
    return Row(
      children: [
        SizedBox(width: spacing),
        SvgPicture.asset('images/pikt_light.svg', height: Window.titleBarHeight),
        SizedBox(width: spacing + UIConstants.canvas_spacing_left + 5),
        _buildTitleBarIcon(icon: Icons.save, onPressed: () => project.save().then((value) => print(value))),
        SizedBox(width: spacing),
        _buildTitleBarIcon(icon: Icons.folder, onPressed: () {}),
        SizedBox(width: spacing),
        _buildTitleBarIcon(icon: Icons.settings, onPressed: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIPage(
      decoration: BoxDecoration(
        gradient: Gradients.workspaceBgGradient,
      ),
      titleBar: _buildTitleBarRow(),
      titleBarColor: AppColors.workspace_primary,
      titleBarPaddingBottom: UIConstants.workspace_title_bar_padding_bottom,
      child: OverlaysCloser(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Toolbar(),
              SizedBox(width: UIConstants.canvas_spacing_left),
              _buildPreview(),
              Padding(
                padding: EdgeInsets.only(left: UIConstants.panel_padding_left, top: UIConstants.panel_padding_top),
                child: Panel(project: project),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Available height in the workspace.
  static double get availableHeight => appWindow.size.height - Window.titleBarHeight - UIConstants.workspace_title_bar_padding_bottom;
}
