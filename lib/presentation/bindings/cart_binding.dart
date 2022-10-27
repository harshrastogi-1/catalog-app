import 'package:get/get.dart';

import '../../data/datasources/local/dao/cart_dao.dart';
import '../controller/cart_controller.dart';

class CartBinding extends Bindings {
  final CartDao dao;

  CartBinding(this.dao);
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(dao));
  }
}
