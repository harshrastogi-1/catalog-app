import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/Item.dart';
import '../../../Controller/cart/cartController.dart';
import 'AddToCart.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    final cart = Get.put(CartController());
    return Obx(
      () => Container(
          width: 150,
          height: 150,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: BoxDecoration(
              color: cart.isSelected(catalog) ? Colors.grey[300] : Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Hero(
                  tag: Key(catalog.id.toString()),
                  child: Container(
                    height: 130,
                    width: 140,
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: cart.isSelected(catalog)
                            ? Colors.white
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.network(
                      catalog.image,
                    ),
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      catalog.name,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(catalog.desc,
                        style: Theme.of(context).textTheme.caption),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: const EdgeInsets.only(right: 15),
                      children: [
                        Text(
                          '\$${catalog.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 40, 82),
                          ),
                        ),
                        AddToCart(catalog: catalog),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
