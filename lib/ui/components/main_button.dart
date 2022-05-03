import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.backgroundColor})
      : super(key: key);

  final String title;
  final onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 15, horizontal: 70)),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? kRedColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      child: Text(
        title,
        style: TextStyle(
            color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
