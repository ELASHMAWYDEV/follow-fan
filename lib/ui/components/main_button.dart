import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(kRedColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Text(
          title,
          style: TextStyle(color: kWhiteColor),
        ),
      ),
    );
  }
}
