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
      ? 'AWRLO9xGOzgj8fWOiVwZl0JPESn6pG1Z8AJztD3tjpmZSyFGhDSoA3K1rTfGjaXp7FOwUXdOiPI5BpJm'
      : 'Ac9rMA6fh1-40dkrWmDDXS0N-sTQz7EbVW5WScjMMkEcTREPvDIR1dX2H2fSUJJF9Y2tZM6AgZUlG-5h';
  String secret = kReleaseMode
      ? 'EBlAYL3Q3PkchBWnvhnGKF6Yqz6Nq-Tisb4i74htGmnfHlAtq9Yd--wl0qjEs4M7L32b-dq4ifz9HQBp'
      : 'EGX138K7TRHV9R78pzP1LZ0gyDcHrEpVmdj5fTQKwzlOzZAh_C8xdRaP3731N2yB0MiAuV94PigPaWOJ';

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
