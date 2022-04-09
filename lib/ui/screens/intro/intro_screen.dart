import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:follow_fan/ui/controllers/intro_controller.dart';
import 'package:follow_fan/ui/screens/intro/components/intro_slide.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

import 'components/balance_box.dart';
import 'components/intro_header.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(builder: (_) {
      return Scaffold(
        body: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Column(
            children: [
              IntroHeader(
                isPrevButtonVisible: _.activeIndex != 0,
                isFinishButtonVisible:
                    _.activeIndex == _.introSlides.length - 1,
                onPressNext: _.next,
                onPressPrev: _.prev,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Visibility(
                  visible: _.activeIndex == _.introSlides.length - 1,
                  child: BalanceBox(),
                ),
              ),
              CarouselSlider(
                  items: _.introSlides
                      .map((slide) => IntroSlide(slide: slide))
                      .toList(),
                  carouselController: _.sliderController,
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      height: MediaQuery.of(context).size.height * 0.65,
                      initialPage: _.activeIndex,
                      reverse: true,
                      onPageChanged: (index, reason) {
                        _.activeIndex = index;
                        _.update();
                      })),
              SizedBox(
                width: 80,
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      _.introSlides.length,
                      (index) => Container(
                          width: _.activeIndex == index ? 15 : 10,
                          height: _.activeIndex == index ? 15 : 10,
                          decoration: BoxDecoration(
                              color: _.activeIndex == index
                                  ? kPrimaryLightColor
                                  : kPrimaryColor,
                              borderRadius: BorderRadius.circular(20)))),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
