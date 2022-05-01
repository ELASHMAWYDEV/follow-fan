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
              "1.0.0 V",
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
              width: size.width * 0.8,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/gift-box-primary.png",
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        "100",
                        style: TextStyle(
                            fontFamily: kFontFamilySecondary, fontSize: 24),
                      ),
                      Text(
                        "نقطة",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
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
