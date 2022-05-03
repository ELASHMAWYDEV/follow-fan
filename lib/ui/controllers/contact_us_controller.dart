import 'package:flutter/cupertino.dart';
import 'package:follow_fan/data/services/help_service.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final HelpService helpService = HelpService();

  Future<void> sendMessage() async {
    final bool isSent = await helpService.sendMessage(
        message: messageController.text,
        phone: phoneNumberController.text,
        email: emailController.text,
        name: nameController.text);
  }
}
