import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_project.dart';

/// The tools next to the image.
class Panel extends StatelessWidget {
  final PiktProject project;

  const Panel({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              project.name,
              style: const TextStyle(
                color: AppColors.panel_text,
                fontSize: UIConstants.panel_title_font_size,
                fontWeight: FontWeight.bold,
              ),
            ),
            MaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              color: AppColors.workspace_primary,
              splashColor: AppColors.panel_run.withOpacity(UIConstants.panel_run_highlight_opacity),
              highlightColor: AppColors.panel_run.withOpacity(UIConstants.panel_run_highlight_opacity),
              padding: const EdgeInsets.all(UIConstants.panel_run_padding),
              child: const Icon(Icons.play_arrow, color: AppColors.panel_run),
            ),
          ],
        ),
      ],
    );
  }
}
