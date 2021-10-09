import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/app_drawer.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:get/get.dart';

import 'bottom_navigation.dart';
import 'header.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.body, this.title, this.onRefresh})
      : super(key: key);

  final Widget body;
  final String? title;
  final Future<void> Function()? onRefresh;

  Widget refreshWrapper(Widget body) {
    if (onRefresh != null)
      return RefreshIndicator(child: body, onRefresh: onRefresh!);
    else
      return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      drawer: AppDrawer(),
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight: size.height),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: refreshWrapper(
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  child: Column(
                    children: [
                      body,
                      SizedBox(
                        height: title != null ? 0 : 80,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Header(title: title),
          Visibility(visible: title == null, child: BottomNavigation())
        ]),
      ),
    );
  }
}
