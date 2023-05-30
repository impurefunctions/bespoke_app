import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  //Dark Custom App Bar Theme Data
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    //App bar title Colour
    foregroundColor: kChomiLightTitle,
    backgroundColor: Colors.transparent,
    elevation: 0,

    //changing the device status bar colour and icon colours
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: kChomiLightBackground,
      systemNavigationBarColor: kChomiLightBackground,
      systemNavigationBarDividerColor: kChomiLightBackground,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  //Dark Custom App Bar Theme Data
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    //App bar title Colour
    foregroundColor: Colors.white,
    backgroundColor: Colors.transparent,
    elevation: 0,

    //changing the device status bar colour and icon colours
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: kChomiDarkBackground,
      systemNavigationBarColor: kChomiDarkBackground,
      systemNavigationBarDividerColor: kChomiDarkBackground,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}
