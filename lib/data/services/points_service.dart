import 'package:follow_fan/data/models/transaction_model.dart';

import '../services.dart';

class PointsService extends Services {
  Future<String?> chargePoints(int points) async =>
      await api.request(Services.chargePoints, "POST",
          data: {"points": points, "paymentMethod": "paypal"}).then((data) {
        if (data == null) return null;
        print("transaction id: ${data["transactionId"]}");
        return data["transactionId"];
      });
}
