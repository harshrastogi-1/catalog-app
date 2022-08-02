import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../home_detail.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  CatalogList({Key? key}) : super(key: key);
  final productController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productController.product.length,
      itemBuilder: (BuildContext context, int index) {
        final catalog = productController.product[index];
        return InkWell(
          onTap: () => Get.to(()=>HomeDetails(catalog: catalog)),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}
