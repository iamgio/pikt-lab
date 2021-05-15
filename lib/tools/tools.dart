import 'package:flutter/cupertino.dart';
import 'package:piktlab/constants/app_colors.dart';

// Tool

/// Current tool.
Tool _tool = Tool.none;

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

enum Tool {
  none,
  pencil,
  eraser,
  picker,
  string,
  resize,
  grid,
}
