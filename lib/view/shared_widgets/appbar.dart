import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sizer/sizer.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool changed;
  final Function onSave;
  final String name;

  const TopAppBar({
    Key? key,
    required this.changed,
    required this.name,
    required this.onSave,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(size: 12.sp, color: Colors.white),
      backgroundColor: const Color.fromARGB(255, 0, 57, 88),
      actions: [
        InkWell(
          onTap: () {
            onSave();
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 2.sp),
            width: 18.w,
            height: 5.h,
            decoration: BoxDecoration(
              color:
                  changed ? const Color.fromRGBO(1, 203, 145, 1) : Colors.grey,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(fontSize: 8.sp),
              ),
            ),
          ),
        )
      ],
      title: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [
          TyperAnimatedText(
            name,
            textStyle: TextStyle(fontSize: 15.sp),
            speed: const Duration(milliseconds: 150),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
