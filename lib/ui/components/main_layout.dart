import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
