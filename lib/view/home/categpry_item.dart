import 'dart:convert';

import './../../utils/tools/melody_util.dart';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  final String? message;
  final String? error;
  final List<CategoryItem>? categories;

  CategoryResponse({
    this.message,
    this.error,
    this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        message: json["message"].toString(),
        error: json["error"].toString(),
        categories:
            json['data'].runtimeType.toString() == KUtils.dataTypeListValidator
                ? (List<CategoryItem>.from(json["data"].map((x) =>
                    x.runtimeType.toString() == KUtils.dataTypeJsonValidator
                        ? CategoryItem.fromJson(x)
                        : null)))
                : [],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class CategoryItem {
  final String? slug;
  final String? asset;
  final String? name;

  CategoryItem({
    this.slug,
    this.asset,
    this.name,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        slug: json["slug"].toString(),
        asset: json["asset"].toString(),
        name: json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "asset": asset,
        "name": name,
      };
}
