import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

import 'components/intro_header.dart';
// import 'package:get/get.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: MediaQuery.of(context).padding.top + 10),
        child: IntroHeader(),
      ),
    );
  }
}
