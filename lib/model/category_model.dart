// To parse this JSON data, do
//
//     final servicesCategory = servicesCategoryFromJson(jsonString);

import 'dart:convert';

ServicesCategory servicesCategoryFromJson(String str) => ServicesCategory.fromJson(json.decode(str));

String servicesCategoryToJson(ServicesCategory data) => json.encode(data.toJson());

class ServicesCategory {
    ServicesCategory({
        this.responseCode,
        this.responseMessage,
        this.status,
        this.categories,
        this.total,
    });

    int? responseCode;
    String? responseMessage;
    bool? status;
    List<CategoryElement>? categories;
    int? total;

    factory ServicesCategory.fromJson(Map<String, dynamic> json) => ServicesCategory(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
        status: json["status"],
        categories: json["categories"] == null ? [] : List<CategoryElement>.from(json["categories"]!.map((x) => CategoryElement.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
        "status": status,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "total": total,
    };
}

class CategoryElement {
    CategoryElement({
        this.id,
        this.name,
        this.image,
        this.description,
        this.v,
    });

    String? id;
    String? name;
    String? image;
    String? description;
    int? v;

    factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "description": description,
        "__v": v,
    };
}
