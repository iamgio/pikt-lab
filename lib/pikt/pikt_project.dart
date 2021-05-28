import 'dart:io';

import 'package:piktlab/pikt/pikt_image.dart';
import 'package:piktlab/pikt/pikt_settings.dart';

class PiktProject {
  final String name;
  final PiktImage image;
  final PiktGlobalSettings globalSettings;
  final PiktProjectSettings projectSettings;

  PiktProject({this.name, File imageFile, this.globalSettings, this.projectSettings}) :
      image = PiktImage(imageFile);

  Future<bool> save() async {
    return await image.save()
        .catchError((error) => false)
        .then((value) => value ?? true); // todo save settings too
  }
}