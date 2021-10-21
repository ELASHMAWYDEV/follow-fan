import 'dart:convert';

class LinkTypeModel {
  String type;
  String title;
  bool isActive;
  String? svgCode;
  List<LinkTypeModel> types;
  double? pointsCost;
  double? pointsEarning;

  LinkTypeModel({
    required this.type,
    required this.title,
    required this.isActive,
    required this.svgCode,
    required this.types,
    required this.pointsCost,
    required this.pointsEarning,
  });

  factory LinkTypeModel.fromJson(Map<String, dynamic> parsedJson) {
    return LinkTypeModel(
      type: parsedJson['type'] ?? "",
      title: parsedJson['title'] ?? "",
      isActive: parsedJson['isActive'] ?? false,
      svgCode: parsedJson['svgCode'],
      types: LinkTypeModel.listFromJson(parsedJson['types'] ?? []),
      pointsCost: parsedJson['pointsCost'] != null
          ? parsedJson['pointsCost'].toDouble()
          : null,
      pointsEarning: parsedJson['pointsEarning'] != null
          ? parsedJson['pointsEarning'].toDouble()
          : null,
    );
  }

  static List<LinkTypeModel> listFromJson(List<dynamic> list) {
    List<LinkTypeModel> rows =
        list.map((i) => LinkTypeModel.fromJson(i)).toList();
    return rows;
  }

  static List<LinkTypeModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<LinkTypeModel>((json) => LinkTypeModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'isActive': isActive,
        'svgCode': svgCode,
        'types': types
            .map((item) => {
                  "type": item.type,
                  'title': item.title,
                  'isActive': item.isActive
                })
            .toList(),
        'pointsCost': pointsCost,
        'pointsEarning': pointsEarning,
      };
}
