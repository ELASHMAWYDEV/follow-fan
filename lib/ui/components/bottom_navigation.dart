import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final activeRoute = ModalRoute.of(context)?.settings.name;

    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: size.width,
        height: 85,
        child: Stack(
          children: [
            CustomPaint(
              size: size,
              painter: BottomCustomPainter(),
            ),
            Positioned(
              top: 0,
              left: size.width / 2 - 25,
              child: Container(
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(color: kRedColor, shape: BoxShape.circle),
                child: TextButton(
                  onPressed: () {
                    Get.toNamed("/new-link");
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: kWhiteColor,
                  )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              margin: EdgeInsets.only(top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (activeRoute != "/links") Get.toNamed("/links");
                    },
                    child: SvgPicture.asset("assets/images/link.svg",
                        width: 30,
                        color: activeRoute == "/links"
                            ? kPrimaryDarkColor
                            : kGrayColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (activeRoute != "/home") Get.offAllNamed("/home");
                    },
                    child: SvgPicture.asset("assets/images/home.svg",
                        width: 30,
                        color: activeRoute == "/home"
                            ? kPrimaryDarkColor
                            : kGrayColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = kWhiteColor
      ..style = PaintingStyle.fill;

    double middleIconSize = 35;

    Path path = Path()..moveTo(0, 50);
    path.lineTo(0, 50);
    path.quadraticBezierTo(
        size.width * 0.25 - 20, 20, size.width * 0.5 - middleIconSize, 22);
    path.arcToPoint(Offset(size.width * 0.5 + middleIconSize, 22),
        radius: Radius.circular(20), clockwise: false);
    path.quadraticBezierTo(size.width * 0.75 + 20, 22, size.width, 50);
    path.lineTo(size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 20, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
