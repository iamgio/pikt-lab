import 'dart:io';

import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';
import 'package:piktlab/constants/ui_constants.dart';
import 'package:piktlab/pikt/pikt_image.dart';
import 'package:piktlab/ui/pages/page.dart';
import 'package:piktlab/ui/utils/gradients.dart';
import 'package:piktlab/ui/utils/overlay.dart';
import 'package:piktlab/ui/widgets/pikt_image_preview.dart';
import 'package:piktlab/ui/widgets/toolbar/toolbar.dart';

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UIPage(
      decoration: BoxDecoration(
        gradient: Gradients.workspaceBgGradient,
      ),
      titleBarColor: AppColors.workspace_primary,
      titleBarPaddingBottom: UIConstants.workspace_title_bar_padding_bottom,
      child: GestureDetector(
        onTap: closeOverlays,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Toolbar(),
            SizedBox(width: UIConstants.canvas_spacing_left),
            FutureBuilder(
              future: PiktImage.read(File('D:\\Coding\\Java Projects\\testing\\pikt2_test\\primes_standardecompacted.png')),
              builder: (context, snapshot) {
                return snapshot.hasData ? PiktImagePreview(image: snapshot.data) : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
