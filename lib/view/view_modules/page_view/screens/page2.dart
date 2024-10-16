import 'package:flutter/material.dart';
import 'package:todo/view/view_modules/page_view/widgets/body.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return const PageViewBody(
        desc:
            "You can easily store your link and access them and edit them easily",
        lottie: "assets/Animation - 1713111784937.json",
        title: "Save Links");
  }
}
