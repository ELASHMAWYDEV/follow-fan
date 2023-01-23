import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/google_auth_service.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? appVersion;

  @override
  void initState() {
    getPackageInfo();
    super.initState();
  }

  getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    setState(() {});
  }

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
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(
                  onPressed: () {
                    if (Get.find<StorageService>().googleAccount == null) {
                      Get.find<GoogleAuthService>().signinWithGoogle();
                    } else {
                      AlertPromptBox.showPrompt(
                          title: "تسجيل الخروج",
                          message: "هل تريد تسجيل الخروج ؟",
                          onSuccess: () {
                            Get.find<GoogleAuthService>().logoutFromGoogle();
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
                        vertical:
                            Get.find<StorageService>().googleAccount != null
                                ? 3
                                : 8,
                        horizontal:
                            Get.find<StorageService>().googleAccount != null
                                ? 15
                                : 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: Get.find<StorageService>()
                                  .googleAccount
                                  ?.photoUrl !=
                              null,
                          child: ClipOval(
                            child: Image.network(
                              Get.find<StorageService>()
                                      .googleAccount
                                      ?.photoUrl ??
                                  "",
                              height: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Visibility(
                          visible:
                              Get.find<StorageService>().googleAccount == null,
                          child: Text("تسجيل الدخول",
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 14)),
                        ),
                        Visibility(
                          visible:
                              Get.find<StorageService>().googleAccount != null,
                          child: Text(
                              Get.find<StorageService>().googleAccount?.email ??
                                  "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: kPrimaryColor, fontSize: 10)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/images/google.svg",
                          height:
                              Get.find<StorageService>().googleAccount != null
                                  ? 20
                                  : 30,
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
                visible: Get.find<StorageService>().googleAccount != null,
                child: TextButton(
                  onPressed: () {
                    AlertPromptBox.showSuccess(
                        title: "#324543",
                        message:
                            "هذا هو الرقم التعريفي الخاص بك كمستخدم لتطبيق FollowFan");
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
                      "Copyright © ${DateTime.parse(DateTime.now().toString()).year} Follow Fan",
                      style: TextStyle(
                          fontFamily: kFontFamilySecondary,
                          fontSize: 8,
                          color: kGrayColor),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "V $appVersion",
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
