import 'package:follow_fan/utils/services/api_service.dart';
import 'package:get/get.dart';

abstract class Services {
  final ApiService _api = Get.find<ApiService>();
  ApiService get api => _api;
}
