import 'package:get/get.dart';
import '../../domain/entities/Item.dart';

class CartController extends GetxController {
  List<Item> cartItem = List<Item>.empty().obs;

// add item to the cart
  addToCart(Item item) {
    // ignore: avoid_print
    print("calling addToCart");
    cartItem.add(item);
  }

// remove item from the cart
  removeFromCart(Item item) {
    // ignore: avoid_print
    print("calling RemoveFromCart");
    cartItem.remove(item);
  }

  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;

  bool isSelected(item) {
    var isInCart = cartItem.contains(item);
    // ignore: avoid_print
    print(isInCart);
    return isInCart;
  }
}
