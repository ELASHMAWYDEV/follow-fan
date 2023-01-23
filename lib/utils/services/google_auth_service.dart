import 'package:follow_fan/data/models/google_account_model.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService extends GetxService {
  GoogleAuthService(this.googleSignIn);

  final GoogleSignIn googleSignIn;
  GoogleSignInAccount? _userData;
  GoogleSignInAccount? get userData => _userData;

  static GoogleAuthService init() {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          "741148431451-bu4vhul1slsq36rguvje7ehjmbdrb89j.apps.googleusercontent.com",
      scopes: [
        'email',
      ],
    );
    return GoogleAuthService(googleSignIn);
  }

  Future<void> signinWithGoogle() async {
    try {
      GoogleSignInAccount? result = await googleSignIn.signIn();

      if (result != null) {
        _userData = result;
        print(userData);
        Get.find<StorageService>().googleAccount = GoogleAccountModel(
            displayName: _userData?.displayName,
            email: _userData?.email,
            id: _userData?.id,
            photoUrl: _userData?.photoUrl);

        AlertPromptBox.showSuccess(
            title: "تم تسجيل الدخول",
            message: "مرحبا بك ${_userData?.displayName}");
      }
    } catch (e) {
      print(e);
      AlertPromptBox.showError(error: "$e");
    } finally {
      Get.forceAppUpdate();
    }
  }

  Future<void> logoutFromGoogle() async {
    try {
      GoogleSignInAccount? result = await googleSignIn.disconnect();
      _userData = result;

      //Remove account from storage
      Get.find<StorageService>().googleAccount = null;
    } catch (e) {
      print(e);
      AlertPromptBox.showError(error: "$e");
    } finally {
      Get.forceAppUpdate();
    }
  }
}
