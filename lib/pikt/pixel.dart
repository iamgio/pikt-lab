import 'package:flutter/material.dart';
import 'package:piktlab/pikt/color_scheme.dart';

class Pixel {

  final int x, y;
  Color color;

  Pixel(this.x, this.y, this.color);

  @override
  String toString() => 'Pixel[$x, $y, #${color.hex}]';
}