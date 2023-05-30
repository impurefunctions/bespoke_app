import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils.dart';
import '../colors.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  //Light Custom Elevated Theme button Data
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      shape: const StadiumBorder(),
      side: BorderSide(
        color: kChomiWhite,
        width: 1.w,
      ),
      backgroundColor: const Color(0xFF6200ED),
      foregroundColor: kChomiWhite,
      elevation: 3,
      textStyle: buttonFont,
    ),
  );

  //Dark Custom Elevated Theme button Data
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      side: BorderSide(
        color: kChomiWhite,
        width: 1.w,
      ),
      backgroundColor: kChomiDarkButtonBackground,
      foregroundColor: kChomiWhite,
      elevation: 3,
      textStyle: buttonFont,
    ),
  );
}
