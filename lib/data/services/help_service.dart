import 'package:follow_fan/data/models/user_model.dart';
import 'package:follow_fan/data/services.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';

class HelpService extends Services {
  Future<bool> sendMessage(
          {required String message,
          required String name,
          required String phone,
          required String email}) async =>
      await api.request(Services.help, "POST", showSuccessMessage: true,
          onDismiss: () {
        Get.offAllNamed("/home");
      }, data: {
        "message": message,
        "name": name,
        "phone": phone,
        "email": email,
      }).then((data) {
        return true;
      });
}
