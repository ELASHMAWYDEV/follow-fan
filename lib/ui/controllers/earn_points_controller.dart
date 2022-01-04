import 'package:follow_fan/data/models/link_model.dart';
import 'package:follow_fan/data/models/user_model.dart';
import 'package:follow_fan/data/services/auth_service.dart';
import 'package:follow_fan/data/services/points_service.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/utils/services/admob_service.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class EarnPointsController extends GetxController {
  final AdmobService admobService = Get.find<AdmobService>();
  final UserModel? userData = Get.find<StorageService>().userData;
  final PointsService pointsService = PointsService();
  final AuthService authService = AuthService();

  List<LinkModel> links = [];
  int activeLinkIndex = 0;

  Duration currentPosition = Duration.zero;
  Duration lastPosition = Duration.zero;
  Duration remainingTime = Duration.zero;

  int adStepTimes =
      2; //How many videos the ad stepped without showing -> default = 2

  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: "TkguHhR580Y",
    params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: false,
        autoPlay: false,
        useHybridComposition: false),
  );

  @override
  void onInit() async {
    try {
      super.onInit();
      admobService.loadInterstitial();
    } catch (e) {
      print("error i onInit(): $e");
      AlertPromptBox.showError(error: "$e");
    }
  }

  @override
  void onReady() async {
    try {
      await getLinks();
      youtubeController.listen((data) async {
        if (data.isReady && !data.isBlank!) {
          if (data.playerState == PlayerState.unStarted ||
              data.playerState == PlayerState.unknown) youtubeController.play();
          currentPosition = youtubeController.value.position;
          if (currentPosition.inSeconds != lastPosition.inSeconds) {
            remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
            update();
          }

          lastPosition = youtubeController.value.position;
          if (remainingTime.inSeconds <= 0) {
            //For ads
            if (adStepTimes == 2) {
              admobService.interAd?.show();
              admobService.loadInterstitial();
              adStepTimes = 0;
            }

            adStepTimes += 1;
            activeLinkIndex += 1;

            if (links.length <= activeLinkIndex) {
              youtubeController.close();
              Get.offAllNamed("/home");
              AlertPromptBox.showPrompt(
                  title: "انتهت الفيديوهات",
                  message: "هل تريد اعادة تشغيلها مرة أخري",
                  onSuccess: () async {
                    Get.toNamed("/earn-points");
                  });
            }

            youtubeController.stop();
            // Send the confirmation to API
            // await confrimLink();
            youtubeController.load(links[activeLinkIndex].videoId);
            youtubeController.play();
            remainingTime =
                Duration(seconds: links[activeLinkIndex].watchTimeInSeconds);
            currentPosition = Duration.zero;
            lastPosition = Duration.zero;
            update();
          }
        }
      });
    } catch (e) {
      print("error in onReady(): $e");
      AlertPromptBox.showError(error: "$e");
    }
  }

  /// Get the links used to earn points
  Future<void> getLinks() async {
    try {
      final List<LinkModel> linksData = await pointsService.getEarningLinks();
      links = linksData;
      if (links.length == 0) {
        Get.offAllNamed("/home");
        AlertPromptBox.showError(
            
            error: "لا يوجد فيديوهات لمشاهدتها في الوقت الحالي");
        return;
      }
      youtubeController.pause();
      youtubeController.load(links[activeLinkIndex].videoId);
      youtubeController.play();
      remainingTime =
          Duration(seconds: links[activeLinkIndex].watchTimeInSeconds);
      currentPosition = Duration.zero;
      lastPosition = Duration.zero;
      update();
    } catch (e) {
      print("error i getLinks(): $e");
      AlertPromptBox.showError(error: "$e");
    }
  }

  Future<void> confrimLink() async {
    final int earnedPoints =
        await pointsService.confirmEarningLink(links[activeLinkIndex].linkId);
    if (earnedPoints > 0) {
      // Update in storage
      await authService.register();
    }
  }
}
