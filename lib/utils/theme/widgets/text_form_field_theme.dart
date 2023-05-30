import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils.dart';
import '../colors.dart';


class TextFormFieldTheme {
  TextFormFieldTheme._();

  //Light Theme Data for TextFormField
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: kChomiLightGrey,
    //Text styles
    labelStyle: inputFont.apply(color: Colors.black),
    floatingLabelStyle: inputFont.apply(color: Colors.black),
    hintStyle: inputFont.apply(color: Colors.black),
    counterStyle: inputFont.apply(color: Colors.black),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(chomiTFFBorderRadius.r),
      borderSide: BorderSide(
        width: 1.w,
        color: kChomiWhite,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(chomiTFFBorderRadius.r),
      borderSide: BorderSide(
        width: 1.w,
        color: kChomiGrey,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(chomiTFFBorderRadius.r),
      borderSide: BorderSide(
        width: 1.w,
        color: Colors.red,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 18.h),
    floatingLabelAlignment: FloatingLabelAlignment.center,
  );

  //Dark Theme Data for TextFormField
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    //Text styles

    labelStyle: inputFont.apply(color: Colors.white),
    floatingLabelStyle: inputFont.apply(color: Colors.white),
    hintStyle: inputFont.apply(color: Colors.white),
    counterStyle: inputFont.apply(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(chomiTFFBorderRadius.r),
      borderSide: BorderSide(
        width: 1.w,
        color: kChomiDarkOutline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(chomiTFFBorderRadius.r),
      borderSide: BorderSide(
        width: 1.w,
        color: kChomiWhite,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(chomiTFFBorderRadius.r),
      borderSide: BorderSide(
        width: 1.w,
        color: kChomiRed,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 18.h),
    floatingLabelAlignment: FloatingLabelAlignment.center,
  );
}
