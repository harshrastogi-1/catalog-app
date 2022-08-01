import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/presentation/Controller/cart/cartBinding.dart';
import 'package:shopping/presentation/Controller/home/homeBinding.dart';

import 'Pages/CartPage/CartPage.dart';
import 'Pages/HomePage/HomePage.dart';

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
