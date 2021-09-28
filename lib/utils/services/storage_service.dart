import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:follow_fan/utils/services/localization_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final test_token = ""
abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";
  static const String activeLocale = "ACTIVE_LOCAL";
  static const String client = "CLIENT";
}

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  //TOKEN
  String get token {
    print(_prefs.getString(StorageKeys.token));
    return _prefs.getString(StorageKeys.token) ?? "";
  }

  set token(String? token) {
    _prefs.setString(StorageKeys.token, token.toString());
  }

  //Active Locale
  Locale get activeLocale {
    return Locale(_prefs.getString(StorageKeys.activeLocale) ??
        SupportedLocales.english.toString());
  }

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }

  // //Client
  // ClientModel get client {
  //   return ClientModel.fromJson(
  //       jsonDecode(_prefs.getString(StorageKeys.client) ?? "{}"));
  // }

  // set client(ClientModel? client) {
  //   _prefs.setString(StorageKeys.client, jsonEncode(client));
  // }
}
