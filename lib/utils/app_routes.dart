import 'package:follow_fan/ui/screens/screens.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = "/splash";

  static List<GetPage> routes = [
    GetPage(name: "/splash", page: () => SplashScreen()),
    GetPage(name: "/home", page: () => HomeScreen()),
  ];
}
