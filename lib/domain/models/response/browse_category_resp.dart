import 'dart:convert';

import '../../../utils/tools/melody_util.dart';

BrowseCategoriesResponse browseCategoriesResponseFromJson(String str) =>
    BrowseCategoriesResponse.fromJson(json.decode(str));

String browseCategoriesResponseToJson(BrowseCategoriesResponse data) =>
    json.encode(data.toJson());

class BrowseCategoriesResponse {
  final Categories? categories;
  final String? errorMessage;
  final int? errorCode;

  BrowseCategoriesResponse({
    this.errorMessage,
    this.categories,
    this.errorCode,
  });

  factory BrowseCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      BrowseCategoriesResponse(
        errorCode: 0,
        errorMessage: "",
        categories: json["categories"].runtimeType.toString() ==
                KUtils.dataTypeJsonValidator
            ? Categories.fromJson(json["categories"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMessage": errorMessage,
        "categories": categories?.toJson(),
      };
}

class Categories {
  final String? href;
  final List<Category>? items;
  final int? limit;
  final String? next;
  final int? offset;
  final String? previous;
  final int? total;

  Categories({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        href: json["href"],
        items: json["items"].runtimeType.toString() ==
                KUtils.dataTypeListValidator
            ? List<Category>.from(
                json["items"].map(
                  (x) =>
                      x.runtimeType.toString() == KUtils.dataTypeJsonValidator
                          ? Category.fromJson(x)
                          : null,
                ),
              )
            : [],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

class Category {
  final List<Icon>? icons;
  final String? name;
  final String? href;
  final String? id;

  Category({
    this.href,
    this.id,
    this.icons,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        href: json["href"],
        id: json["id"],
        icons: json["icons"] == null
            ? []
            : List<Icon>.from(json["icons"]!.map((x) => Icon.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "id": id,
        "icons": icons == null
            ? []
            : List<dynamic>.from(icons!.map((x) => x.toJson())),
        "name": name,
      };
}

class Icon {
  final int? height;
  final String? url;
  final int? width;

  Icon({
    this.height,
    this.url,
    this.width,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
