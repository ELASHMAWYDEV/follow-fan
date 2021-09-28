import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/screens/links/components/link_box.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        body: Column(
      children: [1, 2, 3, 4, 5, 6, 7, 8].map((e) => LinkBox()).toList(),
    ));
  }
}
