import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:get/get.dart';

const Color kPrimaryColor = Color(0xFF1f203f);
const Color kPrimaryDarkColor = Color(0xFF1c1832);
const Color kPrimaryLightColor = Color(0xFF5380d1);
const Color kWhiteColor = Color(0xFFf7f7fb);
const Color kGrayColor = Color(0xFFC8C3CB);
const Color kRedColor = Color(0xFFeb2a14);
const Color kGreenColor = Color(0xFF00c89d);
const Color kOrangeColor = Color(0xFFFF9F22);

const String kAppTitle = "Follow Fan";
String kFontFamilyPrimary = "Almarai";
String kFontFamilySecondary = "SavedByZero";

const String kApiUrl = kReleaseMode
    ? "https://flowfanarb.com/api/mobile/"
    : "https://f2ba-105-38-200-190.ngrok.io/api/mobile/";

final Size size = MediaQuery.of(Get.find<NavigationService>().context()).size;
