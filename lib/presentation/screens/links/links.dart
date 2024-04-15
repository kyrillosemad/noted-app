import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/links/delete_link_fun.dart';
import 'package:todo/data/links/read_link_fun.dart';
import 'package:todo/main.dart';
import 'package:todo/presentation/screens/links/insert_link.dart';
import 'package:todo/presentation/screens/links/link_datails.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Links extends StatefulWidget {
  const Links({super.key});

  @override
  State<Links> createState() => _LinksState();
}

class _LinksState extends State<Links> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 30.sp, left: 15.sp, right: 15.sp),
            width: 100.w,
            height: 10.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: EdgeInsets.all(7.sp),
                width: 100.w,
                height: 81.h,
                child: FutureBuilder(
                  future: read_links_fun(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                            ),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () {
                                    Get.to(const LinkDetails(), arguments: {
                                      "title": snapshot.data[index]['title'],
                                      "body": snapshot.data[index]['body'],
                                      "link_id": snapshot.data[index]
                                          ['link_id'],
                                      "link": snapshot.data[index]['link'],
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3.sp),
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 0, 57, 88),
                                        borderRadius:
                                            BorderRadius.circular(10.sp)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 4.5.h,
                                          child: Text(
                                            "${snapshot.data[index]['title']}",
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22.sp,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        SizedBox(
                                          height: 21.h,
                                          width: 100.w,
                                          child: Text(
                                            "${snapshot.data[index]['body']}",
                                            maxLines: 7,
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                          width: 100.w,
                                          child: Center(
                                            child: Text(
                                              "${snapshot.data[index]['link']}",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: const Color.fromRGBO(
                                                      1, 203, 145, 1),
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.sp),
                                          child: IconButton(
                                              onPressed: () {
                                                Get.defaultDialog(
                                                  title: "delete!",
                                                  content: const Text(
                                                      "are you sure to delete this link"),
                                                  confirmTextColor:
                                                      Colors.white,
                                                  onCancel: () {},
                                                  onConfirm: () {
                                                    delete_links_fun(
                                                        snapshot.data[index]
                                                            ['link_id']);
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 30.sp,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                      .animate()
                                      .fade(delay: 200.ms, duration: 200.ms));
                            },
                          )
                        : Center(
                            child: Text(
                              "There is no links yet",
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.sp),
                child: GestureDetector(
                    child: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(1, 203, 145, 1),
                  radius: 22.sp,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 0, 57, 88),
                    ),
                    onPressed: () {
                      Get.to(const InsertLink());
                    },
                  ),
                )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
