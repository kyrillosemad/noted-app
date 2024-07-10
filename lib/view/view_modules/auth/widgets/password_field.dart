import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 10.h,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.length < 4) {
            return 'must be greater than 4 letters';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          label: Text(
            "password",
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}