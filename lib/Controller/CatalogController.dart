import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping/Models/Catalog.dart';

class CatalogController extends GetxController {

  List product = [].obs;
  List<Item> cartItem = List<Item>.empty().obs;
// add item to the cart
  addToCart(Item item) {
    print("calling addToCart");
    cartItem.add(item);
  }

// remove item from the cart
  removeFromCart(Item item) {
    print("calling RemoveFromCart");
    cartItem.remove(item);
  }

  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  bool isSelected(item) {

    var isInCart = cartItem.contains(item);
    // isInCart = !isInCart;
    print(isInCart);
    return isInCart;
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = json.decode(catalogJson);
    var productsData = decodedData["products"];
    product = List.from(productsData)
        .map<Item>((item) => Item.fromJson(item))
        .toList();
  }

  addToFavorites(id) {
    var index = product.indexWhere((element) => element.id == id);
    product[index].selected = !product[index].selected;
    update();
  }
}
