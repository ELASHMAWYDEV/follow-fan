import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.7,
      height: size.height,
      color: kPrimaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SafeArea(
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: 30,
              width: 30,
              child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  child: Center(
                    child: Icon(
                      Icons.close_rounded,
                      color: kGrayColor,
                      size: 18,
                    ),
                  )),
            ),
          ),
          Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              Spacer(),
              MenuButton(
                  image: "assets/images/money.svg",
                  onPressed: () {},
                  title: "المعاملات"),
              MenuButton(
                  image: "assets/images/question.svg",
                  onPressed: () {
                    Get.toNamed("/contact-us");
                  },
                  title: "تواصل معنا"),
              MenuButton(
                  image: "assets/images/information.svg",
                  onPressed: () {
                    Get.toNamed("/about-us");
                  },
                  title: "عن التطبيق"),
              Spacer(),
              GestureDetector(
                onTap: () async => await canLaunch("http://ar-chaos.com/")
                    ? await launch("http://ar-chaos.com/")
                    : print("Couldn't open the link"),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                          text: "Developed by ",
                          style: TextStyle(
                              fontFamily: kFontFamilySecondary,
                              fontSize: 10,
                              color: kGrayColor),
                          children: [
                            TextSpan(
                              text: "Archaos",
                              style: TextStyle(color: kPrimaryLightColor),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Copyright © 2021 Follow Fan",
                      style: TextStyle(
                          fontFamily: kFontFamilySecondary,
                          fontSize: 8,
                          color: kGrayColor),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "V 0.1.0",
                      style: TextStyle(
                          fontFamily: kFontFamilySecondary,
                          fontSize: 6,
                          color: kGrayColor),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.image,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 15),
              child: SvgPicture.asset(
                "$image",
                width: 25,
                color: kPrimaryLightColor,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                        child: Text(
                      "$title",
                      style: TextStyle(color: kWhiteColor, fontSize: 16),
                    )),
                  ),
                  Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
