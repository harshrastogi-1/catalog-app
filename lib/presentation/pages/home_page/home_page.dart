import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasources/local/const.dart';
import '../../../data/datasources/local/dao/cart_dao.dart';
import '../../../data/datasources/local/entities/Cart.dart';
import '../../controller/cart_controller.dart';

import '../../controller/home_controller.dart';
import 'home_widget/catalog_header.dart';
import 'home_widget/catalog_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.dao}) : super(key: key);
  final productController = Get.find<HomeController>();
  final cartController = Get.find<CartController>();
  // final productController = Get.put(HomeController());
  // final cartController = Get.put(CartController());
  final CartDao dao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: StreamBuilder(
          stream: dao.getAllItemInCartByUid(UID),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              cartController.items = snapshot.data as List<Cart>;
              return Badge(
                
                position: const BadgePosition(bottom: 0, end: 0),
                animationType: BadgeAnimationType.fade,
                showBadge: true,
                badgeColor: Colors.red,
      
                badgeContent: Text('${cartController.count}'),
                child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 8, 32, 53),
                  onPressed: () => Get.toNamed(
                    '/CartPage',
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
              );
            } else {
              return Container();
            }
          })),
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
            productController.getAdWidget(),
            Obx(
              () => productController.product.isNotEmpty
                  ? Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: CatalogList(dao: dao)),
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
  final productController = Get.put(HomeController());
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
    // final suggestions = productController.product.where((id) {
    //   // final data = id.name.toLowerCase();
    //   // final input = query.toLowerCase();
    //   return productController.product.contains(query);
    // });
  }
}
