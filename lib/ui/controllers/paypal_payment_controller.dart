import 'package:follow_fan/data/services/auth_service.dart';
import 'package:follow_fan/data/services/points_service.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/paypal_service.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

PaypalService paypalService = Get.find<PaypalService>();

class PaypalPaymentController extends GetxController {
  PointsService pointsService = PointsService();
  AuthService authService = AuthService();

  //Controllers
  WebViewController? webviewController;

  final String points = Get.arguments["points"] ?? 0;
  final String price = Get.arguments["price"] ?? 0;
  final String transactionId =
      Get.arguments["transactionId"]; //The transaction id from API

  String? checkoutUrl;
  String? executeUrl;
  String returnURL =
      '${kApiUrl}approvePayment?transactionId=${Get.arguments["transactionId"]}&paypalAccessToken=${paypalService.paypalAccessToken}';
  String cancelURL =
      '${kApiUrl}cancelPayment?transactionId=${Get.arguments["transactionId"]}';

  Map<String, dynamic> getOrderParams() {
    // item name, price and quantity
    String itemName = 'FollowArb24 Points';
    String itemPrice = price;
    int quantity = 1;

    //Some other data

    Map<dynamic, dynamic> defaultCurrency = {
      "symbol": "USD",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": true,
      "currency": "USD"
    };

    List items = [
      {
        "name": itemName,
        "quantity": quantity,
        "price": itemPrice,
        "currency": defaultCurrency["currency"]
      }
    ];

    // checkout invoice details
    String totalAmount = itemPrice;

    Map<String, dynamic> paymentDetails = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
          },
          "description": "Buy FollowArb24 Points",
          "payment_options": {"allowed_payment_method": "IMMEDIATE_PAY"},
          "item_list": {
            "items": items,
          }
        }
      ],
      "note_to_payer":
          "Thank you for buying more points from FollowArb24, we hope you use them wisely :)",
      "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
    };
    return paymentDetails;
  }

  @override
  void onInit() async {
    try {
      await paypalService.getAccessToken();

      final transaction = getOrderParams();
      final createdPayment =
          await paypalService.createPaypalPayment(transaction);
      if (createdPayment != null) {
        //Call the API to set a charge points request

        checkoutUrl = createdPayment["approvalUrl"];
        executeUrl = createdPayment["executeUrl"];
        update();
      }
    } catch (e) {
      print("exception: $e");
    }

    super.onInit();
  }

  Future<void> getHomeData() async => await authService.register();
}
