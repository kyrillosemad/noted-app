import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 90.w,
        height: 10.h,
        child: TextFormField(
          style: TextStyle(fontSize: 12.sp),
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
            "username",
            style: TextStyle(fontSize: 12.sp),
          )),
        ));
  }
}
