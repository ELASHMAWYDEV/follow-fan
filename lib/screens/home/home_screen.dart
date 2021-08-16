import 'package:flutter/material.dart';
import 'package:follow_fan/components/header.dart';
import 'package:follow_fan/components/prompt.dart';
import 'package:follow_fan/screens/home/components/points_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Header(),
                PointsBox(),
                TextButton(
                    onPressed: () {
                      Prompt.show(onConfirm: () {
                        print("Confirmed");
                      }, onDismiss: () {
                        print("dismissed");
                      });
                    },
                    child: Text("Show"))
              ],
            )),
      ),
    );
  }
}
