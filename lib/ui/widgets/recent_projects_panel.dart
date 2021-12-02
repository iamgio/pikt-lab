import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/lang.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/model/recent_project.dart';
import 'package:piktlab/ui/widgets/recent_project_button.dart';

class RecentProjectsPanel extends StatelessWidget {
  final List<RecentProject> projects;

  const RecentProjectsPanel({Key? key, required this.projects}) : super(key: key);

  _buildTitle() => Padding(
        padding: const EdgeInsets.only(
            left: UIConstants.recent_projects_padding,
            top: UIConstants.recent_projects_padding),
        child: Text(
          lang['recent_projects']!.toUpperCase(),
          style: const TextStyle(
            fontSize: UIConstants.recent_projects_header_font_size,
            color: AppColors.landing_recent_projects_text,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) return Container();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / UIConstants.recent_projects_width_factor,
      ),
      child: Stack(
        children: [
          Container(
            color: AppColors.landing_recent_projects_bg,
          ),
          ListView(
            children: [
              _buildTitle(),
              const SizedBox(height: UIConstants.primary_button_icon_text_spacing * 3),
              ...List.generate(projects.length,
                  (index) => RecentProjectButton(project: projects[index])),
            ],
          )
        ],
      ),
    );
  }
}
