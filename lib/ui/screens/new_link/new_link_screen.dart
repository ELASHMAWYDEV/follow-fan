import 'package:flutter/material.dart';
import 'package:follow_fan/data/models/link_category_model.dart';
import 'package:follow_fan/ui/components/main_button.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/components/text_box.dart';
import 'package:follow_fan/ui/controllers/new_link_controller.dart';
import 'package:follow_fan/ui/screens/new_link/components/sub_category_button.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

import 'components/category_box.dart';

class NewLinkScreen extends StatelessWidget {
  NewLinkScreen({Key? key}) : super(key: key);

  final NewLinkController controller = Get.put(NewLinkController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLinkController>(builder: (_) {
      return MainLayout(
        title: "اضف رابط جديد",
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
                children: _.categories
                    .map<Widget>((category) => Row(
                          children: [
                            CategoryBox(
                              category: category,
                              isActive: _.activeCategory == category,
                              onPressed: () {
                                _.setActiveCategory(category);
                              },
                            ),
                          ],
                        ))
                    .toList(),
              ),
              Visibility(
                  visible: _.activeCategory != null,
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
                        children: _.activeCategory != null
                            ? _.activeCategory!.types
                                .map((type) => SubCategoryButton(
                                      title: type.title,
                                      isActive: _.activeSubCategory == type,
                                      onPressed: () {
                                        _.activeSubCategory = type;
                                        _.update();
                                      },
                                    ))
                                .toList()
                            : [],
                      ),
                      Visibility(
                        visible: _.activeSubCategory != null,
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
                                          text: "\n${_.availablePoints}  ",
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
                "45 تفاعل",
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
              SizedBox(
                height: 15,
              ),
              Spacer(),
              Visibility(child: MainButton(title: "اضافة", onPressed: () {}))
            ],
          ),
        ),
      );
    });
  }
}
