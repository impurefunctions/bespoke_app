import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils.dart';
import '../colors.dart';

class CustomListTileTheme {
  CustomListTileTheme._();

  //Light Custom Expansion Title Theme Data
  static ListTileThemeData lightListTileTheme = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(chomiCardRadius),
      side: BorderSide(width: 1.w, color: kChomiGrey),
    ),
    iconColor: kChomiLightIconColor,
    textColor: Colors.black,
  );

  //Dark Custom Expansion Title Theme Data
  static ListTileThemeData darkExpansionTileTheme = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(chomiCardRadius),
      side: BorderSide(width: 1.w, color: kChomiGrey),
    ),
    iconColor: Colors.white,
    textColor: Colors.white,
  );
}
