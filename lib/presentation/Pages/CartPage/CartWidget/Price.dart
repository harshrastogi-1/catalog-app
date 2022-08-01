import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/cart/cartController.dart';

class Price extends StatelessWidget {
  Price({
    Key? key,
  }) : super(key: key);

  final cartController =Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    // print("price rebuild");
    return Obx(
      () => Text(
        '\$${cartController.totalPrice}',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
