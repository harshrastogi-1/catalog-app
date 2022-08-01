import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';

import '../../../data/Models/ItemModel.dart';
import '../../../domain/entities/Item.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  List product = [].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    try {
      isLoading(true);
      final catalogJson =
          await rootBundle.loadString("assets/files/catalog.json");
      // List<Item> decodedData =
      //     List<Item>.from(jsonDecode(catalogJson).map((x) => Item.fromJson(x)));

      final decodedData = json.decode(catalogJson);
      var productsData = decodedData["products"];
      product.assignAll(List.from(productsData)
          .map<Item>((item) => ItemModel.fromJson(item)));

      // product = List.from(productsData)
      //     .map<Item>((item) => Item.fromJson(item))
      //     .toList();
      // ignore: unrelated_type_equality_checks, unnecessary_null_comparison

    } finally {
      isLoading(false);
    }
  }
}
