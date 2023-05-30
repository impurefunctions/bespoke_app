import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/theme/theme.dart';

class HomeAppBarWidget extends StatelessWidget {
  final bool canGoBack;
  const HomeAppBarWidget({Key? key, required this.title, required this.canGoBack})
      : super(key: key);

  //will take the Navigator function to go back a page
  //final Widget page;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
   //   backgroundColor: ((context).isDarkMode)?Colors.black: Colors.white,
      //removing the automatically adding back button feature
      automaticallyImplyLeading: canGoBack,
      centerTitle: true,
      //removing default padding space
      titleSpacing: 0,
      //setting the height of the appbar
      toolbarHeight: 100.h,

      title: Container(
        margin: EdgeInsets.only(
          left: 20.w,
          right: 15.w,
          top: 25.h,
          bottom: 25.h,
        ),
        child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //User Name
            Expanded(
              child: Text(
                title,
               style: headingFont,

              ),
            ),
            //white space to make the title centered
           // const Spacer(),
          ],
        ),
      ),
    );
  }
}
