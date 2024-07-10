import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 22.h,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/logo.png")),
      ),
    );
  }
}