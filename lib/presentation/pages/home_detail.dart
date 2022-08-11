import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/data/datasources/local/dao/cart_dao.dart';

import '../../domain/entities/Item.dart';
import 'home_page/home_widget/add_to_cart.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({
    Key? key,
    required this.catalog, required this.dao,
  }) : super(key: key);

  final Item catalog;
  final CartDao dao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: const EdgeInsets.only(right: 8, left: 15),
          children: [
            Text(
              '\$${catalog.price}',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[600]),
            ),
            SizedBox(
                width: 100,
                height: 50,
                child: AddToCart(catalog: catalog, dao: dao)),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: 350,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 100.0)),
              ),
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Center(child: Image.network(catalog.image)),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(children: [
                Text(
                  catalog.name,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  catalog.desc,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
