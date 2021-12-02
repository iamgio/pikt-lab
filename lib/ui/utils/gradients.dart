import 'package:flutter/cupertino.dart';
import 'package:piktlab/constants/app_colors.dart';

/// Common gradients used.
class Gradients {
  Gradients._();

  static LinearGradient get landingBgGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.landing_bg_gradient_1,
          AppColors.landing_bg_gradient_2,
          AppColors.landing_bg_gradient_3,
        ],
        stops: [0, .6, 1],
      );

  static LinearGradient get workspaceBgGradient => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.workspace_bg_gradient_1,
      AppColors.workspace_bg_gradient_2,
      //AppColors.workspace_bg_gradient_3,
    ],
    stops: [0, 1],
  );

  static LinearGradient get primaryButtonGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary_button_gradient_1,
          AppColors.primary_button_gradient_2
        ],
      );
}
