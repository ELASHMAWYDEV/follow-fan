import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/google_auth_service.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final GoogleAuthService googleAuthService = Get.find<GoogleAuthService>();
  final StorageService storageService = Get.find<StorageService>();

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
                  "assets/images/hamed-logo.jpg",
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(
                  onPressed: () {
                    if (googleAuthService.userData == null) {
                      googleAuthService.signinWithGoogle();
                    } else {
                      AlertPromptBox.showPrompt(
                          title: "تسجيل الخروج",
                          message: "هل تريد تسجيل الخروج ؟",
                          onSuccess: () {
                            googleAuthService.logoutFromGoogle();
                          });
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    backgroundColor: kWhiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: storageService.googleAccount != null ? 3 : 8,
                        horizontal:
                            storageService.googleAccount != null ? 15 : 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: storageService.googleAccount == null,
                          child: SvgPicture.asset(
                            "assets/images/google.svg",
                            height:
                                storageService.googleAccount != null ? 20 : 30,
                          ),
                        ),
                        Visibility(
                          visible:
                              storageService.googleAccount?.photoUrl != null,
                          child: ClipOval(
                            child: Image.network(
                              storageService.googleAccount?.photoUrl ?? "",
                              height: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Visibility(
                          visible: storageService.googleAccount == null,
                          child: Text("تسجيل الدخول",
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 14)),
                        ),
                        Visibility(
                          visible: storageService.googleAccount != null,
                          child: Text(storageService.googleAccount?.email ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              MenuButton(
                  image: "assets/images/money.svg",
                  onPressed: () {
                    Get.toNamed("/transactions");
                  },
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
              Visibility(
                visible: storageService.googleAccount != null,
                child: TextButton(
                  onPressed: () {
                    AlertPromptBox.showSuccess(
                        title: "#324543",
                        message:
                            "هذا هو الرقم التعريفي الخاص بك كمستخدم لتطبيق FollowArb24");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryLightColor,
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Stack(children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      child: Column(
                        children: [
                          Text("الرقم التعريفي",
                              style:
                                  TextStyle(fontSize: 12, color: kWhiteColor)),
                          SizedBox(height: 10),
                          Text("#324543",
                              style: TextStyle(
                                  fontFamily: "SavedByZero",
                                  fontSize: 12,
                                  color: kWhiteColor)),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 5,
                        right: 5,
                        child: SvgPicture.asset(
                          "assets/images/information.svg",
                          color: kWhiteColor,
                          width: 14,
                        ))
                  ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                      "Copyright © 2021 Follow Arb24",
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
