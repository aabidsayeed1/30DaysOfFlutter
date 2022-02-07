import 'dart:convert';

import 'package:flutter/material.dart';
class CatalogModel{
  static List<Item> items
= [
  Item(
  id:1,
  name:"iPhone 12 Pro",
  desc:"Apple iPhone 12th generation",
  color:"#33505a",
  price: 99,
  image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
];
// Get item by id

 Item getById(int id) => items.firstWhere((element) => element.id ==id, orElse: null);

// get item by position

 Item getByPosition(int pos) =>items[pos];


}
class Item {
final int id;
final String name;
final String desc;
final String color;
final num price;
final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.price,
    required this.image,
  });
 
  


  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? color,
    num? price,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'color': color,
      'price': price,
      'image': image,  
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      color: map['color'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, color: $color, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.color == color &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      color.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}



