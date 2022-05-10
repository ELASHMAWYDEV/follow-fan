import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:get/get.dart';

const Color kPrimaryColor = Color(0xFF273c75);
const Color kPrimaryDarkColor = Color(0xFF000000);
const Color kPrimaryLightColor = Color(0xFF5380d1);
const Color kWhiteColor = Color(0xFFf7f7fb);
const Color kGrayColor = Color(0xFFC8C3CB);
const Color kRedColor = Color(0xFF192a56);
const Color kGreenColor = Color(0xFF00c89d);
const Color kOrangeColor = Color(0xFFfbc531);

const String kAppTitle = "Follow Arb24";
String kFontFamilyPrimary = "Almarai";
String kFontFamilySecondary = "SavedByZero";

const String kApiUrl = kReleaseMode
    ? "https://followfan.herokuapp.com/api/mobile/"
    : "https://followfan.herokuapp.com/api/mobile/";

final Size size = MediaQuery.of(Get.find<NavigationService>().context()).size;
