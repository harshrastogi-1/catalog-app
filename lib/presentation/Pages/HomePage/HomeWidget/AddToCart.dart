import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/Item.dart';
import '../../../Controller/cart/cartController.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final cartController =Get.find<CartController>();
    // final cart = Get.put(CartController());
    //  isInCart = false.obs;
    // var isInCart = cart.cartItem.contains(catalog).obs;
    // print(cart.cartItem.contains(catalog));
    return Obx(
      () => cartController.isSelected(catalog)
          ? IconButton(
              onPressed: () {
                cartController.removeFromCart(catalog);
              },
              icon: const Icon(Icons.delete))
          : IconButton(
              onPressed: () {
                // isInCart.value = !isInCart.value;
                cartController.addToCart(catalog);
              },
              icon: const Icon(Icons.add)),
    );
  }
}
