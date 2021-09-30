import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class TransactionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kPrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "01",
                        style: TextStyle(
                            fontFamily: kFontFamilySecondary,
                            fontSize: 8,
                            color: kGrayColor),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "شحن نقاط",
                            style: TextStyle(fontSize: 12, color: kWhiteColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "56",
                        style: TextStyle(
                            fontFamily: kFontFamilySecondary,
                            fontSize: 12,
                            color: kWhiteColor),
                      ),
                      Transform.translate(
                        offset: Offset(0, 2),
                        child: Text(
                          "\$",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: kGrayColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "80",
                        style: TextStyle(
                            fontFamily: kFontFamilySecondary,
                            fontSize: 12,
                            color: kWhiteColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "نقطة",
                        style: TextStyle(fontSize: 12, color: kGrayColor),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 70 / 2 - 5,
            child: Container(
              width: 10,
              height: 10,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kGreenColor),
            ),
          )
        ],
      ),
    );
  }
}
