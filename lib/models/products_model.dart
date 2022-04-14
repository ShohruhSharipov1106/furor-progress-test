// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    ProductModel({
        this.id,
        this.productTypeId,
        this.nameUz,
        this.cost,
        this.address,
        this.createdDate,
    });

    int? id;
    int? productTypeId;
    String? nameUz;
    double? cost;
    String? address;
    int? createdDate;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productTypeId: json["product_type_id"],
        nameUz: json["name_uz"],
        cost: json["cost"],
        address: json["address"],
        createdDate: json["created_date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_type_id": productTypeId,
        "name_uz": nameUz,
        "cost": cost,
        "address": address,
        "created_date": createdDate,
    };
}
