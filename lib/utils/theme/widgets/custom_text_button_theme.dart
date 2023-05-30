import 'package:flutter/material.dart';

import '../../utils.dart';
import '../colors.dart';


class CustomTextButtonTheme {
  CustomTextButtonTheme._();

  //Light Theme Data for Text Button
  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kChomiBlack,
      textStyle: bodyBoldFont,
    ),
  );

  //Dark Theme Data for Text Button
  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kChomiYellow,
      textStyle: bodyBoldFont,
    ),
  );
}
