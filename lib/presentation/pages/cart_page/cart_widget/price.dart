import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';

class Price extends StatelessWidget {
  Price({
    Key? key,
  }) : super(key: key);

  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${cartController.totalPrice}',
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
