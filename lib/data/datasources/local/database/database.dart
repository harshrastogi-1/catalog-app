import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/cart_dao.dart';
import '../entities/Cart.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Cart])
abstract class AppDatabase extends FloorDatabase {
  CartDao get cartDao;
}
