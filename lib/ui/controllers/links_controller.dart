import 'package:flutter/material.dart';
import 'package:follow_fan/data/models/link_category_model.dart';
import 'package:follow_fan/data/models/link_model.dart';
import 'package:follow_fan/data/models/link_sub_category_model.dart';
import 'package:follow_fan/data/models/link_type_model.dart';
import 'package:follow_fan/data/models/user_model.dart';
import 'package:follow_fan/data/services/auth_service.dart';
import 'package:follow_fan/data/services/links_service.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

/*
 * 
 *  This controller is responsible for the links & new link screens
 * 
 */

class LinksController extends GetxController {
  final UserModel? userData = Get.find<StorageService>().userData;

  //Services
  final LinksService linksService = LinksService();
  final AuthService authService = AuthService();

  //Input controllers
  final TextEditingController pointsInputController = TextEditingController();
  final TextEditingController linkInputController = TextEditingController();

  LinkTypeModel? activeMainType;
  LinkTypeModel? activeSubType;

  List<LinkModel> links = [];
  List<LinkTypeModel> linkTypes = [];

  String selectedMainType = "";
  String selectedSubType = "";
  double? expectedReactions;

  @override
  void onInit() {
    //Check if the user has sufficiant points or not
    pointsInputController.addListener(() {
      if (pointsInputController.text != "" &&
          pointsInputController.text.isNum &&
          int.parse(pointsInputController.text) >
              (userData?.activePoints ?? 0)) {
        AlertPromptBox.showError(
            error:
                "يجب ان يكون عدد النقاط اقل من او يساوي النقاط المتاحة لديك : ${userData?.activePoints ?? 0} نقطة");
        pointsInputController.text = "";
      }

      if (pointsInputController.text != "") {
        expectedReactions = (double.tryParse(pointsInputController.text) ?? 0) /
            (activeSubType?.pointsCost ?? 0);
        update();
      }
    });

    super.onInit();
  }

  void setSelectedMainType(LinkTypeModel type) {
    activeMainType = type;
    activeSubType = null;
    pointsInputController.text = "";
    linkInputController.text = "";
    update();
  }

  void emptyNewLinkData() {
    activeMainType = null;
    activeSubType = null;
    pointsInputController.text = "";
    linkInputController.text = "";
    update();
  }

  String getLinkStatusTitle(String status) {
    switch (status) {
      case "pending":
        return "قيد الانتظار";
      case "active":
        return "فعال";
      case "finished":
        return "منتهي";
      case "canceled":
        return "ملغي";
      default:
        return "غير معروف";
    }
  }

  Color getLinkStatusColor(String status) {
    switch (status) {
      case "pending":
        return kOrangeColor;
      case "active":
        return kPrimaryLightColor;
      case "finished":
        return kGreenColor;
      case "canceled":
        return kRedColor;
      default:
        return kPrimaryDarkColor;
    }
  }

  Future<void> getMyLinks() async {
    links = await linksService.getMyLinks();
    update();
  }

  Future<void> getLinkTypes() async {
    linkTypes = await linksService.getLinkTypes();
    update();
  }

  Future<void> addLink() async {
    final LinkModel? linkAdded = await linksService.addLink(
        link: linkInputController.text,
        points: int.parse(pointsInputController.text),
        type: activeSubType?.type ?? "");

    if (linkAdded != null) {
      //Get the user data again by calling the register route
      await authService.register();
    }
  }

  Future<void> cancelLink(String linkId) async {
    final bool isDeleted = await linksService.cancelLink(linkId: linkId);

    if (isDeleted) {
      //Reload the links
      await getMyLinks();

      //Get the user data again by calling the register route
      authService.register();
    }
  }
}
