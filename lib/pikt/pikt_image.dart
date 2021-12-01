import 'dart:io';

import 'package:flutter/material.dart' show Color;
import 'package:image/image.dart' hide Color;
import 'package:piktlab/pikt/pixel.dart';

/// The source image of a [PiktProject].
class PiktImage extends Object {

  final File file;

  int? width;
  int? height;
  List<Pixel>? pixels;

  PiktImage(this.file);

  /// Reads and updates image info.
  Future read() async {
    final image = decodeImage(await file.readAsBytes())!;
    final List<Pixel> pixels = [];

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        pixels.add(Pixel(x, y, Color(_abgrToArgb(image.data[y * image.width + x]))));
      }
    }

    width = image.width;
    height = image.height;
    this.pixels = pixels;
  }

  /// Saves the image to [file].
  Future save() async {
    final image = Image(width!, height!);

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = pixels![y * width! + x];
        image.setPixelRgba(x, y, pixel.color.red, pixel.color.green, pixel.color.blue);
      }
    }
    await file.writeAsBytes(encodePng(image));
  }

  int _abgrToArgb(int abgrColor) {
    int r = (abgrColor >> 16) & 0xFF;
    int b = abgrColor & 0xFF;
    return (abgrColor & 0xFF00FF00) | (b << 16) | r;
  }
}