import 'dart:convert';

import 'link_sub_category_model.dart';

class LinkCategoryModel {
  String iconPath;
  List<LinkSubCategoryModel> types;

  LinkCategoryModel({
    required this.iconPath,
    required this.types,
  });

  factory LinkCategoryModel.fromJson(Map<String, dynamic> parsedJson) {
    return LinkCategoryModel(
      iconPath: parsedJson['iconPath'],
      types: parsedJson['types'] == null
          ? []
          : LinkSubCategoryModel.listFromJson(parsedJson['types']),
    );
  }

  static List<LinkCategoryModel> listFromJson(List<dynamic> list) {
    List<LinkCategoryModel> rows =
        list.map((i) => LinkCategoryModel.fromJson(i)).toList();
    return rows;
  }

  static List<LinkCategoryModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<LinkCategoryModel>((json) => LinkCategoryModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'iconPath': iconPath,
        'types': types,
      };
}
