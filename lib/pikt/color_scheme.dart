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

  /// Flutter [Color] to hexadecimal string.
  String get hex {
    final hex = value.toRadixString(16).toUpperCase();
    return hex.length > 2 ? hex.substring(2) : '000000';
  }

  /// Flutter [Color] from hexadecimal [hex].
  static Color fromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.tryParse(buffer.toString(), radix: 16) ?? 0);
  }
}