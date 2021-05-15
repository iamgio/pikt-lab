import 'dart:io';

import 'package:flutter/material.dart' show Color;
import 'package:image/image.dart' hide Color;
import 'package:piktlab/pikt/pixel.dart';

class PiktImage {

  final File file;
  final int width;
  final int height;
  final List<Pixel> pixels;

  PiktImage._(this.file, this.width, this.height, this.pixels);

  static Future<PiktImage> read(File file) async {
    final image = decodeImage(await file.readAsBytes());
    final List<Pixel> pixels = [];

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        pixels.add(Pixel(x, y, Color(_abgrToArgb(image.data[y * image.width + x]))));
      }
    }
    return PiktImage._(file, image.width, image.height, pixels);
  }

  static int _abgrToArgb(int abgrColor) {
    int r = (abgrColor >> 16) & 0xFF;
    int b = abgrColor & 0xFF;
    return (abgrColor & 0xFF00FF00) | (b << 16) | r;
  }
}