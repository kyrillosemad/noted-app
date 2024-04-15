import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
              child: LottieBuilder.asset(
                  "assets/Animation - 1713111784937.json",
                  height: 30.h),
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
                    Text(
                      "Save Links",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        "You can easily store your link and access them and edit them easily",
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
