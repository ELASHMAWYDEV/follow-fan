import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({
    Key? key,
    required this.onPressNext,
    required this.onPressPrev,
    required this.isPrevButtonVisible,
    required this.isFinishButtonVisible,
  }) : super(key: key);

  final VoidCallback onPressNext;
  final VoidCallback onPressPrev;
  final bool isPrevButtonVisible;
  final bool isFinishButtonVisible;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedButton(
            title: isFinishButtonVisible ? "هيا بنا" : "التالي",
            onPress: onPressNext,
          ),
          Visibility(
            visible: isPrevButtonVisible,
            child: RoundedButton(
              title: "السابق",
              backgroundColor: kPrimaryColor,
              isReversed: true,
              onPress: onPressPrev,
            ),
          )
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.backgroundColor = kPrimaryLightColor,
    this.isReversed = false,
  }) : super(key: key);

  final VoidCallback onPress;
  final String title;
  final Color backgroundColor;
  final bool isReversed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 3, horizontal: 15)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(backgroundColor)),
        child: Row(
          textDirection: isReversed ? TextDirection.ltr : TextDirection.rtl,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: isReversed ? 0 : 3, right: isReversed ? 3 : 0),
              child: Icon(
                isReversed ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                color: kWhiteColor,
                size: 16,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
              ),
            ),
          ],
        ));
  }
}
