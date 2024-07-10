// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 10.h,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.length < 10) {
            return 'must be greater than 10 letters';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          label: Text(
            "Email",
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}