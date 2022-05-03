import 'package:flutter/material.dart';
import 'package:follow_fan/data/services/auth_service.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

class Header extends StatefulWidget {
  const Header({Key? key, this.title, this.onBack}) : super(key: key);
  final String? title;
  final Future<void> Function()? onBack;

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
        child: Column(
          children: [
            Visibility(
              visible: widget.title == null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MenuTap(),
                  GestureDetector(
                    onLongPress: () async {
                      // @TODO: remove this in production
                      Get.find<StorageService>().userData = null;
                      await AuthService().register();
                    },
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: widget.title != null,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text("${widget.title}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          widget.onBack != null ? widget.onBack!() : () {}();
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
                  ),
                ],
              ),
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
