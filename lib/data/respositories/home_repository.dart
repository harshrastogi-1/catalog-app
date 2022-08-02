import 'dart:convert';

import 'package:shopping/data/Models/item_model.dart';
import 'package:shopping/data/datasources/catalog_data.dart';
import 'package:shopping/domain/repositories/home_page_repository.dart';

class HomeRepositoryIml extends HomePageRepository {
  @override
  Future<List<dynamic>> fetchData() async {
    final catalogJson = await CatalogData().fetchData();
    final decodedData = json.decode(catalogJson);
    var productsData = decodedData["products"];
    List.from(productsData).map<ItemModel>((item) => ItemModel.fromJson(item));

    return productsData;
  }
}
