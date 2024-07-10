import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class PageViewBody extends StatelessWidget {
  final String lottie;
  final String title;
  final String desc;

  const PageViewBody(
      {super.key,
      required this.desc,
      required this.lottie,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Column(
        children: [
          SizedBox(
            width: 100.w,
            height: 50.h,
            child: Center(
              child: LottieBuilder.asset(lottie, height: 30.h),
            ),
          ),
          SizedBox(
            width: 100.w,
            height: 35.h,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      height: 6.h,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      height: 10.h,
                      child: Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
