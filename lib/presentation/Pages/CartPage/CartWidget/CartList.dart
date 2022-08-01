import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/cart/cartController.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Get.put(CartController());
    return cart.cartItem.isEmpty
        ? const Center(
            child: Text(
            "Please add Item to the cart...",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ))
        : Obx(
            () => ListView.builder(
              itemCount: cart.cartItem.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.done),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cart.removeFromCart(cart.cartItem[index]);
                    Get.snackbar("Item deleted successfully...", "",
                        dismissDirection: DismissDirection.horizontal,
                        margin: const EdgeInsets.all(20));
                  },
                ),
                title: Text(cart.cartItem[index].name),
              ),
            ),
          );
  }
}
