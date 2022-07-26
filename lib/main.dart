import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Pages/CartPage/CartPage.dart';
import 'package:shopping/Pages/HomeDetail.dart';

import './Pages/HomePage/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StateManagement with getx',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/CartPage', page: () => const CartPage()),
      ],
    );
  }
}
