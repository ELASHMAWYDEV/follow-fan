import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/utils/constants.dart';
import 'dart:math' as math;

class LinkBox extends StatefulWidget {
  const LinkBox({Key? key}) : super(key: key);

  @override
  State<LinkBox> createState() => _LinkBoxState();
}

class _LinkBoxState extends State<LinkBox> {
  bool isOpened = false;
  double containerHeight = 70;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
              onPressed: () {
                setState(() {
                  isOpened = !isOpened;
                  containerHeight = isOpened ? 200 : 70;
                });
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)))),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: containerHeight,
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: ClipRect(
                  child: Column(
                    children: [
                      Row(
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
                              SvgPicture.asset(
                                "assets/images/youtube.svg",
                                width: 30,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "تسجيلات اعجاب",
                                style:
                                    TextStyle(fontSize: 12, color: kWhiteColor),
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
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "تفاعل",
                            style: TextStyle(
                              fontSize: 12,
                              color: kGrayColor,
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
                          Transform.rotate(
                            angle: isOpened ? math.pi / 2 : 0,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: kWhiteColor,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                      Visibility(
                        visible: isOpened,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "الرابط",
                                        style: TextStyle(
                                            fontSize: 14, color: kWhiteColor),
                                      ),
                                      SizedBox(height: 5),
                                      SizedBox(
                                        width: (size.width - 20) * .5,
                                        child: Text(
                                          "https://www.youtube.com/watch?v=-LzuVXtf57M&pp=sAQA",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 10, color: kWhiteColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "عدد النقاط الكلية",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: kWhiteColor),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "80",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            kFontFamilySecondary,
                                                        fontSize: 12,
                                                        color: kWhiteColor),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "نقطة",
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: kWhiteColor),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "عدد النقاط المتبقية",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: kWhiteColor),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "80",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            kFontFamilySecondary,
                                                        fontSize: 12,
                                                        color: kWhiteColor),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "نقطة",
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: kWhiteColor),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Container(
                                        color: kOrangeColor,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 8),
                                        child: Text(
                                          "قيد الانتظار",
                                          style: TextStyle(
                                              fontSize: 10, color: kWhiteColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: TextButton(
                                          onPressed: () {
                                            AlertPromptBox.showPrompt(
                                                message:
                                                    "هل تريد الغاء الرابط ؟",
                                                title: "الغاء الرابط",
                                                onSuccess: () {});
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.zero),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    kRedColor),
                                          ),
                                          child: Text("الغاء",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: kWhiteColor)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
