import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/cart_binding.dart';
import 'bindings/home_binding.dart';
import 'pages/cart_page/cart_page.dart';
import 'pages/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StateManagement with getx',
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => HomePage(),
            bindings: [CartBinding(), HomeBinding()]),
        GetPage(
            name: '/CartPage',
            page: () => const CartPage(),
            binding: CartBinding()),
      ],
    );
  }
}
