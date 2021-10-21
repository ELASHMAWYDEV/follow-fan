import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/controllers/paypal_payment_controller.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalPaymentScreen extends StatelessWidget {
  PaypalPaymentScreen({
    Key? key,
  }) : super(key: key);

  final PaypalPaymentController controller = Get.put(PaypalPaymentController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaypalPaymentController>(builder: (_) {
      return MainLayout(
        title: "شحن النقاط",
        hasPadding: false,
        body: SizedBox(
          height: size.height - 115,
          child: Stack(
            children: [
              Visibility(
                visible: _.checkoutUrl != null,
                child: WebView(
                  initialUrl: _.checkoutUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController _controller) {
                    _.webviewController = _controller;
                    _.update();
                  },
                  onPageFinished: (String url) async {
                    if (url.contains(_.returnURL)) {
                      String? response =
                          await _.webviewController?.evaluateJavascript("""
                              (window.onload = () => {
                                 let body = document.body;
                                 return JSON.parse(document.documentElement.innerText);
                              })();
                              """);
                      Get.back();
                      if (response == null) {
                        AlertPromptBox.showError(
                          error: "حدث خطأ غير معروف ، يرجي اعادة المحاولة",
                        );
                      } else {
                        final responseData = jsonDecode(response.toString());
                        if (responseData["status"] == true) {
                          //Reload user data
                          await _.getHomeData();

                          AlertPromptBox.showSuccess(
                            message: responseData["message"],
                          );
                        } else {
                          AlertPromptBox.showError(
                            error: responseData["message"],
                          );
                        }
                      }
                    }

                    if (url.contains(_.cancelURL)) {
                      String? response =
                          await _.webviewController?.evaluateJavascript("""
                              (window.onload = () => {
                                 let body = document.body;
                                 return JSON.parse(document.documentElement.innerText);
                              })();
                              """);

                      Get.back();
                      if (response == null) {
                        AlertPromptBox.showError(
                          error: "حدث خطأ غير معروف ، يرجي اعادة المحاولة",
                        );
                      } else {
                        final responseData = jsonDecode(response.toString());
                        //Reload user data
                        await _.getHomeData();

                        AlertPromptBox.showError(
                          error: responseData["message"],
                        );
                      }
                    }
                  },
                ),
              ),
              Visibility(
                visible: _.checkoutUrl == null,
                child: Center(
                    child: Container(child: CircularProgressIndicator())),
              )
            ],
          ),
        ),
      );
    });
  }
}
