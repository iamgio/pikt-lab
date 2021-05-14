import 'package:flutter/cupertino.dart';

/// Current tool.
Tool _tool = Tool.none;

/// List of observers of the current tool.
List<ValueChanged<Tool>> _listeners = [];

/// Adds a listener to the current tool.
void addToolListener(ValueChanged<Tool> listener) {
  _listeners.add(listener);
}

/// Current tool
Tool get tool => _tool;

/// Sets current tool and calls the listeners.
set tool(value) {
  _tool = value;
  _listeners.forEach((listener) => listener(value));
}

enum Tool {
  none, pencil, eraser, picker, string, resize, grid
}