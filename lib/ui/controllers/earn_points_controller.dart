import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class EarnPointsController extends GetxController {
  Duration currentPosition = Duration.zero;
  Duration lastPosition = Duration.zero;
  Duration remainingTime = Duration(seconds: 20);

  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'bKyRpLzj9W8',
    params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: false,
        autoPlay: false,
        useHybridComposition: false),
  );

  @override
  void onInit() {
    super.onInit();

    youtubeController.listen((data) {
      if (data.isReady && !data.isBlank!) {
        if (data.playerState == PlayerState.unStarted ||
            data.playerState == PlayerState.unknown) youtubeController.play();
        currentPosition = youtubeController.value.position;
        print(
            "testing ${currentPosition.inSeconds}, ${lastPosition.inSeconds}");
        if (currentPosition.inSeconds != lastPosition.inSeconds) {
          remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
          update();
        }

        lastPosition = youtubeController.value.position;
        if (remainingTime.inSeconds <= 0) {
          youtubeController.pause();
          youtubeController.load("0PmysOHRFVM");
          youtubeController.play();
          remainingTime = Duration(seconds: 20);
          currentPosition = Duration.zero;
          lastPosition = Duration.zero;
          update();
        }
      }
    });
  }

  @override
  void onReady() {
    youtubeController.play();
    super.onReady();
  }
}
