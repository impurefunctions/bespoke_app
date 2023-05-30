
import 'package:bespoke_app/sale/index.dart';
import 'package:bespoke_app/transactions/index.dart';
import 'package:bespoke_app/utils/theme/font_styles.dart';
import 'package:bespoke_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MainScreen extends StatelessWidget {
  final String token;
  const MainScreen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const HomeAppBarWidget(
          title: 'Home',
          canGoBack: false,
        ),
      ),
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 40.h),
          //CARD 1
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaleScreen(token: token),
                ),
              );
            },
            child: Card(
              color: const Color(0xff6200ED),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.h),
              ),
              elevation: 5,
              child: SizedBox(
                width: double.infinity,
                height: 100.h,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0.w,
                      top: 0.h,
                      child: Container(
                        width: 80.w,
                        height: 80.h,
                        margin: EdgeInsets.only(top: 10.h, right: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff340477),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10.w),
                          width: 40.w,
                          height: 40.h,
                          child: SvgPicture.asset(
                            'assets/icons/sale.svg',
                            height: 28.h,
                            width: 28.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.w,
                      top: 32.h,
                      child: Text(
                        "Pay",
                        style: smallTitleFont.copyWith(
                          color: Colors.white,
                        )
                      ),
                    ),
                    Positioned(
                      left: 20.w,
                      top: 64.h,
                      child: Text(
                        "Pay a fee",
                        style: smallBodyFont.copyWith(
                          color: Colors.white,
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 40.h),
          //CARD 2
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  TransactionsScreen(token: token),
                ),
              );
            },
            child: Card(
              color: const Color(0xff1AACF1),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.h),
              ),
              elevation: 5,
              child: SizedBox(
                width: double.infinity,
                height: 100.h,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0.w,
                      top: 0.h,
                      child: Container(
                        width: 80.w,
                        height: 80.h,
                        margin: EdgeInsets.only(top: 10.h, right: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff046695),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10.w),
                          width: 40.w,
                          height: 40.h,
                          child: SvgPicture.asset(
                            'assets/icons/transactions.svg',
                            height: 28.h,
                            width: 28.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.w,
                      top: 32.h,
                      child: Text(
                        "View Past Transactions",
                        style: smallTitleFont.copyWith(
                          color: Colors.white,
                        )
                      ),
                    ),
                    Positioned(
                      left: 20.w,
                      top: 64.h,
                      child: Text(
                        "View all performed transactions",
                        style: smallBodyFont.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
