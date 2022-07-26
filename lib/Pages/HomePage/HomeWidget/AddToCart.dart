import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/CatalogController.dart';
import '../../../Models/Catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Get.put(CatalogController());
    //  isInCart = false.obs;
    // var isInCart = cart.cartItem.contains(catalog).obs;
    print(cart.cartItem.contains(catalog));
    return Obx(
      () => cart.isSelected(catalog)
          ? IconButton(
              onPressed: () {

                cart.removeFromCart(catalog);
              },
              icon: Icon(Icons.delete))
          : IconButton(
              onPressed: () {
                // isInCart.value = !isInCart.value;
                cart.addToCart(catalog);
              },
              icon: Icon(Icons.add)),
    );
  }
}
