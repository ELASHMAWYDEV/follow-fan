import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_fan/ui/screens/home/components/buy_points_sheet.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class ChoosePointsDialogue extends StatefulWidget {
  const ChoosePointsDialogue({Key? key}) : super(key: key);

  @override
  State<ChoosePointsDialogue> createState() => _ChoosePointsDialogueState();
}

class _ChoosePointsDialogueState extends State<ChoosePointsDialogue> {
  String choosedBox = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kPrimaryDarkColor,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: FittedBox(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 2, color: kPrimaryDarkColor.withOpacity(0.5))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "قم بزيادة نقاطك",
                        style: TextStyle(
                            color: kPrimaryDarkColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(4),
                        highlightColor: kWhiteColor,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              color: kRedColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4))),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: kWhiteColor,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "اختر الطريقة التي تفضلها",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryDarkColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CheckboxButton(
                      title: "شراء نقاط",
                      isActive: choosedBox == "purchase",
                      imagePath: "assets/images/purchase-vector.svg",
                      onChange: () {
                        setState(() {
                          choosedBox = "purchase";
                        });
                      },
                    ),
                    CheckboxButton(
                      title: "اكتساب نقاط",
                      isActive: choosedBox == "earn",
                      imagePath: "assets/images/watch-earn-vector.svg",
                      onChange: () {
                        setState(() {
                          choosedBox = "earn";
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      child: TextButton(
                        onPressed: choosedBox == ""
                            ? null
                            : () {
                                if (choosedBox == "earn") {
                                } else {
                                  Get.back();
                                  Get.bottomSheet(BuyPointsSheet());
                                }
                              },
                        style: TextButton.styleFrom(
                            backgroundColor: choosedBox != ""
                                ? kPrimaryLightColor
                                : kGrayColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        child: Text("التالي",
                            style: TextStyle(color: kWhiteColor)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxButton extends StatelessWidget {
  const CheckboxButton(
      {Key? key,
      required this.isActive,
      required this.imagePath,
      required this.title,
      required this.onChange})
      : super(key: key);
  final bool isActive;
  final String imagePath;
  final String title;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onChange,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isActive ? kPrimaryLightColor : kWhiteColor),
            padding: MaterialStateProperty.all(EdgeInsets.all(0))),
        child: Stack(
          children: [
            Container(
              width: size.width * 0.3,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: isActive ? kPrimaryDarkColor : kGrayColor,
                  ),
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                children: [
                  SvgPicture.asset(
                    imagePath,
                    width: size.width * 0.25,
                    height: size.width * 0.3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isActive ? kPrimaryDarkColor : kGrayColor),
                  )
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: Visibility(
                  visible: !isActive,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: kPrimaryDarkColor, shape: BoxShape.circle),
                  ),
                )),
            Positioned(
              top: 10,
              right: 10,
              child: Visibility(
                visible: isActive,
                child: SvgPicture.asset(
                  "assets/images/check-mark.svg",
                  width: 15,
                ),
              ),
            )
          ],
        ));
  }
}
