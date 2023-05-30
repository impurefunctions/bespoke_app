import 'package:flutter/material.dart';

extension DynamicScreenData on BuildContext {
  Brightness get brightness => MediaQuery.of(this).platformBrightness;
  bool get isDarkMode => brightness == Brightness.dark;
}
