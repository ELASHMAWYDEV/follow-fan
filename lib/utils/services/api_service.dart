import 'package:dio/dio.dart';
import 'package:follow_fan/data/models/response_model.dart';
import 'package:follow_fan/ui/components/alert_prompt_box.dart';
import 'package:follow_fan/ui/components/loader.dart';
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
    dio.options.baseUrl = "";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  Future<T?> request<T>(String endPoint, String method,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParamters,
      String contentType = "application/x-www-form-urlencoded",
      bool loaderEnabled = true,
      bool showSuccessMessage = false}) async {
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
        throw "CHECKINTERNET".tr;
      }

      //Parse response
      final dataModel = ResponseModel.fromJson(response.data);
      if (dataModel.status == false) throw dataModel.message;

      if (loaderEnabled) Loader.stopLoading();
      if (showSuccessMessage)
        AlertPromptBox.showSuccess(message: "${dataModel.message}");
      return dataModel.data;
    } catch (e) {
      if (loaderEnabled) Loader.stopLoading();
      AlertPromptBox.showError(error: "SOMETHING_WENT_WRONG".tr);
      return null;
    }
  }

  Future<T?> requestOrder<T>(String endPoint, String method,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParamters,
      String contentType = "application/x-www-form-urlencoded",
      bool loaderEnabled = true}) async {
    try {
      if (loaderEnabled) Loader.startLoading();
      Response response = await dio.request<T>(endPoint,
          data: data ?? {},
          queryParameters: queryParamters,
          options: Options(method: method, contentType: contentType, headers: {
            "Authorization": "Bearer ${Get.find<StorageService>().token}",
            "Accept-Langugage":
                Get.find<LocalizationService>().activeLocale.toString(),
            "Content-Type": "application/json; charset=utf-8"
          }));

      if (response.statusCode != 200) {
        throw "CHECKINTERNET".tr;
      }

      //Parse response
      final dataModel = ResponseModel.fromJson(response.data);
      if (dataModel.status == false) throw dataModel.message;

      if (loaderEnabled) Loader.stopLoading();
      // if (showSuccessMessage)
      //   AlertPromptBox.showSuccess(message: "${dataModel.message}");
      return dataModel.data;
    } catch (e) {
      print("Error: $e");
      if (loaderEnabled) Loader.stopLoading();
      AlertPromptBox.showError(error: "SOMETHING_WENT_WRONG".tr);
      return null;
    }
  }
}
