import 'package:get/get.dart';

import '/data/Models/item_model.dart';
import '/domain/usecases/fetch_data_use_case.dart';

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
      var productsData = await FetchDataUseCase().execute();
      product.assignAll(productsData);
      // product.assignAll(List.from(productsData)
      //     .map<ItemModel>((item) => ItemModel.fromJson(item))
      //     .toList());
    } finally {
      isLoading(false);
    }
  }
}
