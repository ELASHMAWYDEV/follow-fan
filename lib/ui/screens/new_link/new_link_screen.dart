import 'package:flutter/material.dart';
import 'package:follow_fan/data/models/link_category_model.dart';
import 'package:follow_fan/ui/components/main_button.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/components/text_box.dart';
import 'package:follow_fan/ui/controllers/links_controller.dart';
import 'package:follow_fan/ui/screens/new_link/components/sub_type_button.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

import 'components/main_type_box.dart';

class NewLinkScreen extends StatefulWidget {
  NewLinkScreen({Key? key}) : super(key: key);

  @override
  State<NewLinkScreen> createState() => _NewLinkScreenState();
}

class _NewLinkScreenState extends State<NewLinkScreen> {
  final LinksController controller = Get.put(LinksController());

  @override
  initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await controller.getLinkTypes();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LinksController>(builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          _.emptyNewLinkData();
          return true;
        },
        child: MainLayout(
          title: "اضف رابط جديد",
          onBack: () async {
            _.emptyNewLinkData();
            _.update();
          },
          body: SizedBox(
            height: size.height - 140,
            child: Column(
              children: [
                Text(
                  "قم باختيار المنصة التي تريدها",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _.linkTypes
                      .map<Widget>((type) => Row(
                            children: [
                              MainTypeBox(
                                type: type,
                                isSelected: _.activeMainType == type,
                                onPressed: () {
                                  _.setSelectedMainType(type);
                                },
                              ),
                            ],
                          ))
                      .toList(),
                ),
                Visibility(
                    visible: _.activeMainType != null,
                    child: Column(
                      children: [
                        Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                          indent: 40,
                          endIndent: 40,
                          height: 40,
                        ),
                        Text(
                          "اختر نوع التفاعل",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          spacing: 15,
                          alignment: WrapAlignment.center,
                          children: _.activeMainType != null
                              ? _.activeMainType!.types
                                  .map((type) => SubTypeButton(
                                        type: type,
                                        isSelected: _.activeSubType == type,
                                        onPressed: () {
                                          _.activeSubType = type;
                                          _.update();
                                        },
                                      ))
                                  .toList()
                              : [],
                        ),
                        Visibility(
                          visible: _.activeSubType != null,
                          child: Column(
                            children: [
                              Divider(
                                color: kPrimaryColor,
                                thickness: 2,
                                indent: 40,
                                endIndent: 40,
                                height: 50,
                              ),
                              Text(
                                "قم بملئ التفاصيل",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: size.width * 0.8 - 30,
                                      child: TextBox(
                                        label: "عدد النقاط",
                                        controller: _.pointsInputController,
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: false),
                                      )),
                                  Spacer(),
                                  Text.rich(
                                      TextSpan(text: "المتاح حاليا", children: [
                                        TextSpan(
                                            text:
                                                "\n${_.userData?.activePoints ?? 0}  ",
                                            style: TextStyle(
                                                color: kPrimaryLightColor,
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                            text: "نقطة",
                                            style: TextStyle(fontSize: 10))
                                      ]),
                                      style: TextStyle(height: 1.5))
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextBox(
                                label: "الرابط",
                                controller: _.linkInputController,
                                keyboardType: TextInputType.url,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "مثال: https://www.instagram.com/p/CSAsmZOK8t6",
                                      style: TextStyle(
                                          color: kGrayColor, fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Visibility(
                  visible: false, //_.expectedReactions != null,
                  child: Column(
                    children: [
                      Divider(
                        color: kPrimaryColor,
                        thickness: 2,
                        indent: 40,
                        endIndent: 40,
                        height: 40,
                      ),
                      Text(
                        "اقصي عدد تفاعل يمكنك الحصول عليه حاليا هو",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${_.expectedReactions?.toInt()} تفاعل",
                        style: TextStyle(
                            fontSize: 14,
                            color: kPrimaryLightColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "هذا العدد قابل للزيادة في الايام المقبلة",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Spacer(),
                Visibility(
                    child: MainButton(
                        title: "اضافة",
                        onPressed: () async {
                          await _.addLink();
                        }))
              ],
            ),
          ),
        ),
      );
    });
  }
}
