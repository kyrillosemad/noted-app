import 'package:flutter/material.dart';
import 'package:todo/view/view_modules/page_view/widgets/body.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: PageViewBody(
            desc:
                "You can easily store your notes and access them and edit them easily",
            lottie: "assets/Animation - 1713109877728.json",
            title: "Save Notes"));
  }
}
