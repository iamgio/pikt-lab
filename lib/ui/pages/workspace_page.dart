
import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_project.dart';
import 'package:piktlab/ui/pages/page.dart';
import 'package:piktlab/ui/utils/gradients.dart';
import 'package:piktlab/ui/utils/overlay.dart';
import 'package:piktlab/ui/widgets/panel/panel.dart';
import 'package:piktlab/ui/widgets/pikt_image_preview.dart';
import 'package:piktlab/ui/widgets/toolbar/toolbar.dart';

class WorkspacePage extends StatelessWidget {
  final PiktProject project;

  const WorkspacePage({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UIPage(
      decoration: BoxDecoration(
        gradient: Gradients.workspaceBgGradient,
      ),
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
              Center(
                child: FutureBuilder(
                  future: project.image.read(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.done ? PiktImagePreview(project: project) : Container();
                  },
                ),
              ),
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
}
