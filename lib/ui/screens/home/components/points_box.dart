import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';

class PointsBox extends StatelessWidget {
  const PointsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: kPrimary, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "النقاط الكلية",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "400 ",
                    style: TextStyle(fontFamily: "SavedByZero", fontSize: 24),
                  ),
                  Text(
                    "نقطة",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "النقاط المتاحة",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "355 ",
                    style: TextStyle(fontFamily: "SavedByZero", fontSize: 24),
                  ),
                  Text(
                    "نقطة",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: FittedBox(
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kRed),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("اضافة نقاط", style: TextStyle(color: kWhite)),
                    Icon(
                      Icons.add,
                      color: kWhite,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
