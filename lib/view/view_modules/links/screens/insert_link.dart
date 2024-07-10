import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/main.dart';
import 'package:todo/view%20model/bloc/links_bloc/links_bloc.dart';
import 'package:todo/view/shared_widgets/appbar.dart';

class InsertLink extends StatefulWidget {
  const InsertLink({super.key});

  @override
  State<InsertLink> createState() => _InsertLinkState();
}

class _InsertLinkState extends State<InsertLink> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////appBar//////////////////////////////////////
      appBar: TopAppBar(
          changed: changed,
          name: "New Link",
          onSave: () {
            if (changed == true && form.currentState!.validate()) {
              LinksBloc().add(InsertLinks(title_con.text, body_con.text,
                  id!.getString("userid").toString(), link_con.text));
            } else {}
          }),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              ////////////////////////title//////////////////////////////////////
              Container(
                  padding: EdgeInsets.all(20.sp),
                  child: TextFormField(
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
                height: 2.h,
              ),
              ////////////////////////body//////////////////////////////////////
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
              ////////////////////////link//////////////////////////////////////
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
