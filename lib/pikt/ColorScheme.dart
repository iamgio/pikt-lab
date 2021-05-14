import 'dart:io';

import 'package:flutter/material.dart';
import 'package:props/props.dart';

/// Represents a Pikt .properties color scheme.
class ColorScheme {

  final Properties _properties;

  ColorScheme.read(String path) :
        _properties = Properties.loadString(File(path).readAsStringSync());

  String operator [](String key) => _properties[key];

  Color getColor(String key) => HexColor.fromHex(this[key]);
  List<String> get keys => _properties.keys;
  String getKeyByValue(value) => keys.firstWhere((element) => this[element] == value);
}

extension HexColor on Color {
  /// Flutter [Color] from hexadecimal [hex].
  static Color fromHex(String hex) => Color(int.parse('0xFF$hex'));
}