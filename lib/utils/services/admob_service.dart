import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService extends GetxService {
  InterstitialAd? interAd;

  static void init() async {
    final InitializationStatus status = await MobileAds.instance.initialize();
    print("ads status: $status");
  }

  void loadInterstitial() {
    InterstitialAd.load(
        adUnitId: kReleaseMode
            ? 'ca-app-pub-2794737528786385/2713317344'
            : InterstitialAd.testAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print("InterstitialAd loaded");
            interAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }
}
