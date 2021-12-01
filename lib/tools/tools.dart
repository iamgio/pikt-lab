import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';

// Tool

/// Current tool.
Tool _currentTool = Freehand();

/// Current tool
Tool get currentTool => _currentTool;

/// Sets current tool and calls the listeners.
set currentTool(value) {
  _currentTool = value;
  _toolListeners.forEach((listener) => listener(value));
}

/// List of observers of the current tool.
List<ValueChanged<Tool>> _toolListeners = [];

/// Adds a listener to the current tool.
void addToolListener(ValueChanged<Tool> listener) {
  _toolListeners.add(listener);
}

// Color

/// Current tool.
Color _currentColor = AppColors.color_picker_default;

/// Current tool
Color get currentColor => _currentColor;

/// Sets current tool and calls the listeners.
set currentColor(value) {
  _currentColor = value;
  _colorListeners.forEach((listener) => listener(value));
}

/// List of observers of the current tool.
List<ValueChanged<Color>> _colorListeners = [];

/// Adds a listener to the current tool.
void addColorListener(ValueChanged<Color> listener) {
  _colorListeners.add(listener);
}

abstract class Tool extends ChangeNotifier {
  bool _isActive = false;
  bool get isActive => _isActive;

  set isActive(value) {
    _isActive = value;
    notifyListeners();
  }

  String? get svgName;

  void onToggle() {}
}

class Freehand extends Tool {
  @override
  String? get svgName => null;
}

class Pencil extends Tool {

  static final Pencil _singleton = Pencil._();
  Pencil._();

  factory Pencil() {
    return _singleton;
  }

  @override
  String get svgName => 'pencil';
}

class Eraser extends Tool {
  @override
  String get svgName => 'eraser';
}

class Picker extends Tool {
  @override
  String get svgName => 'color_picker';
}

class Stringify extends Tool {
  @override
  String get svgName => 'string';
}

class Resize extends Tool {
  @override
  String get svgName => 'resize';
}

class Grid extends Tool {

  static final Grid _singleton = Grid._();
  Grid._();

  factory Grid() {
    return _singleton;
  }

  @override
  String get svgName => 'grid';
}