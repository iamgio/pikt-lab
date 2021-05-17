import 'dart:io';

import 'package:piktlab/pikt/pikt_image.dart';

class PiktProject {
  final String name;
  final PiktImage image;

  PiktProject({this.name, File imageFile}) :
      image = PiktImage(imageFile);
}