import 'package:flutter/material.dart';
import 'package:piktlab/lang.dart';
import 'package:piktlab/ui/pages/landing_page.dart';

void main() {
  runApp(PiktLabApp());
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
        body: LandingPage(),
      ),
    );
  }
}
