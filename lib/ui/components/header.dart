import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
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
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: size.width,
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).padding.top + 5, 20, 10),
        decoration: BoxDecoration(color: kPrimaryColor, boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 3),
              color: kPrimaryDarkColor.withOpacity(0.5))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MenuTap(),
            Image.asset(
              "assets/images/logo.png",
              width: 120,
            ),
          ],
        ),
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
        Scaffold.of(context).openDrawer();
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
