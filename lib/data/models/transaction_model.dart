import 'dart:convert';

class TransactionModel {
  String id;
  String userId;
  String type;
  String status;
  double points;
  MoneyModel? money;
  String createData;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.status,
    required this.points,
    required this.money,
    required this.createData,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> parsedJson) {
    return TransactionModel(
      id: parsedJson['id'] ?? "",
      userId: parsedJson['userId'] ?? "",
      type: parsedJson['type'] ?? "",
      status: parsedJson['status'],
      points:
          parsedJson['points'] != null ? parsedJson['points'].toDouble() : null,
      money: parsedJson['money'] != null
          ? MoneyModel.fromJson(parsedJson["money"])
          : null,
      createData: parsedJson['createData'] ?? "",
    );
  }

  static List<TransactionModel> listFromJson(List<dynamic> list) {
    List<TransactionModel> rows =
        list.map((i) => TransactionModel.fromJson(i)).toList();
    return rows;
  }

  static List<TransactionModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<TransactionModel>((json) => TransactionModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'type': type,
        'status': status,
        'points': points,
        'money': money?.toJson(),
        'createData': createData,
      };
}

class MoneyModel {
  String value;
  String currency;

  MoneyModel({
    required this.value,
    required this.currency,
  });

  factory MoneyModel.fromJson(Map<String, dynamic> parsedJson) {
    return MoneyModel(
      value: parsedJson['value'] ?? "",
      currency: parsedJson['currency'] ?? "",
    );
  }

  static List<MoneyModel> listFromJson(List<dynamic> list) {
    List<MoneyModel> rows = list.map((i) => MoneyModel.fromJson(i)).toList();
    return rows;
  }

  static List<MoneyModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MoneyModel>((json) => MoneyModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'currency': currency,
      };
}
