import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/view/view_modules/auth/screens/login.dart';
import 'package:todo/view/view_modules/page_view/screens/page1.dart';
import 'package:todo/view/view_modules/page_view/screens/page2.dart';
import 'package:todo/view/view_modules/page_view/screens/page3.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

// ignore: camel_case_types
class _IntroductionState extends State<Introduction> {
  // ignore: non_constant_identifier_names
  PageController page_con = PageController();
  // ignore: non_constant_identifier_names
  bool last_page = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: page_con,
            onPageChanged: (value) {
              if (value == 2) {
                setState(() {
                  last_page = true;
                });
              } else {
                setState(() {
                  last_page = false;
                });
              }
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
                alignment: const Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    onTap: () {
                      Get.offAll(const Login());
                    },
                  ),
                  SmoothPageIndicator(
                    controller: page_con,
                    count: 3,
                  ),
                  last_page == true
                      ? InkWell(
                          child: Text(
                            "Done",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          onTap: () {
                            Get.offAll(const Login());
                          },
                        )
                      : InkWell(
                          child: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            page_con.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                        ),
                ],
              ))
        ],
      )),
    );
  }
}
