import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_fan/ui/components/checkbox_button.dart';
import 'package:follow_fan/ui/components/main_button.dart';
import 'package:follow_fan/ui/controllers/home_controller.dart';
import 'package:follow_fan/ui/screens/home/components/buy_points_sheet.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class BuyPointsPaymentSheetSheet extends StatelessWidget {
  BuyPointsPaymentSheetSheet({Key? key}) : super(key: key);

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
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
                "اختر وسيلة الدفع المفضلة لديك",
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
                  CheckboxButton(
                    isActive: _.paymentMethod == "visa-payment-method",
                    imagePath: "assets/images/visa-payment-method.png",
                    onChange: () {
                      _.paymentMethod = "visa-payment-method";
                      _.update();
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CheckboxButton(
                    isActive: _.paymentMethod == "paypal-payment-method",
                    imagePath: "assets/images/paypal-payment-method.png",
                    onChange: () {
                      _.paymentMethod = "paypal-payment-method";
                      _.update();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MainButton(
                  title: "المتابعة",
                  onPressed: () {
                    Get.back();
                    Get.bottomSheet(BuyPointsSheet());
                  })
            ],
          ),
        ),
      );
    });
  }
}
