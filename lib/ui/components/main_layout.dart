import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/app_drawer.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:get/get.dart';

import 'bottom_navigation.dart';
import 'header.dart';

class MainLayout extends StatelessWidget {
  const MainLayout(
      {Key? key,
      required this.body,
      this.isBackEnabled = false,
      this.title = ""})
      : super(key: key);

  final Widget body;
  final bool isBackEnabled;
  final String title;
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
                    height: isBackEnabled ? 0 : 90,
                  ),
                  isBackEnabled
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$title",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        )
                      : SizedBox(),
                  body,
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
          isBackEnabled ? SizedBox() : Header(),
          isBackEnabled
              ? Positioned(
                  top: 40,
                  left: 10,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)))),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                )
              : Header(),
          BottomNavigation()
        ]),
      ),
    );
  }
}
