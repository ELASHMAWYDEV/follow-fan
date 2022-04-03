import 'package:follow_fan/data/models/transaction_model.dart';

import '../services.dart';

class TransactionsService extends Services {
  Future<List<TransactionModel>> getMyTransactions() async => await api
          .request(Services.myTransactions, "GET", showErrorMessage: false)
          .then((data) {
        if (data == null) return [];
        final List<TransactionModel> transactions =
            TransactionModel.listFromJson(data["transactions"]);
        return transactions;
      });
}
