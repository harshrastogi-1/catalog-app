import 'package:get/get.dart';
import 'package:shopping/data/datasources/local/const.dart';
import '../../data/datasources/local/dao/cart_dao.dart';
import '../../data/datasources/local/entities/Cart.dart';

class CartController extends GetxController {
  List<Cart> items = List<Cart>.empty().obs;
  final CartDao dao;
  CartController(this.dao);
  getAllCartItems() {
    dao.getAllItemInCartByUid(UID);
  }

  updateToCart(Cart item) {
    dao.updateData(item);
  }

// add item to the cart
  addToCart(Cart item) {
    dao.insertData(item);
  }

// remove item from the cart
  removeFromCart(Cart item) async {
    await dao.deleteData(item);
    
  }

  double get totalPrice => items.isNotEmpty
      ? items
          .map<double>((m) => double.parse(m.price) * m.quantity)
          .reduce((value, element) => value + element)
      : 0;
  int get count => items.isNotEmpty
      ? items
          .map<int>((m) => m.quantity.toInt())
          .reduce((value, element) => value + element)
      : 0;

  bool isSelected(item) {
    var isInCart = items.contains(item);
    // ignore: avoid_print
    print(isInCart);

    return isInCart;
  }
}
