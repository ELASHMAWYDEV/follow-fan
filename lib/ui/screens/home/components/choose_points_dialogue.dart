import 'package:flutter/material.dart';
import 'package:follow_fan/data/models/google_account_model.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/ui/components/checkbox_button.dart';
import 'package:follow_fan/ui/screens/home/components/buy_points_payment_method_sheet.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/google_auth_service.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

class ChoosePointsDialogue extends StatefulWidget {
  const ChoosePointsDialogue({Key? key}) : super(key: key);

  @override
  State<ChoosePointsDialogue> createState() => _ChoosePointsDialogueState();
}

class _ChoosePointsDialogueState extends State<ChoosePointsDialogue> {
  String choosedBox = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kPrimaryDarkColor,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: FittedBox(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 2, color: kPrimaryDarkColor.withOpacity(0.5))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "قم بزيادة نقاطك",
                        style: TextStyle(
                            color: kPrimaryDarkColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(4),
                        highlightColor: kWhiteColor,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              color: kRedColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4))),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: kWhiteColor,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "اختر الطريقة التي تفضلها",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryDarkColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CheckboxButton(
                      title: "شراء نقاط",
                      isActive: choosedBox == "purchase",
                      imagePath: "assets/images/purchase-vector.svg",
                      onChange: () {
                        setState(() {
                          choosedBox = "purchase";
                        });
                      },
                    ),
                    CheckboxButton(
                      title: "اكتساب نقاط",
                      isActive: choosedBox == "earn",
                      imagePath: "assets/images/watch-earn-vector.svg",
                      onChange: () {
                        setState(() {
                          choosedBox = "earn";
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      child: TextButton(
                        onPressed: choosedBox == ""
                            ? null
                            : () {
                                if (choosedBox == "earn") {
                                  Get.back();
                                  //Check if the user is logged in with a google account
                                  final GoogleAccountModel? userAccount =
                                      Get.find<StorageService>().googleAccount;
                                  if (userAccount == null) {
                                    return AlertPromptBox.showPrompt(
                                      title: "تسجيل الدخول",
                                      message: "يجب تسجيل الدخول اولا",
                                      onSuccess: Get.find<GoogleAuthService>()
                                          .signinWithGoogle,
                                      successBtnTitle: "تسجيل الدخول",
                                    );
                                  }

                                  Get.toNamed("/earn-points");
                                } else {
                                  Get.back();
                                  Get.bottomSheet(BuyPointsPaymentSheetSheet());
                                }
                              },
                        style: TextButton.styleFrom(
                            backgroundColor: choosedBox != ""
                                ? kPrimaryLightColor
                                : kGrayColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        child: Text("التالي",
                            style: TextStyle(color: kWhiteColor)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
