import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/utils/constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "عن التطبيق",
      body: Container(
        height: size.height * 0.7,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.6,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "1.0.0 V",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 14,
                fontFamily: "SavedByZero",
              ),
            ),
            SizedBox(
              height: 40,
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
            Text(
              "احصل علي 100 نقطة مجانا فور التسجيل ، وقم بزيادة نقاطك بمشاهدة الفيديوهات أو عن طريق الشحن المباشر.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 14,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
