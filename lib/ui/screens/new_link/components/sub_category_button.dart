import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class SubCategoryButton extends StatelessWidget {
  const SubCategoryButton(
      {Key? key,
      required this.title,
      required this.isActive,
      required this.onPressed})
      : super(key: key);

  final String title;
  final bool isActive;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 4, horizontal: 20)),
              backgroundColor: MaterialStateProperty.all(
                  isActive ? kPrimaryLightColor : kPrimaryColor)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? kWhiteColor : kPrimaryLightColor,
              ),
            ),
          )),
    );
  }
}
