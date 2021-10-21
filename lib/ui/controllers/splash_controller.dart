import 'package:follow_fan/data/services/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthService authService = AuthService();

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(milliseconds: 1800), () async {
      //Register the user
      await register().then(
          (_) => Get.toNamed("/home") //What ever happens, just navigate to home
          );
    });
  }

  Future<void> register() async => await authService.register();
}
