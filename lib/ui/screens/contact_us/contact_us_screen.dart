import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      isBackEnabled: true,
      title: "تواصل معنا",
      body: Column(
        children: [
          Image.asset("assets/images/logo.png"),
        ],
      ),
    );
  }
}
