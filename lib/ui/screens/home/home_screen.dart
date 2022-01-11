import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/controllers/home_controller.dart';
import 'package:follow_fan/ui/screens/home/components/mini_box.dart';
import 'package:follow_fan/ui/screens/home/components/points_box.dart';
import 'package:follow_fan/ui/screens/home/components/steps_dialogue.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return MainLayout(
        onRefresh: () async {
          await _.getHomeData();
        },
        body: Column(
          children: [
            PointsBox(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MiniBox(
                    title: "الروابط الفعالة",
                    number:
                        Get.find<StorageService>().userData?.activeLinks ?? 0),
                MiniBox(
                    title: "الروابط قيد الانتظار",
                    number:
                        Get.find<StorageService>().userData?.pendingLinks ?? 0),
              ],
            ),
            Divider(
              thickness: 2,
              height: 40,
              indent: 30,
              endIndent: 30,
              color: kPrimaryColor,
            ),
            Container(
              height: 100,
              child: SvgPicture.asset("assets/images/gift.svg",
                  fit: BoxFit.contain),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Get.dialog(StepsDialogue());
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStateProperty.all(kOrangeColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)))),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: Text(
                  "اكسب المزيد من النقاط",
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
