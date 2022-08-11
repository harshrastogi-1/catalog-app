import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/data/datasources/local/dao/cart_dao.dart';
import 'package:shopping/presentation/pages/cart_page/cart_widget/price.dart';

import '../../../data/datasources/local/const.dart';
import '../../controller/cart_controller.dart';
import 'cart_widget/cart_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key, required this.dao}) : super(key: key);
  final CartDao dao;
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
        body: StreamBuilder(
            stream: dao.getAllItemInCartByUid(UID),
            builder: (context, snapshot) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, right: 10, left: 10),
                      child: CartList(
                        dao: dao,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total Amount  of ${cartController.count} item :",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  SizedBox(
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
                                        shape: MaterialStateProperty.all(
                                            const StadiumBorder()),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                    onPressed: () {
                                      Get.snackbar(
                                          "Buying Not Supported Yet...",
                                          "Come back Soon",
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          margin: const EdgeInsets.all(20));
                                    },
                                    child: const Text('BUY')),
                              ),
                            ],
                          )))
                ])));
  }
}
