import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {bool isReplacement = false}) {
    return isReplacement
        ? navigationKey.currentState!.pushReplacementNamed(routeName)
        : navigationKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> push(PageRouteBuilder page) {
    return navigationKey.currentState!.push(page);
  }

  void pop(BuildContext? ctx) {
    return Navigator.of(navigationKey.currentContext!).pop(ctx);
  }
}
