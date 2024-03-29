import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/datasources/local/dao/cart_dao.dart';
import '../../../../domain/entities/Item.dart';
import '../../../controller/cart_controller.dart';
import 'add_to_cart.dart';

class CatalogItem extends StatelessWidget {
  CatalogItem(
      {Key? key, required this.catalog, required this.dao, required this.index})
      : super(key: key);

  final Item catalog;
  final CartDao dao;
  int index;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
            color: cartController.isSelected(catalog)
                ? Colors.grey[300]
                : Colors.white,
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
                      color: cartController.isSelected(catalog)
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
                  firstWordLength(catalog.name).length > 12
                      ? Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          width: 150,
                          child: Text(
                            '${firstWordLength(catalog.name)}-',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                            maxLines: 1,
                          ))
                      : Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          width: 150,
                          child: Text(
                            catalog.name,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                            maxLines: 2,
                          )),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      catalog.desc,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
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
                      AddToCart(
                        catalog: catalog,
                        dao: dao,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  String firstWordLength(String s) {
    s = s.split(' ').first;
    return s;
  }
}
