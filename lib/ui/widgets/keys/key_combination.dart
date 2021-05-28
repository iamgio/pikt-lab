import 'package:flutter/material.dart' show RawKeyEvent;
import 'package:piktlab/pikt/pikt_project.dart';

/// Workspace key combinations.
final List<KeyCombination> keyCombinations = [
  SaveCombination(),
];

abstract class KeyCombination {
  /// Whether [event] matches this combination.
  bool matches(RawKeyEvent event);
  /// The task to be executed with an additional [project] argument.
  void onPress(RawKeyEvent event, PiktProject project);
}

class SaveCombination extends KeyCombination {
  @override
  bool matches(RawKeyEvent event) => event.logicalKey.keyLabel == 's' && event.isControlPressed;

  @override
  void onPress(RawKeyEvent event, PiktProject project) {
    project.image.save().then((value) => print('Saved ${project.name}'));
  }
}