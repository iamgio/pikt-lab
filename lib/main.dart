import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:piktlab/lang.dart';
import 'package:piktlab/ui/pages/landing_page.dart';
import 'package:piktlab/ui/window_title_bar.dart';

void main() {
  runApp(PiktLabApp());
  WindowTitleBar.init();
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
        body: Stack(
          children: [
            LandingPage(),
            WindowBorder(
              color: Colors.transparent,
              child: WindowTitleBar(),
            ),
          ],
        ),
      ),
    );
  }
}
