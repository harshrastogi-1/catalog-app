import 'package:get/get.dart';

import 'package:shopping/data/Models/item_model.dart';
import 'package:shopping/data/respositories/home_repository.dart';

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
      var productsData = await HomeRepositoryIml().fetchData();
      // print(productsData);
      product.assignAll(List.from(productsData)
          .map<ItemModel>((item) => ItemModel.fromJson(item)));
    } finally {
      isLoading(false);
    }
  }
}
