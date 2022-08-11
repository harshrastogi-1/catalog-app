import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasources/local/dao/cart_dao.dart';
import 'bindings/cart_binding.dart';
import 'bindings/home_binding.dart';
import 'pages/cart_page/cart_page.dart';
import 'pages/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dao}) : super(key: key);
  final CartDao dao;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StateManagement with getx',
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => HomePage(dao: dao,),
            bindings: [CartBinding(dao), HomeBinding()]),
        GetPage(
            name: '/CartPage',
            page: () => CartPage(dao:dao),
            binding: CartBinding(dao)),
      ],
    );
  }
}
