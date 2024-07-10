// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view/shared_widgets/top_title.dart';
import 'package:todo/view/view_modules/links/screens/link_datails.dart';
import 'package:todo/view/view_modules/links/widgets/addlinks_button.dart';
import 'package:todo/view/view_modules/links/widgets/link_container.dart';

class LinksLoadedState extends StatelessWidget {
  final state;
  const LinksLoadedState({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            const TopTitle(),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: EdgeInsets.all(7.sp),
                  width: 100.w,
                  height: 83.h,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: state.links.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Get.to(const LinkDetails(), arguments: {
                              "title": state.links[index].title,
                              "body": state.links[index].body,
                              "link_id": state.links[index].linkId,
                              "link": state.links[index].link,
                            });
                          },
                          child: LinkItem(link: state.links[index]));
                    },
                  ),
                ),
                const AddLinksButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
