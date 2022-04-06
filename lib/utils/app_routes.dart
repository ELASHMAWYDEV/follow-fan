import 'package:follow_fan/ui/screens/intro/intro_screen.dart';
import 'package:follow_fan/ui/screens/paypal_payment/paypal_payment_screen.dart';
import 'package:follow_fan/ui/screens/about_us/about_us.dart';
import 'package:follow_fan/ui/screens/contact_us/contact_us_screen.dart';
import 'package:follow_fan/ui/screens/earn_points/earn_points_screen.dart';
import 'package:follow_fan/ui/screens/home/home_screen.dart';
import 'package:follow_fan/ui/screens/links/links_screen.dart';
import 'package:follow_fan/ui/screens/new_link/new_link_screen.dart';
import 'package:follow_fan/ui/screens/splash/splash_screen.dart';
import 'package:follow_fan/ui/screens/transactions/transactions_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = "/intro";

  static List<GetPage> routes = [
    GetPage(name: "/splash", page: () => SplashScreen()),
    GetPage(name: "/intro", page: () => IntroScreen()),
    GetPage(name: "/home", page: () => HomeScreen()),
    GetPage(name: "/links", page: () => LinksScreen()),
    GetPage(name: "/new-link", page: () => NewLinkScreen()),
    GetPage(name: "/transactions", page: () => TransactionScreen()),
    GetPage(name: "/contact-us", page: () => ContactUsScreen()),
    GetPage(name: "/about-us", page: () => AboutUsScreen()),
    GetPage(name: "/earn-points", page: () => EarnPointsScreen()),
    GetPage(name: "/paypal-payment", page: () => PaypalPaymentScreen()),
  ];
}
