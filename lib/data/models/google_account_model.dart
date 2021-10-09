import 'dart:convert';

class GoogleAccountModel {
  String? displayName;
  String? email;
  String? id;
  String? photoUrl;

  GoogleAccountModel({
    required this.displayName,
    required this.email,
    required this.id,
    required this.photoUrl,
  });

  factory GoogleAccountModel.fromJson(Map<String, dynamic> parsedJson) {
    return GoogleAccountModel(
      displayName: parsedJson['displayName'],
      email: parsedJson['email'],
      id: parsedJson['id'],
      photoUrl: parsedJson['photoUrl'],
    );
  }

  static List<GoogleAccountModel> listFromJson(List<dynamic> list) {
    List<GoogleAccountModel> rows =
        list.map((i) => GoogleAccountModel.fromJson(i)).toList();
    return rows;
  }

  static List<GoogleAccountModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<GoogleAccountModel>((json) => GoogleAccountModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'email': email,
        'id': id,
        'photoUrl': photoUrl,
      };
}
