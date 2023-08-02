import 'package:flutter/foundation.dart';

class Products {

  String? photoUrl;
  String? name;
  double? price;
  String? createdAt;
  String? description;
  int? id;
  String? category;
  String? updatedAt;

  Products(
      {this.photoUrl,
        this.name,
        this.price,
        this.createdAt,
        this.description,
        this.id,
        this.category,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photo_url'];
    name = json['name'];
    price = json['price'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    category = json['category'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo_url'] = this.photoUrl;
    data['name'] = this.name;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['id'] = this.id;
    data['category'] = this.category;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


