import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/services/auth/signup_fun.dart';
import 'package:todo/view/view_modules/auth/screens/login.dart';
import 'package:todo/view/view_modules/auth/widgets/email_field.dart';
import 'package:todo/view/view_modules/auth/widgets/logo.dart';
import 'package:todo/view/view_modules/auth/widgets/password_field.dart';
import 'package:todo/view/view_modules/auth/widgets/username_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> form2 = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
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
                const Logo(),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 90.w,
                  height: 30.h,
                  child: Form(
                      key: form2,
                      child: Column(
                        children: [
                          UserNameField(controller: username),
                          EmailField(controller: email),
                          PasswordField(controller: password),
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
                        Get.to((const Login()));
                      },
                      child: Text(
                        "login",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    if (form2.currentState!.validate()) {
                      signup_fun(username.text, email.text, password.text);
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
                        "sign up",
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
