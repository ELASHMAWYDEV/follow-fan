import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

/*

  THE PURPOSE OF THIS SERVICE IS TO PROVIDE CONTEXT WHERE EVER IT IS NOT REACHABLE IN THE TREE

*/
class NavigationService extends GetxService {
  NavigationService();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static NavigationService init() {
    return NavigationService();
  }

  BuildContext context() {
    return navigationKey.currentContext!;
  }
}
