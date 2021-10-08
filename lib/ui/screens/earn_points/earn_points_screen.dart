import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/controllers/earn_points_controller.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class EarnPointsScreen extends StatelessWidget {
  EarnPointsScreen({Key? key}) : super(key: key);

  final EarnPointsController controller = Get.put(EarnPointsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EarnPointsController>(builder: (_) {
      return MainLayout(
        isBackEnabled: true,
        title: "ربح النقاط",
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  Text("الوقت المتبقي"),
                  SizedBox(height: 15),
                  Text("${_.remainingTime.inSeconds}s")
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "من فضلك لا تقم باغلاق التطبيق او الرجوع للخلف حتي لا تخسر نقاط هذا الفيديو",
                style: TextStyle(fontSize: 10)),
            SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: YoutubePlayerControllerProvider(
                    // Provides controller to all the widget below it.
                    controller: _.youtubeController,
                    child: YoutubePlayerIFrame(
                      aspectRatio: 16 / 9,
                    ),
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
