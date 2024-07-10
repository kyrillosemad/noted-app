import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/view%20model/bloc/links_bloc/links_bloc.dart';
import 'package:todo/view/shared_widgets/appbar.dart';

class LinkDetails extends StatefulWidget {
  const LinkDetails({super.key});

  @override
  State<LinkDetails> createState() => _LinkDetailsState();
}

class _LinkDetailsState extends State<LinkDetails> {
  var title = Get.arguments['title'];
  var body = Get.arguments['body'];
  var linkId = Get.arguments['link_id'];
  var link = Get.arguments['link'];
  GlobalKey<FormState> form = GlobalKey();
  TextEditingController titleCon = TextEditingController();
  TextEditingController bodyCon = TextEditingController();
  TextEditingController linkCon = TextEditingController();
  bool changed = false;
  @override
  void initState() {
    super.initState();
    titleCon.text = title;
    bodyCon.text = body;
    linkCon.text = link;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////appBar//////////////////////////////////////
      appBar: TopAppBar(
          name: "Link Details",
          changed: changed,
          onSave: () {
            if (changed == true && form.currentState!.validate()) {
              LinksBloc().add(UpdateLinks(titleCon.text, bodyCon.text,
                  linkId.toString(), linkCon.text));
            } else {}
          }),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
//////////////////////////////////////////Title Field//////////////////////////////////////////

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
                    controller: titleCon,
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
              //////////////////////////////////////////Body Field//////////////////////////////////////////
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    controller: bodyCon,
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
              //////////////////////////////////////////Link Field//////////////////////////////////////////
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
                    controller: linkCon,
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
