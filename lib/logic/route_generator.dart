import 'package:flutter/material.dart';
import 'package:follow_fan/screens/index.dart';

import '../constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return _routeError("There is no route with the path ${settings.name}");
    }
  }

  static Route<dynamic> _routeError(String error) {
    return MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
            body: Center(
                child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kRed.withOpacity(0.3))
                      ],
                      color: kRed,
                    ),
                    child: Text(
                      error,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )))));
  }
}
