import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/lang.dart';
import 'package:piktlab/ui/pages/landing_page.dart';
import 'package:piktlab/ui/window_title_bar.dart';

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
        primaryColor: AppColors.BG_GRADIENT_1,
        fontFamily: 'Karla',
      ),
      home: Scaffold(
        body: Window(
          child: LandingPage(),
        )
      ),
    );
  }
}
