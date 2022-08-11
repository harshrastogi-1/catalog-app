import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;

import 'data/datasources/local/database/database.dart';
import 'presentation/app.dart' show MyApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('cart_system.db').build();
  final dao = database.cartDao;
  runApp(MyApp(dao: dao,));
}
