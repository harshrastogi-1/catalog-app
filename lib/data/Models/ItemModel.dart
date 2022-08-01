import '../../domain/entities/Item.dart' show Item;

class ItemModel extends Item {
  ItemModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    // required this.selected
  }) : super(
            id: id,
            image: image,
            color: color,
            desc: desc,
            name: name,
            price: price);

  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["id"] as int,
      name: json["name"] as String,
      desc: json["desc"] as String,
      price: json["price"] as num,
      color: json["color"] as String,
      image: json["image"] as String,
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
