// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view%20model/bloc/links_bloc/links_bloc.dart';

class LinkItem extends StatelessWidget {
  final link;
  const LinkItem({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.sp),
      padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 57, 88),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              "${link.title}",
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: 3.h),
          SizedBox(
            width: 100.w,
            child: Text(
              "${link.body}",
              maxLines: 7,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            width: 100.w,
            child: Center(
              child: Text(
                "${link.link}",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color.fromRGBO(1, 203, 145, 1),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: IconButton(
              onPressed: () {
                // Show delete confirmation dialog
                Get.defaultDialog(
                  title: "delete!",
                  content: const Text("Are you sure to delete this link?"),
                  confirmTextColor: Colors.white,
                  onCancel: () {},
                  onConfirm: () {
                    LinksBloc().add(DeleteLinks(link.linkId.toString()));
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 33.sp,
              ),
            ),
          ),
        ],
      ),
    ).animate().fade(delay: 200.ms, duration: 200.ms);
  }
}
