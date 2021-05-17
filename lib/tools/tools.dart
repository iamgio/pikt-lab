import 'package:flutter/material.dart';
import 'package:piktlab/constants/app_colors.dart';

// Tool

/// Current tool.
Tool _tool = Freehand();

/// Current tool
Tool get tool => _tool;

/// Sets current tool and calls the listeners.
set tool(value) {
  _tool = value;
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
  
  void onToggle() {}
}

class Freehand extends Tool {}

class Pencil extends Tool {

  static final Pencil _singleton = Pencil._();
  Pencil._();

  factory Pencil() {
    return _singleton;
  }
}

class Eraser extends Tool {}

class Picker extends Tool {}

class Stringify extends Tool {}

class Resize extends Tool {}

class Grid extends Tool {

  static final Grid _singleton = Grid._();
  Grid._();

  factory Grid() {
    return _singleton;
  }

  @override
  void onToggle() {}
}