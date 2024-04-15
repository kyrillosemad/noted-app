import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/notes/delete_notes_fun.dart';
import 'package:todo/data/notes/read_notes_fun.dart';
import 'package:todo/main.dart';
import 'package:todo/presentation/screens/notes/insert_node.dart';
import 'package:todo/presentation/screens/notes/note_datails.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    super.initState();
    read_notes_fun();
  }

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
                  future: read_notes_fun(),
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
                                    Get.to(const NoteDetails(), arguments: {
                                      "title": snapshot.data[index]['title'],
                                      "body": snapshot.data[index]['body'],
                                      "note_id": snapshot.data[index]['note_id']
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
                                          height: 24.8.h,
                                          width: 100.w,
                                          child: Text(
                                            "${snapshot.data[index]['body']}",
                                            maxLines: 8,
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.2.h,
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
                                                      "are you sure to delete this note"),
                                                  confirmTextColor:
                                                      Colors.white,
                                                  onCancel: () {},
                                                  onConfirm: () {
                                                    delete_notes_fun(
                                                        snapshot.data[index]
                                                            ['note_id']);
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
                              "There is no notes yet",
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
                      Get.to(const InsertNote());
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
