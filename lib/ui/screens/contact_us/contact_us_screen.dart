import 'package:flutter/material.dart';
import 'package:follow_fan/ui/components/header.dart';
import 'package:follow_fan/ui/components/main_button.dart';
import 'package:follow_fan/ui/components/main_layout.dart';
import 'package:follow_fan/ui/components/text_box.dart';
import 'package:follow_fan/ui/controllers/contact_us_controller.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  ContactUsController controller = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      isBackEnabled: true,
      title: "تواصل معنا",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: size.width * 0.6,
            child: Image.asset("assets/images/logo.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "نحن موجودون دائما لمساعدتك",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextBox(label: "الاسم", controller: controller.nameController),
          SizedBox(
            height: 20,
          ),
          TextBox(
            label: "الهاتف",
            controller: controller.numberController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          TextBox(
              label: "بريدك الالكتروني",
              controller: controller.emailController),
          SizedBox(
            height: 20,
          ),
          TextBox(
            label: "...ما الذي تريده",
            controller: controller.messageController,
            isLarge: true,
          ),
          SizedBox(
            height: 25,
          ),
          MainButton(title: "ارسال", onPressed: () {}),
        ],
      ),
    );
  }
}
