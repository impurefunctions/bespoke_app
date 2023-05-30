import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../font_styles.dart';


class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();

  //Light Custom Elevated Theme button Data
  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      shape: const StadiumBorder(),
      side: BorderSide(
        color: kChomiDarkGrey,
        width: 1.w,
      ),
      foregroundColor: kChomiBlack,
      elevation: 0,
      textStyle: buttonFont,
    ),
  );

  //Dark Custom Elevated Theme button Data
  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      shape: const StadiumBorder(),
      side: BorderSide(
        color: kChomiWhite,
        width: 1.w,
      ),
      foregroundColor: kChomiWhite,
      elevation: 0,
      textStyle: buttonFont,
    ),
  );
}
