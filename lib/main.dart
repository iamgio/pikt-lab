import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Window(
          child: LandingPage(),
        )
      ),
    );
  }
}
