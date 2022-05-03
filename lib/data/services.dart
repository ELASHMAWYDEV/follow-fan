import 'package:follow_fan/utils/services/api_service.dart';
import 'package:get/get.dart';

abstract class Services {
  static String registerUser = "register"; //POST
  static String myLinks = "links"; //GET
  static String linkTypes = "links/types"; //GET
  static String addLink = "links"; //PUT
  static String cancelLink = "links"; //DELETE
  static String myTransactions = "transactions"; //GET
  static String chargePoints = "chargePoints"; //POST
  static String earnPoints = "earnPoints"; //GET
  static String confirmEarnPoints = "earnPoints"; //POST
  static String help = "help"; //POST

  final ApiService _api = Get.find<ApiService>();
  ApiService get api => _api;
}
