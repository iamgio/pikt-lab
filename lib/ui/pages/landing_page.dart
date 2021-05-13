import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/lang.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/model/recent_project.dart';
import 'package:piktlab/ui/pages/page.dart';
import 'package:piktlab/ui/utils/gradients.dart';
import 'package:piktlab/ui/widgets/primary_button.dart';
import 'package:piktlab/ui/widgets/recent_projects_panel.dart';
import 'package:piktlab/ui/widgets/side_button.dart';
import 'package:piktlab/ui/window.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  _buildPrimaryButton(MediaQueryData mediaQuery) => PrimaryButton(
        text: lang['landing.newscript'],
        width: mediaQuery.size.width / UIConstants.landing_primary_button_width_factor,
        height: mediaQuery.size.width / UIConstants.landing_primary_button_height_factor,
        icon: CupertinoIcons.add,
        onPressed: () {},
      );

  _buildSideButtons() => Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(right: UIConstants.side_button_padding_right),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Window.titleBarHeight),
              SideButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
              SideButton(
                icon: SvgPicture.asset("images/github.svg"),
                scaleFactor: UIConstants.side_button_secondary_scale_factor,
                onPressed: () {},
              )
            ],
          ),
        ),
      );

  _buildOpenButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lang['landing.or'],
            style: TextStyle(
              fontSize: UIConstants.landing_open_font_size,
              color: AppColors.landing_open.withOpacity(UIConstants.landing_or_opacity),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              lang['landing.open'],
              style: TextStyle(fontSize: UIConstants.landing_open_font_size, color: AppColors.landing_open, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 2),
          Icon(Icons.folder_rounded, color: AppColors.landing_open, size: UIConstants.landing_open_icon_size),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return new UIPage(
      decoration: BoxDecoration(
        gradient: Gradients.landingBgGradient,
      ),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "images/logo_light.svg",
                  width: mediaQuery.size.width / UIConstants.landing_logo_size_factor,
                ),
                SizedBox(height: mediaQuery.size.height / UIConstants.landing_vertical_spacing_factor),
                _buildPrimaryButton(mediaQuery),
                SizedBox(height: 16),
                _buildOpenButton(),
              ],
            ),
          ),
          _buildSideButtons(),
          RecentProjectsPanel(
            projects: [RecentProject(name: "Fibonacci", subtitle: "2 hours ago"), RecentProject(name: "Prime numbers", subtitle: "3 hours ago")],
          ),
        ],
      ),
    );
  }
}
