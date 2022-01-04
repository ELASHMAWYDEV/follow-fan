import 'dart:convert';

class LinkModel {
  String linkId;
  String status;
  int usedPoints;
  String createDate;
  String type;
  int originalPoints;
  int remainingPoints;
  int reactions;
  String link;
  String userId;
  String videoId;
  int watchTimeInSeconds;
  String svgCode;
  String typeTitle;
  int pointsEarning;

  LinkModel({
    required this.linkId,
    required this.status,
    required this.usedPoints,
    required this.createDate,
    required this.type,
    required this.originalPoints,
    required this.remainingPoints,
    required this.reactions,
    required this.link,
    required this.userId,
    required this.videoId,
    required this.watchTimeInSeconds,
    required this.svgCode,
    required this.typeTitle,
    required this.pointsEarning,
  });

  factory LinkModel.fromJson(Map<String, dynamic> parsedJson) {
    return LinkModel(
      linkId: parsedJson['_id'] ?? "",
      status: parsedJson['status'] ?? "",
      usedPoints: parsedJson['usedPoints'] ?? 0,
      createDate: parsedJson['createDate'] ?? "",
      type: parsedJson['type'] ?? "",
      originalPoints: parsedJson['originalPoints'] ?? 0,
      remainingPoints: parsedJson['remainingPoints'] ?? 0,
      reactions: parsedJson['reactions'] ?? 0,
      link: parsedJson['link'] ?? "",
      userId: parsedJson['userId'] ?? "",
      videoId: parsedJson['videoId'] ?? "",
      watchTimeInSeconds: parsedJson['watchTimeInSeconds'] ?? 0,
      svgCode: parsedJson['svgCode'] ?? "",
      typeTitle: parsedJson['typeTitle'] ?? "",
      pointsEarning: parsedJson['pointsEarning'] ?? 0,
    );
  }

  static List<LinkModel> listFromJson(List<dynamic> list) {
    List<LinkModel> rows = list.map((i) => LinkModel.fromJson(i)).toList();
    return rows;
  }

  static List<LinkModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<LinkModel>((json) => LinkModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        '_id': linkId,
        'linkId': linkId,
        'status': status,
        'usedPoints': usedPoints,
        'createDate': createDate,
        'type': type,
        'originalPoints': originalPoints,
        'remainingPoints': remainingPoints,
        'reactions': reactions,
        'link': link,
        'userId': userId,
        'videoId': videoId,
        'watchTimeInSeconds': watchTimeInSeconds,
        'svgCode': svgCode,
        'typeTitle': typeTitle,
        'pointsEarning': pointsEarning,
      };
}
