import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_button.dart';
import 'package:follow_fan/utils/constants.dart';

class PointsGift extends StatelessWidget {
  const PointsGift({
    Key? key,
    required this.points,
  }) : super(key: key);

  final int points;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/gift-box-primary.png",
          width: 50,
          height: 50,
        ),
        SizedBox(
          width: 15,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("$points",
                  style: TextStyle(
                    fontFamily: kFontFamilySecondary,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "نقطة",
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
