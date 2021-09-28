import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/ui/components/header.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/screens/home/components/points_box.dart';

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
    return MainLayout(
      body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              PointsBox(),
              TextButton(
                  onPressed: () {
                    AlertPromptBox.showPrompt(
                        message: "هل انت متأكد",
                        onSuccess: () {
                          print("Confirmed");
                        },
                        onDismiss: () {
                          print("dismissed");
                        });
                  },
                  child: Text("Show"))
            ],
          )),
    );
  }
}
