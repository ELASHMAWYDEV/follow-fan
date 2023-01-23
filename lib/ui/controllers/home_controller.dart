import 'package:flutter/material.dart';
import 'package:follow_fan/data/services/auth_service.dart';
import 'package:follow_fan/data/services/points_service.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthService authService = AuthService();
  final PointsService pointsService = PointsService();

  //Input controllers
  TextEditingController pointsInputController = TextEditingController();
  TextEditingController budgetInputController = TextEditingController();

  String? paymentMethod = "paypal-payment-method";

  @override
  onInit() {
    pointsInputController.addListener(() {
      if (pointsInputController.text != "" &&
          pointsInputController.text.isNumericOnly) {
        budgetInputController.text =
            "\$${(int.parse(pointsInputController.text) / 1000).toString()}";
      }
    });
    super.onInit();
  }

  Future<void> getHomeData() async => await authService.register();

  void buyPoints() async {
    try {
      if (paymentMethod == null)
        return AlertPromptBox.showError(error: "يرجي اختيار وسيلة الدفع");

      if (paymentMethod == "visa-payment-method")
        return AlertPromptBox.showError(
            error: "هذه الخاصية غير متوفرة حاليا", title: "عذرا");

      //Get the transaction id from API
      String? transactionId = await pointsService
          .chargePoints(int.parse(pointsInputController.text));

      if (transactionId == null) return;

      //Go to the payment screen
      Get.toNamed("/paypal-payment", arguments: {
        "price": budgetInputController.text
            .split("\$")[1], //To remove the $ sign from the text
        "points": pointsInputController.text,
        "transactionId": transactionId,
      });
    } catch (e) {
      AlertPromptBox.showError(error: "يرجي كتابة عدد نقاط صحيح ٫ مثلا 1100");
    }
  }
}
