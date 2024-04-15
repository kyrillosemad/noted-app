import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/auth/login_fun.dart';
import 'package:todo/presentation/screens/signup.dart';

class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  GlobalKey<FormState> form1 = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 100.w,
                  height: 40.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: 90.w,
                  height: 30.h,
                  child: Form(
                      key: form1,
                      child: Column(
                        children: [
                          SizedBox(
                              width: 90.w,
                              height: 10.h,
                              child: TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value!.length < 10) {
                                    return 'must be greater than 10 letters';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration:
                                    const InputDecoration(label: Text("Email")),
                              )),
                          SizedBox(
                              width: 90.w,
                              height: 10.h,
                              child: TextFormField(
                                controller: password,
                                validator: (value) {
                                  if (value!.length < 4) {
                                    return 'must be greater than 4 letters';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                    label: Text("password")),
                              )),
                        ],
                      )),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DO you have account ? ",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to((const SignUp()));
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InkWell(
                  onTap: () {
                    if (form1.currentState!.validate()) {
                      login_fun(email.text, password.text);
                    } else {
                      // ignore: avoid_print
                      print("try again");
                    }
                  },
                  child: Container(
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 57, 88),
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Center(
                      child: Text(
                        "login",
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
