import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:get/get.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuTap(),
          Image.asset(
            "assets/images/logo.png",
            width: 120,
          ),
        ],
      ),
    );
  }
}

class MenuTap extends StatelessWidget {
  const MenuTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<NavigationService>().scaffoldKey.currentState!.openDrawer();
      },
      borderRadius: BorderRadius.circular(50),
      highlightColor: kPrimaryColor,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 3,
              width: 30,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              width: 30,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}
