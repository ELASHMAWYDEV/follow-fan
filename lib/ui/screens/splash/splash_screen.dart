import 'package:flutter/material.dart';
import 'package:follow_fan/ui/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            "assets/images/logo.png",
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
      ),
    );
  }
}
