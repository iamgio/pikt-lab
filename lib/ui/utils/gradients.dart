import 'package:flutter/cupertino.dart';
import 'package:piktlab/constants/app_colors.dart';

/// Common gradients used.
class Gradients {
  Gradients._();

  static LinearGradient get bgGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.BG_GRADIENT_1,
          AppColors.BG_GRADIENT_2,
          AppColors.BG_GRADIENT_3,
        ],
        stops: [0, .6, 1],
      );

  static LinearGradient get buttonGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.PRIMARY_BUTTON_GRADIENT_1,
          AppColors.PRIMARY_BUTTON_GRADIENT_2
        ],
      );
}
