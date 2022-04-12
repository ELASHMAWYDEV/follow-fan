import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double imageHeight = 260;

class IntroController extends GetxController {
  int activeIndex = 0;
  bool isWelcomBonusAnimating = false;
  final CarouselController sliderController = CarouselController();

  final List<SlideModel> introSlides = [
    SlideModel(
        image: Image.asset("assets/images/intro_screen_1.png",
            height: imageHeight),
        title: "ما هو تطبيق FollowFan ؟",
        description: """تطبيق FollowFan هو طريقك للحصول علي آلاف 
المتابعين واللايكات لجميع حساباتك علي مواقع 
السوشيال ميديا ، يوتيوب وفيسبوك وانستجرام وسناب 
شات"""),
    SlideModel(
        image: Image.asset("assets/images/intro_screen_2.png",
            height: imageHeight),
        title: "نحن ندعم المحتوي الهادف",
        description:
            """تطبيق FollowFan يدعم المحتوي الهادف ، سوف نساعدك في الحصول علي المتابعين والتفاعلات مجانا للمحتوي الذي تقدمه اذا كان محتوي هادف يتوافق مع شروطنا"""),
    SlideModel(
        image: Image.asset("assets/images/intro_screen_3.png",
            height: imageHeight),
        title: "اربح النقاط واستبدلها  بتفاعلات",
        description:
            """اربح النقاط عن طريق مشاهدة الفيديوهات وعمل لايكات والاشتراك في قنوات وحسابات الأخرين ، واستبدل هذه النقاط بتفاعلات مع المحتوي الخاص بك"""),
    SlideModel(
        image: Image.asset("assets/images/intro_screen_4.png",
            height: imageHeight),
        title: "🎉 100 نقطة هدية ترحيبية 🎉",
        description:
            """بما انك مستخدم جديد لدينا فسوف نعطيك 100 نقطة مجانا لكي تستخدمها في تجربة تطبيق FollowFan"""),
  ];

  void next() {
    if (activeIndex == introSlides.length - 1) {
      Get.offAndToNamed("/home");
    } else {
      activeIndex += 1;
      sliderController.animateToPage(activeIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
    update();
  }

  void prev() {
    if (activeIndex != 0) {
      activeIndex -= 1;
      sliderController.animateToPage(activeIndex,
          duration: Duration(milliseconds: 700), curve: Curves.easeOut);
    }
    ;
    update();
  }
}

class SlideModel {
  Image image;
  String title;
  String description;

  SlideModel({
    required this.image,
    required this.title,
    required this.description,
  });
}
