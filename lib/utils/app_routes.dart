import 'package:follow_fan/ui/screens/screens.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = "/home";

  static List<GetPage> routes = [
    GetPage(name: "/home", page: () => HomeScreen()),
  ];
}
