import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/lang.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/ui/pages/workspace_page.dart';
import 'package:piktlab/ui/window.dart';

void main() {
  runApp(PiktLabApp());
  Window.init(); // Custom window
}

class PiktLabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: lang['title'],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.landing_bg_gradient_1,
        fontFamily: UIConstants.font_family,
      ),
      home: WorkspacePage(),
    );
  }
}
