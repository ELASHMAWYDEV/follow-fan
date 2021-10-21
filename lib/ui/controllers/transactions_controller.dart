import 'package:follow_fan/data/models/transaction_model.dart';
import 'package:follow_fan/data/services/transactions_services.dart';
import 'package:get/get.dart';

class TransactionsController extends GetxController {
  TransactionsService service = TransactionsService();

  List<TransactionModel> transactions = [];

  @override
  onReady() async {
    await getMyTransactions();
    super.onReady();
  }

  String getTransactionType(String status) {
    switch (status) {
      case "addLink":
        return "اضافة رابط";
      case "earnPoints":
        return "ربح نقاط";
      case "cancelLink":
        return "الغاء رابط";
      case "chargePoints":
        return "شحن نقاط";
      case "welcomeBonus":
        return "مكافأة ترحيبية";
      default:
        return "غير معروف";
    }
  }

  Future<void> getMyTransactions() async {
    transactions = await service.getMyTransactions();
    update();
  }
}
