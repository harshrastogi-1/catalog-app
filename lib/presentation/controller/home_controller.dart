import 'package:get/get.dart';

import '/domain/usecases/fetch_data_use_case.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  List product = [].obs;
  List localProduct = [].obs;
  RxString query = RxString('');

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    try {
      isLoading(true);
      var productsData = await FetchDataUseCase().execute();
      product.assignAll(productsData);
      localProduct = product;
      // product.assignAll(List.from(productsData)
      //     .map<ItemModel>((item) => ItemModel.fromJson(item))
      //     .toList());
    } finally {
      isLoading(false);
    }
  }

  List<dynamic> get filteredData {
    if (query.isEmpty) {
      product = localProduct;
      return product;
    }
    return product
        .where((item) =>
            item.name.toLowerCase().contains(query.value.toLowerCase()))
        .toList();
  }

  void search(String query) {
    this.query.value = query;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
