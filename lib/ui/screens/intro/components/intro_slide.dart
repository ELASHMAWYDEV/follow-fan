import 'package:flutter/material.dart';
import 'package:follow_fan/ui/controllers/intro_controller.dart';
import 'package:follow_fan/utils/constants.dart';

class IntroSlide extends StatelessWidget {
  const IntroSlide({
    Key? key,
    required this.slide,
  }) : super(key: key);

  final SlideModel slide;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            child: slide.image,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 15),
            child: Column(
              children: [
                Text(slide.title,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: EdgeInsets.only(top: 9, bottom: 15),
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Text(
                  slide.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
