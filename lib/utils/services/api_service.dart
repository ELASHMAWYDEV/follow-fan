import 'package:dio/dio.dart';
import 'package:follow_fan/data/models/response_model.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/ui/components/loader.dart';
import 'package:follow_fan/utils/constants.dart';
import 'package:follow_fan/utils/services/localization_service.dart';
import 'package:follow_fan/utils/services/storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get/get.dart' hide Response, FormData;

class ApiService extends GetxService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }
  factory ApiService() {
    return _apiUtil;
  }

  Dio dio = new Dio();

  void init() {
    dio.options.baseUrl = kApiUrl;
    dio.options.connectTimeout = 7000;
    dio.options.receiveTimeout = 20000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  Future<dynamic> request<T>(String endPoint, String method,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParamters,
      String contentType = "application/json",
      bool loaderEnabled = true,
      bool showSuccessMessage = false,
      VoidCallback? onDismiss}) async {
    try {
      if (loaderEnabled) Loader.startLoading();
      Response response = await dio.request<T>(endPoint,
          data: data ?? {},
          queryParameters: queryParamters,
          options: Options(method: method, contentType: contentType, headers: {
            "Authorization": "Bearer ${Get.find<StorageService>().token}",
            "Accept-Langugage":
                Get.find<LocalizationService>().activeLocale.toString(),
          }));

      if (response.statusCode != 200) {
        throw "من فضلك تحقق من اتصالك بالانترنت وحاول مرة إخري";
      }

      if (loaderEnabled) Loader.stopLoading();

      //Parse response
      final dataModel = ResponseModel.fromJson(response.data);
      if (dataModel.status == false) {
        AlertPromptBox.showError(
            error: dataModel.message, onDismiss: onDismiss);
        return false; //In case you are waiting for just the request failure
      }

      if (showSuccessMessage)
        AlertPromptBox.showSuccess(
            message: "${dataModel.message}", onDismiss: onDismiss);

      if (dataModel.status && dataModel.data == null)
        return true; //In case you are waiting for just the request success

      return dataModel.data;
    } catch (e) {
      if (loaderEnabled) Loader.stopLoading();
      AlertPromptBox.showError(
          error: "حدث خطأ ما ، يرجي المعاودة لاحقا", onDismiss: onDismiss);
      return null;
    }
  }
}
