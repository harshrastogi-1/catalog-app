import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../pages/cart_page/cart_widget/cart_list.dart';
import '../../pages/cart_page/cart_widget/cart_total.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Get.back(),
          color: Colors.black,
        ),
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 32, right: 32, left: 32),
              child: CartList(),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Text(
                  "Total Amount  of ${cartController.count} item :",
                  style: Theme.of(context).textTheme.headline5,
                )),
          ),
          const CartTotal(),
        ],
      ),
    );
  }
}
