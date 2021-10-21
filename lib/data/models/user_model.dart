import 'dart:convert';

class UserModel {
  String userId;
  int activePoints;
  int pendingPoints;
  int activeLinks;
  int pendingLinks;

  UserModel({
    required this.userId,
    required this.activePoints,
    required this.pendingPoints,
    required this.activeLinks,
    required this.pendingLinks,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      userId: parsedJson['userId'] ?? "",
      activePoints: parsedJson['points']['active'] ?? 0,
      pendingPoints: parsedJson['points']['pending'] ?? 0,
      activeLinks: parsedJson['links']['active'] ?? 0,
      pendingLinks: parsedJson['links']['pending'] ?? 0,
    );
  }

  static List<UserModel> listFromJson(List<dynamic> list) {
    List<UserModel> rows = list.map((i) => UserModel.fromJson(i)).toList();
    return rows;
  }

  static List<UserModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'points': {
          'active': activePoints,
          'pending': pendingPoints,
        },
        'links': {
          'active': activeLinks,
          'pending': pendingLinks,
        }
      };
}
