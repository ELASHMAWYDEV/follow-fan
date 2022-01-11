import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:async';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PaypalService extends GetxService {
  static final PaypalService _paypalUtil = PaypalService._();
  PaypalService._() {
    init();
  }
  factory PaypalService() {
    return _paypalUtil;
  }

  String domain = kReleaseMode
      ? "https://api-m.paypal.com/v1" //for production
      : "https://api-m.sandbox.paypal.com/v1"; // for sandbox mode

  // change clientId and secret with your own, provided by paypal
  String clientId = kReleaseMode
      ? 'AevGvPcXi_RVz7rrB9N1yewkymxuU5_-gKXl9WDgiLnItFwokkY1eooHugD4nCskrJP33CzGsiLBMeM6'
      : 'AbiApIxvHWfjB1e02iz4Z5mLdBOhEQaq-fQKZOCFrUwTKsK3HfBQW7ipFs0mLrwkIPJ2Rv7pEeddFYnC';
  String secret = kReleaseMode
      ? 'EERIRK4K8wzSxbnlXX788bci0rJINoM89XnEkJgjQS3L2IuROelK86BsJiB8J0lNz-XI4rc4-lT5lJwP'
      : 'EBLN640n-49JN3QBFHHI1TmuIEXO0EXErjeup4jwMpNlTusZi3sblN6_MB1lXQ-A6ITFd9yW735ylDtG';

  String paypalAccessToken = "";
  Dio dio = new Dio();

  void init() async {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 7000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));

    await getAccessToken();
  }

  // for getting the access token from Paypal
  Future<void> getAccessToken() async {
    try {
      print("getting access token...");

      String basicAuth =
          'Basic ' + base64Encode(utf8.encode("$clientId:$secret"));
      Response response = await dio.post('$domain/oauth2/token',
          queryParameters: {
            "grant_type": "client_credentials",
          },
          options: Options(headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": basicAuth
          }));

      if (response.statusCode == 200) {
        paypalAccessToken = response.data["access_token"];
      }
    } catch (e) {
      print("$e");
    }
  }

  // for creating the payment request with Paypal
  Future<Map<String, String>?> createPaypalPayment(transaction) async {
    try {
      print("creating payment...");

      Response response = await dio.post("$domain/payments/payment",
          data: transaction,
          options: Options(headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + paypalAccessToken
          }));

      final body = response.data;
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
        return null;
      } else {
        throw body["message"];
      }
    } catch (e) {
      print("$e");
      return null;
    }
  }
}
