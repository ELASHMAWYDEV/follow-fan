import 'package:flutter/material.dart';
import 'package:follow_fan/logic/locator.dart';
import 'package:follow_fan/logic/navigation_service.dart';

import '../constants.dart';

class Prompt {
  static show(
      {String? title,
      String? message,
      VoidCallback? onConfirm,
      VoidCallback? onDismiss}) {
    showDialog(
        context: locator<NavigationService>().navigationKey.currentContext!,
        builder: (BuildContext context) {
          //Constants
          BorderRadius closeBorderRadius = BorderRadius.only(
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(4),
          );

          return Dialog(
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
                        BoxShadow(
                            blurRadius: 2, color: kPrimaryDark.withOpacity(0.5))
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
                              onTap: () {
                                Navigator.of(context).pop();
                                onDismiss!();
                              },
                              borderRadius: closeBorderRadius,
                              highlightColor: kWhite,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    color: kRed,
                                    borderRadius: closeBorderRadius),
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
                          message ?? "هل أنت متأكد ؟",
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  onConfirm!();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: kPrimaryLight,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4))),
                                child: Text("تأكيد",
                                    style: TextStyle(color: kWhite)),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 120,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  onDismiss!();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: kRed,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4))),
                                child: Text("الغاء",
                                    style: TextStyle(color: kWhite)),
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
        });
  }
}
