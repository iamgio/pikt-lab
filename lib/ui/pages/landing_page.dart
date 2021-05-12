import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piktlab/constants/lang.dart';
import 'package:piktlab/ui/page.dart';
import 'package:piktlab/ui/utils/gradients.dart';
import 'package:piktlab/ui/widgets/primary_button.dart';
import 'package:piktlab/ui/widgets/side_button.dart';
import 'package:piktlab/ui/window.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  _buildPrimaryButton(MediaQueryData mediaQuery) => PrimaryButton(
        text: lang['landing.newscript'],
        width: mediaQuery.size.width / 4.4,
        height: mediaQuery.size.width / 17,
        icon: CupertinoIcons.add,
        onPressed: () {},
      );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return new UIPage(
      decoration: BoxDecoration(
        gradient: Gradients.bgGradient,
      ),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  "images/logo_light.svg",
                  width: mediaQuery.size.width / 3,
                ),
                SizedBox(height: mediaQuery.size.height / 7),
                _buildPrimaryButton(mediaQuery),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8),
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
                    scaleFactor: .8,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
