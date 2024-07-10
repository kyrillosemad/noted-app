import 'package:flutter/material.dart';
import 'package:todo/view/view_modules/page_view/widgets/body.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return const PageViewBody(
        desc:
            "You can easily store your task and access them and edit them easily",
        lottie: "assets/Animation - 1713111735458.json",
        title: "Save Tasks");
  }
}
