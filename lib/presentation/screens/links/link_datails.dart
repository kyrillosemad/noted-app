import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/links/update_link_fun.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LinkDetails extends StatefulWidget {
  const LinkDetails({super.key});

  @override
  State<LinkDetails> createState() => _LinkDetailsState();
}

class _LinkDetailsState extends State<LinkDetails> {
  var title = Get.arguments['title'];
  var body = Get.arguments['body'];
  // ignore: non_constant_identifier_names
  var link_id = Get.arguments['link_id'];
  var link = Get.arguments['link'];
  GlobalKey<FormState> form = GlobalKey();
  // ignore: non_constant_identifier_names
  TextEditingController title_con = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController body_con = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController link_con = TextEditingController();
  bool changed = false;
  @override
  void initState() {
    super.initState();

    title_con.text = title;
    body_con.text = body;
    link_con.text = link;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 57, 88),
        actions: [
          InkWell(
            onTap: () {
              if (changed == true && form.currentState!.validate()) {
                update_links_fun(
                    title_con.text, body_con.text, link_id, link_con.text);
              } else {}
            },
            child: Container(
              margin: EdgeInsets.all(10.sp),
              width: 18.w,
              height: 5.h,
              decoration: BoxDecoration(
                  color: changed ? const Color.fromRGBO(1, 203, 145, 1) : Colors.grey,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: const Center(
                child: Text("Save"),
              ),
            ),
          )
        ],
        title: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText("link details",
                speed: const Duration(milliseconds: 150))
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length > 20) {
                        return "must be less than 20";
                      } else {
                        return null;
                      }
                    },
                    controller: title_con,
                    onChanged: (value) {
                      setState(() {
                        changed = true;
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.title),
                      labelText: "title",
                    ),
                    style: TextStyle(fontSize: 15.sp),
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY(),
              SizedBox(
                height: 0.h,
              ),
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                   
                    controller: body_con,
                    onChanged: (value) {
                      setState(() {
                        changed = true;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "body",
                    ),
                    style: TextStyle(fontSize: 15.sp),
                    maxLines: 15,
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY(),
              SizedBox(height: 2.h),
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    controller: link_con,
                    onChanged: (value) {
                      setState(() {
                        changed = true;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "link",
                    ),
                    style: TextStyle(fontSize: 15.sp),
                    maxLines: 1,
                  )).animate().fade(delay: 400.ms, duration: 400.ms).slideY()
            ],
          ),
        ),
      ),
    );
  }
}
