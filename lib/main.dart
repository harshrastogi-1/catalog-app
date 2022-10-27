import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'data/datasources/local/database/database.dart';
import 'presentation/app.dart' show MyApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  final database =
      await $FloorAppDatabase.databaseBuilder('cart_system.db').build();
  final dao = database.cartDao;
  runApp(MyApp(dao: dao,));
}
