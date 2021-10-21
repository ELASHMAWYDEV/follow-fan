import 'package:flutter/material.dart';
import 'package:follow_fan/ui/controllers/home_controller.dart';
import 'package:follow_fan/ui/screens/home/components/choose_points_dialogue.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

class PointsBox extends StatelessWidget {
  PointsBox({Key? key}) : super(key: key);

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "النقاط الكلية",
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${(Get.find<StorageService>().userData?.activePoints ?? 0) + (Get.find<StorageService>().userData?.pendingPoints ?? 0)} ",
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
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "النقاط المتاحة",
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${Get.find<StorageService>().userData?.activePoints ?? 0} ",
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
            SizedBox(
              height: 10,
            ),
            Center(
              child: FittedBox(
                child: TextButton(
                  onPressed: () {
                    Get.dialog(ChoosePointsDialogue(),
                        barrierDismissible: true);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kRedColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("اضافة نقاط", style: TextStyle(color: kWhiteColor)),
                      Icon(
                        Icons.add,
                        color: kWhiteColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
