import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/model/recent_project.dart';

class RecentProjectButton extends StatelessWidget {
  final RecentProject project;

  const RecentProjectButton({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final component = Padding(
      padding: EdgeInsets.symmetric(
        vertical: mediaQuery.size.width /
            (UIConstants.recent_projects_spacing *
                UIConstants.recent_projects_font_size_factor),
        horizontal: UIConstants.recent_projects_padding - 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            project.name,
            style: TextStyle(
              color: AppColors.landing_recent_projects_text,
              fontSize: mediaQuery.size.width /
                  (UIConstants.recent_projects_title_font_size *
                      UIConstants.recent_projects_font_size_factor),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            project.subtitle,
            style: TextStyle(
              color: AppColors.landing_recent_projects_text.withOpacity(UIConstants.recent_projects_subtitle_opacity),
              fontSize: UIConstants.recent_projects_subtitle_font_size,
            ),
          ),
        ],
      ),
    );

    return MaterialButton(
      child: component,
      elevation: 0,
      highlightColor: AppColors.landing_recent_projects_hover_bg.withOpacity(UIConstants.recent_projects_clicked_opacity),
      hoverColor: AppColors.landing_recent_projects_hover_bg.withOpacity(UIConstants.recent_projects_hover_opacity),
      splashColor: AppColors.landing_recent_projects_hover_bg.withOpacity(UIConstants.recent_projects_hover_opacity),
      onPressed: () {},
    );
  }
}
