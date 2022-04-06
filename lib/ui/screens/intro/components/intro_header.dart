import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedButton(
          title: "التالي",
          onPress: () {},
        ),
        RoundedButton(
          title: "السابق",
          backgroundColor: kPrimaryDarkColor,
          onPress: () {},
          icon: 
        )
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.backgroundColor = kPrimaryLightColor,
  }) : super(key: key);

  final VoidCallback onPress;
  final String title;
  final Color backgroundColor;
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
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: kWhiteColor,
              size: 16,
            ),
            Text(
              title,
              style: TextStyle(color: kWhiteColor, fontSize: 16),
            ),
          ],
        ));
  }
}
