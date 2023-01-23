import 'package:flutter/material.dart';
import 'package:follow_fan/ui/controllers/splash_controller.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
        body: Container(
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
              if (_.timeElapsed.value >= 1500)
                Positioned(
                  bottom: 20,
                  left: size.width / 2 - 50,
                  child: Column(
                    children: [
                      Lottie.asset("assets/animations/loading.json",
                          width: 100,
                          height: 100,
                          repeat: true,
                          errorBuilder: (context, error, stackTrace) =>
                              CircularProgressIndicator(
                                strokeWidth: 3,
                              )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "جاري التحميل...",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
