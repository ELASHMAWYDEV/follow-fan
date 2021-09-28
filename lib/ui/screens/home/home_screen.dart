import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/ui/components/header.dart';
import 'package:follow_fan/ui/screens/home/components/mini_box.dart';
import 'package:follow_fan/ui/screens/home/components/points_box.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Header(),
                  PointsBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MiniBox(title: "الروابط الفعالة", number: 3),
                      MiniBox(title: "الروابط قيد الانتظار", number: 5),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Divider(
                      thickness: 2,
                      color: kPrimaryColor,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.4,
                        child: SvgPicture.asset("assets/images/gift.svg",
                            fit: BoxFit.contain),
                      ),
                      Container(
                        width: size.width * 0.6,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kOrangeColor),
                          ),
                          child: Text("اكسب المزيد من النقاط",
                              style: TextStyle(color: kWhiteColor)),
                        ),
                      ),
                    ],
                  ),
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
        ),
      ),
    );
  }
}
