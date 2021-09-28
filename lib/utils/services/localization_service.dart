import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

class SupportedLocales {
  static List<Locale> all = [Locale("en"), Locale("ar")];

  static Locale english = Locale("en");
  static Locale arabic = Locale("ar");
}

class LocalizationService extends GetxService {
  LocalizationService(this._activeLocale);

  Locale _activeLocale;

  Locale get activeLocale => _activeLocale;

  static LocalizationService init() {
    //Get active local from storage
    Locale activeLocale = Get.find<StorageService>().activeLocale;
    return LocalizationService(activeLocale);
  }

  void setLocale(Locale locale) {
    if (!SupportedLocales.all.contains(locale))
      AlertPromptBox.showError(
          error: "This langauge is not supported in the app");
    _activeLocale = locale;
    //in storage
    Get.find<StorageService>().activeLocale = locale;

    //in Getx
    Get.updateLocale(locale);
  }

  String languageCode() {
    return _activeLocale.toString();
  }
}
