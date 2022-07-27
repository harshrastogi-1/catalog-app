import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Controller/CatalogController.dart';
import 'HomeWidget/CatalogHeader.dart';
import 'HomeWidget/CatalogList.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final productController = Get.put(CatalogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 5, 34, 58),
        onPressed: () => Get.toNamed('/CartPage'),
        child: Stack(
          children: [
            const Positioned(
                top: 15, right: 20, child: Icon(Icons.shopping_bag_rounded)),
            Positioned(
                right: 8,
                bottom: 15,
                child: Obx(
                  () => Text(
                    "${productController.count}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CatalogHeader(),
            const SizedBox(
              height: 20,
            ),
            SearchBar(),
            Obx(()=>
              productController.product.isNotEmpty
                  ? Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CatalogList()),
                    )
                  : const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            )
          ],
        ),
      )),
    );
  }
}

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final controller = TextEditingController();
  final productController = Get.put(CatalogController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
        onChanged: searchItem,
        decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey[500],
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none)),

        // color: Colors.amber,
      ),
    );
  }

  void searchItem(String query) {
    final suggestions = productController.product.where((id) {
      final data = id.name.toLowerCase();
      final input = query.toLowerCase();
      return productController.product.contains(query);
    });
  }
}
