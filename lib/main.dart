import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/app_routes.dart';
import 'package:follow_fan/utils/services/api_service.dart';
import 'package:follow_fan/utils/services/connection_service.dart';
import 'package:follow_fan/utils/services/localization_service.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:follow_fan/utils/translations/app_translations.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(NavigationService.init(), permanent: true);
  await Get.putAsync(() => ConnectionService.init(), permanent: true);
  await Get.putAsync(() => StorageService.init(), permanent: true);
  Get.put(LocalizationService.init(), permanent: true);
  Get.put(ApiService(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.find<NavigationService>().navigationKey,
      title: kAppTitle,
      translations: AppTranslations(),
      locale: Get.find<LocalizationService>().activeLocale,
      supportedLocales: SupportedLocales.all,
      fallbackLocale: SupportedLocales.arabic,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryDark,
          primaryColor: kPrimary,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kWhite,
                fontFamily: kFontFamily,
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
