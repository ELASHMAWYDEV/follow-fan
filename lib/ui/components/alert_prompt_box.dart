import 'package:flutter/material.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/navigation_service.dart';
import 'package:get/get.dart';

class AlertPromptBox {
  AlertPromptBox();

  static showError({required String error, VoidCallback? onDismiss}) {
    Get.dialog(
        StatefulBuilder(
          builder: (BuildContext context, Function setState) => boxContainer(
              title: error,
              color: kRedColor,
              onDismiss: onDismiss,
              context: context),
        ),
        barrierDismissible: true);
  }

  static showSuccess({required String message, VoidCallback? onDismiss}) {
    Get.dialog(
        StatefulBuilder(
          builder: (BuildContext context, Function setState) => boxContainer(
              title: message,
              color: kGreenColor,
              context: context,
              onDismiss: onDismiss),
        ),
        barrierDismissible: true);
  }

  static showPrompt(
      {required String message,
      required VoidCallback onSuccess,
      VoidCallback? onDismiss,
      String? iconPath}) {
    Get.dialog(
        StatefulBuilder(
          builder: (BuildContext context, Function setState) => boxContainer(
            title: message,
            color: kPrimary,
            iconPath: iconPath,
            context: context,
            // actions: [
            //   RoundedButton(
            //       title: "نعم",
            //       onPressed: () {
            //         Get.back();
            //         onSuccess();
            //       }),
            //   SizedBox(
            //     height: 10,
            //   ),
            //   RoundedButton(
            //     title: "الغاء",
            //     onPressed: onDismiss ??
            //         () {
            //           Get.back();
            //         },
            //     textColor: kPrimary,
            //     backgroundColor: kWhite,
            //     hasBorder: true,
            //   )
            // ]
          ),
        ),
        barrierDismissible: true);
  }
}

Widget boxContainer(
        {List<Widget>? actions,
        String? iconPath,
        String? title,
        VoidCallback? onDismiss,
        var context,
        required Color color}) =>
    Dialog(
      backgroundColor: kPrimaryDark,
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
                  BoxShadow(blurRadius: 2, color: kPrimaryDark.withOpacity(0.5))
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
                        title ?? "تأكيد",
                        style: TextStyle(
                            color: kPrimaryDark,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    InkWell(
                        onTap: onDismiss ?? () => {Get.back()},
                        borderRadius: BorderRadius.circular(4),
                        highlightColor: kWhite,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              color: kRed,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: kWhite,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    title ?? "هل أنت متأكد ؟",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: kPrimaryDark,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 120,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: kPrimaryLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          child: Text("تأكيد", style: TextStyle(color: kWhite)),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 120,
                        child: TextButton(
                          onPressed: () {
                            onDismiss == null ? () {}() : onDismiss();
                            Get.back();
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: kRed,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          child: Text("الغاء", style: TextStyle(color: kWhite)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
