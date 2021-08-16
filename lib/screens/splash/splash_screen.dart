import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1800), () {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

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
