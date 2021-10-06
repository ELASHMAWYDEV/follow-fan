import 'dart:io';

import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EarnPointsController extends GetxController {
  bool isPlayerReady = false;
  Duration currentPosition = Duration.zero;
  Duration lastPosition = Duration.zero;
  Duration remainingTime = Duration(seconds: 20);
  YoutubeMetaData videoMetaData = YoutubeMetaData();
  PlayerState playerState = PlayerState.unknown;

  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'bKyRpLzj9W8',
    flags: YoutubePlayerFlags(
        autoPlay: true, mute: false, hideControls: true, hideThumbnail: false),
  );

  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.onInit();
    youtubeController.addListener(() {
      try {
        if (isPlayerReady) {
          playerState = youtubeController.value.playerState;
          videoMetaData = youtubeController.metadata;
          currentPosition = youtubeController.value.position;
          if (currentPosition.inSeconds != lastPosition.inSeconds) {
            print("testing ${currentPosition.inSeconds},");
            remainingTime = Duration(
                seconds: remainingTime.inSeconds - currentPosition.inSeconds);
          }

          if (remainingTime.inSeconds <= 0) {
            youtubeController.load("0PmysOHRFVM");
            remainingTime = Duration(seconds: 20);
            currentPosition = Duration.zero;
            isPlayerReady = false;
            playerState = PlayerState.unknown;
            videoMetaData = YoutubeMetaData();
          }
          lastPosition = youtubeController.value.position;
          update();
        }
      } catch (e) {
        print("Error: $e");
      }
    });
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
