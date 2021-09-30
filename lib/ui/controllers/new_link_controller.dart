import 'package:flutter/material.dart';
import 'package:follow_fan/data/models/link_category_model.dart';
import 'package:follow_fan/data/models/link_sub_category_model.dart';
import 'package:get/get.dart';

class NewLinkController extends GetxController {
  final List<LinkCategoryModel> categories = [
    LinkCategoryModel(iconPath: "assets/images/snapchat.svg", types: [
      LinkSubCategoryModel(title: "تسجيلات اعجاب"),
      LinkSubCategoryModel(title: "مشاهدات"),
      LinkSubCategoryModel(title: "اشتراكات"),
    ]),
    LinkCategoryModel(iconPath: "assets/images/instagram.svg", types: [
      LinkSubCategoryModel(title: "تسجيلات اعجاب"),
      LinkSubCategoryModel(title: "مشاهدات"),
      LinkSubCategoryModel(title: "اشتراكات"),
    ]),
    LinkCategoryModel(iconPath: "assets/images/facebook.svg", types: [
      LinkSubCategoryModel(title: "تسجيلات اعجاب"),
      LinkSubCategoryModel(title: "مشاهدات"),
      LinkSubCategoryModel(title: "اشتراكات"),
    ]),
    LinkCategoryModel(iconPath: "assets/images/youtube.svg", types: [
      LinkSubCategoryModel(title: "تسجيلات اعجاب"),
      LinkSubCategoryModel(title: "مشاهدات"),
      LinkSubCategoryModel(title: "اشتراكات"),
    ]),
  ];

  LinkCategoryModel? activeCategory;
  LinkSubCategoryModel? activeSubCategory;

  int availablePoints = 287;

  //Input controllers
  TextEditingController pointsInputController = TextEditingController();
  TextEditingController linkInputController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  void setActiveCategory(LinkCategoryModel category) {
    activeCategory = category;
    activeSubCategory = null;
    pointsInputController.text = "";
    linkInputController.text = "";
    update();
  }


}
