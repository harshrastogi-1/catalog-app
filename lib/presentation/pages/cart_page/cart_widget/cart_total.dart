import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'price.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("cart Total Rebuild");
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Price(),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    Get.snackbar(
                        "Buying Not Supported Yet...", "Come back Soon",
                        dismissDirection: DismissDirection.horizontal,
                        margin: const EdgeInsets.all(20));
                  },
                  child: const Text('BUY')),
            ),
          ],
        ),
      ),
    );
  }
}
