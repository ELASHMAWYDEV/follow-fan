import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_button.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/components/points_gift.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsScreen extends StatefulWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  String? appVersion;
  final InAppReview inAppReview = InAppReview.instance;

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
    return MainLayout(
      title: "عن التطبيق",
      body: Container(
        height: size.height * 0.8,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 0.6,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$appVersion V",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 14,
                fontFamily: "SavedByZero",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "تطبيق فولو فان ، هو تطبيق يمكنك من الحصول علي تفاعلات لمنشورك أو الفيديو الخاص بك علي يوتيوب ،فيسبوك ، انستجرام وسناب شات.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
                height: 2,
              ),
            ),
            Spacer(),
            Container(
              width: size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 22),
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Text(
                    " قم بتقييم التطبيق علي جوجل بلاي\nواحصل علي 100 نقطة مجانا ",
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.7),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PointsGift(points: 100),
                  SizedBox(
                    height: 30,
                  ),
                  MainButton(
                    title: "تقييم التطبيق",
                    onPressed: () {
                      // @TODO: implement rating steps here
                      inAppReview.openStoreListing();
                      // inAppReview.requestReview();
                    },
                    backgroundColor: kPrimaryLightColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
