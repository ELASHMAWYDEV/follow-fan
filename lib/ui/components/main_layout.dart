import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/app_drawer.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:get/get.dart';

import 'bottom_navigation.dart';
import 'header.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Get.find<NavigationService>().scaffoldKey,
      backgroundColor: kPrimaryDarkColor,
      drawer: AppDrawer(),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: size.height),
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  body,
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
          Header(),
          BottomNavigation()
        ]),
      ),
    );
  }
}
