import 'dart:convert';

class LinkSubCategoryModel {
  String title;

  LinkSubCategoryModel({
    required this.title,
  });

  factory LinkSubCategoryModel.fromJson(Map<String, dynamic> parsedJson) {
    return LinkSubCategoryModel(
      title: parsedJson['title'],
    );
  }

  static List<LinkSubCategoryModel> listFromJson(List<dynamic> list) {
    List<LinkSubCategoryModel> rows =
        list.map((i) => LinkSubCategoryModel.fromJson(i)).toList();
    return rows;
  }

  static List<LinkSubCategoryModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<LinkSubCategoryModel>(
            (json) => LinkSubCategoryModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}
