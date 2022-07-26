import 'dart:convert';

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  // final bool selected ;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image,
      // required this.selected
      });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      name: json["name"],
      desc: json["desc"],
      price: json["price"],
      color: json["color"],
      image: json["image"],
      // selected: json["selected"],
    );
  }

  toMap() => {
        'id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'color': color,
        'image': image,
        // 'selected': selected
      };
}

