import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class MiniBox extends StatelessWidget {
  const MiniBox({Key? key, required title, required number}) : super(key: key);

  final String title = "";
  final double number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          Text(
            "$number",
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
