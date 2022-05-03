import 'package:follow_fan/data/models/link_model.dart';

import '../services.dart';

class PointsService extends Services {
  Future<String?> chargePoints(int points) async =>
      await api.request(Services.chargePoints, "POST",
          data: {"points": points, "paymentMethod": "paypal"}).then((data) {
        if (data == null) return null;
        print("transaction id: ${data["transactionId"]}");
        return data["transactionId"];
      });

  Future<List<LinkModel>> getEarningLinks() async =>
      await api.request(Services.earnPoints, "GET").then((data) {
        if (data == null) return [];
        return LinkModel.listFromJson(data["links"]);
      });

  Future<int> confirmEarningLink(String linkId) async =>
      await api.request(Services.confirmEarnPoints, "POST",
          loaderEnabled: false, data: {"linkId": linkId}).then((data) {
        if (data == null) return 0;
        return data["points"];
      });
}
