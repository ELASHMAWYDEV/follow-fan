import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

class BalanceBox extends StatefulWidget {
  const BalanceBox({
    Key? key,
  }) : super(key: key);

  @override
  State<BalanceBox> createState() => _BalanceBoxState();
}

class _BalanceBoxState extends State<BalanceBox> {
  int animatedPoints = 0;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    playSound();
    print("Hello");
    final int points = Get.find<StorageService>().userData?.activePoints ?? 100;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (animatedPoints < points) {
        animatedPoints += 1;
        setState(() {});
      }
    });

    super.initState();
  }

  void playSound() async {
    int result = await audioPlayer.play(
        "https://cdn.artlist.io/artlist-sfx-aac/464705_Sequenced_17_normal.aac");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "رصيدك الحالي هو",
            style: TextStyle(fontSize: 16),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$animatedPoints",
                style:
                    TextStyle(fontFamily: kFontFamilySecondary, fontSize: 24),
              ),
              Text(
                "نقطة",
                style: TextStyle(fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
