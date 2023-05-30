import 'package:flutter/material.dart';

import '../font_styles.dart';


class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  static TextTheme lightTextStyle =
      TextTheme(subtitle1: inputFont.copyWith(color: Colors.black));
  static TextTheme darkTextStyle =
      TextTheme(subtitle1: inputFont.copyWith(color: Colors.white));
  //static TextTheme darkTextStyle = inputFont.apply(color: Colors.white);
}
