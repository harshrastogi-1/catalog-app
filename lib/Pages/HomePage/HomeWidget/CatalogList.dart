import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/CatalogController.dart';
import '../../HomeDetail.dart';
import 'CatalogItem.dart';

class CatalogList extends StatelessWidget {
  CatalogList({Key? key}) : super(key: key);
  final productController  = Get.put(CatalogController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productController.product.length,
      itemBuilder: (BuildContext context, int index) {
        final catalog = productController.product[index];
        return InkWell(
          onTap: () => Get.to(HomeDetails(catalog: catalog)),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}
