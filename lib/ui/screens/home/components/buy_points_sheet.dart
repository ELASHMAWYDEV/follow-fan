import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_fan/ui/components/main_button.dart';
import 'package:follow_fan/ui/components/text_box.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class BuyPointsSheet extends StatefulWidget {
  const BuyPointsSheet({Key? key}) : super(key: key);

  @override
  _BuyPointsSheetState createState() => _BuyPointsSheetState();
}

class _BuyPointsSheetState extends State<BuyPointsSheet> {
  TextEditingController pointsInputController = TextEditingController();
  TextEditingController budgetInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: FittedBox(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                "assets/images/cancel.svg",
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "شراء نقاط",
              style: TextStyle(
                  fontSize: 20,
                  color: kPrimaryDarkColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width / 2 - 35,
                  child: TextBox(
                      fillColor: kGrayColor.withOpacity(0.15),
                      keyboardType: TextInputType.number,
                      label: "عدد النقاط",
                      controller: pointsInputController),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                    width: size.width / 2 - 35,
                    child: TextBox(
                        fillColor: kPrimaryColor.withOpacity(0.15),
                        hintColor: kPrimaryDarkColor,
                        label: "التكلفة",
                        isEditable: false,
                        controller: budgetInputController)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MainButton(title: "شراء", onPressed: () {})
          ],
        ),
      ),
    );
  }
}