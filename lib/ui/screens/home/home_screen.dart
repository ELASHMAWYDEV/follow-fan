import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
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
    return MainLayout(
      body: Column(
        children: [
          PointsBox(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MiniBox(title: "الروابط الفعالة", number: 3),
              MiniBox(title: "الروابط قيد الانتظار", number: 5),
            ],
          ),
          Divider(
            thickness: 2,
            height: 40,
            indent: 30,
            endIndent: 30,
            color: kPrimaryColor,
          ),
          Container(
            height: 100,
            child:
                SvgPicture.asset("assets/images/gift.svg", fit: BoxFit.contain),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all(kOrangeColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)))),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Text(
                "اكسب المزيد من النقاط",
                style: TextStyle(color: kWhiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
