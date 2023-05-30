import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils.dart';
import '../colors.dart';
class CustomExpansionTileTheme {
  CustomExpansionTileTheme._();

  //Light Custom Expansion Title Theme Data
  static ExpansionTileThemeData lightExpansionTileTheme =
      ExpansionTileThemeData(
    childrenPadding:
        EdgeInsets.only(left: 17.w, right: 17.w, bottom: 20.h, top: 5.h),
    iconColor: kChomiLightIconColor,
    collapsedIconColor: kChomiLightIconColor,
    textColor: Colors.black,
  );

  //Dark Custom Expansion Title Theme Data
  static ExpansionTileThemeData darkExpansionTileTheme = ExpansionTileThemeData(
    childrenPadding:
        EdgeInsets.only(left: 17.w, right: 17.w, bottom: 20.h, top: 5.h),
    iconColor: Colors.white,
    collapsedIconColor: Colors.white,
    textColor: Colors.white,
  );
}
