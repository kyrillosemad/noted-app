import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/data/services/auth/login_fun.dart';
import 'package:todo/view/view_modules/auth/screens/signup.dart';
import 'package:todo/view/view_modules/auth/widgets/email_field.dart';
import 'package:todo/view/view_modules/auth/widgets/logo.dart';
import 'package:todo/view/view_modules/auth/widgets/password_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                SizedBox(height: 10.h),
                const Logo(),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 90.w,
                  height: 22.h,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        EmailField(controller: emailController),
                        PasswordField(controller: passwordController),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DO you have account ? ",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const SignUp());
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      login_fun(emailController.text, passwordController.text);
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
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
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
