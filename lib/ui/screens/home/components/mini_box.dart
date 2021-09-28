import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class MiniBox extends StatelessWidget {
  const MiniBox({Key? key, required this.title, required this.number})
      : super(key: key);

  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: size.width * 0.43,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "$number",
            style: TextStyle(
                color: kWhiteColor,
                fontSize: 18,
                fontFamily: kFontFamilySecondary),
          ),
        ],
      ),
    );
  }
}
