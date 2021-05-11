import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piktlab/constants/app_colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.BG_GRADIENT_1,
              AppColors.BG_GRADIENT_2,
              AppColors.BG_GRADIENT_3,
            ],
            stops: [0, .6, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              "images/logo_light.svg",
              width: MediaQuery.of(context).size.width / 3,
            ),
          ],
        ),
      ),
    );
  }
}
