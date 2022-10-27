import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:get/get.dart';
import 'package:shopping/data/datasources/local/dao/cart_dao.dart';

import '../../../controller/cart_controller.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key, required this.dao}) : super(key: key);

  final CartDao dao;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return ListView.builder(
        itemCount: cartController.items.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                    child: Image(
                      image: NetworkImage(cartController.items[index].imageUrl),
                      fit: BoxFit.fill,
                    ),
                  )),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8, top: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              cartController.items[index].name,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            "\$${cartController.items[index].price}",
                          ),
                        )
                      ]),
                ),
              ),
              Center(
                child: ElegantNumberButton(
                    initialValue: cartController.items[index].quantity,
                    buttonSizeWidth: 25,
                    buttonSizeHeight: 25,
                    color: Theme.of(context).canvasColor,
                    minValue: 0,
                    maxValue: 100,
                    decimalPlaces: 0,
                    onChanged: ((value) async {
                      cartController.items[index].quantity = value.toInt();
                      if (cartController.items[index].quantity.isEqual(0)) {
                        await dao.deleteData(cartController.items[index]);
                        cartController.items
                            .remove(cartController.items[index]);
                      }else{
                        await dao.updateData(cartController.items[index]);
                      }
                      
                    })),
              )
            ]),
          );
        });
  }
}
