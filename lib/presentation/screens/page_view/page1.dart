import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
              child:
                  LottieBuilder.asset("assets/Animation - 1713109877728.json"),
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
                      "Save Notes",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        "You can easily store your notes and access them and edit them easily",
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
