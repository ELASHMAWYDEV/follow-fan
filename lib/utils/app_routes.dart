import 'package:follow_fan/ui/screens/contact_us/contact_us_screen.dart';
import 'package:follow_fan/ui/screens/home/home_screen.dart';
import 'package:follow_fan/ui/screens/links/links_screen.dart';
import 'package:follow_fan/ui/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = "/splash";

  static List<GetPage> routes = [
    GetPage(name: "/splash", page: () => SplashScreen()),
    GetPage(name: "/home", page: () => HomeScreen()),
    GetPage(name: "/contact-us", page: () => ContactUsScreen()),
    GetPage(name: "/links", page: () => LinksScreen()),
  ];
}
