import 'package:bespoke_app/utils/theme/widgets/custom_elevated_button_theme.dart';
import 'package:bespoke_app/utils/theme/widgets/text_form_field_theme.dart';

import 'package:flutter/material.dart';

import '../utils.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(secondary: kChomiYellow),

    brightness: Brightness.light,
    canvasColor: kChomiLightBackground,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: CustomTextButtonTheme.lightTextButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: kChomiLightBackground),
    expansionTileTheme: CustomExpansionTileTheme.lightExpansionTileTheme,
    textTheme: CustomTextFieldTheme.lightTextStyle,
    //this divider color transparent removes the divider Expansion widget has by default
    dividerColor: Colors.transparent,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(secondary: kChomiDarkBackground),

    brightness: Brightness.dark,
    canvasColor: kChomiDarkBackground,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: CustomTextButtonTheme.darkTextButtonTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    expansionTileTheme: CustomExpansionTileTheme.darkExpansionTileTheme,
    textTheme: CustomTextFieldTheme.darkTextStyle,
    //this divider color transparent removes the divider Expansion widget has by default
    dividerColor: Colors.transparent,
  );
}