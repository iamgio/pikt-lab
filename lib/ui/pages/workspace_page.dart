import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/ui/pages/page.dart';
import 'package:piktlab/ui/utils/gradients.dart';
import 'package:piktlab/ui/widgets/toolbar.dart';

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UIPage(
      decoration: BoxDecoration(
        gradient: Gradients.workspaceBgGradient,
      ),
      titleBarColor: AppColors.workspace_primary,
      titleBarPaddingBottom: UIConstants.workspace_title_bar_padding_bottom,
      child: Stack(
        children: [
          Toolbar()
        ],
      ),
    );
  }
}
