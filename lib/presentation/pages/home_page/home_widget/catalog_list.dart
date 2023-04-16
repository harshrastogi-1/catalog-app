import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/datasources/local/dao/cart_dao.dart';
import '../../../controller/home_controller.dart';
import '../../home_detail.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  CatalogList({
    Key? key,
    required this.dao,
  }) : super(key: key);
  final productController = Get.find<HomeController>();
  final CartDao dao;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemCount: productController.filteredData.length,
        itemBuilder: (BuildContext context, int index) {
          final catalog = productController.filteredData;
          return InkWell(
            highlightColor: Colors.transparent,
            onTap: () => Get.to(() => HomeDetails(
                  catalog: catalog[index],
                  dao: dao,
                )),
            child: CatalogItem(
              catalog: catalog[index],
              index: index,
              dao: dao,
            ),
          );
        },
      ),
    );
  }
}
