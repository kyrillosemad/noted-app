import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/main.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.sp, left: 15.sp, right: 15.sp),
      width: 100.w,
      height: 10.h,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
            width: 39.w,
            child: Text(
              "hi, ${id!.getString("username")}",
              style: TextStyle(fontSize: 20.sp),
              overflow: TextOverflow.ellipsis,
            )),
        SizedBox(
          width: 25.w,
        ),
        Text(
          "Noted",
          style: TextStyle(fontSize: 25.sp, fontFamily: "Caveat"),
        )
      ]),
    );
  }
}
