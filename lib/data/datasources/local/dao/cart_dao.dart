import 'package:floor/floor.dart';

import '../entities/Cart.dart';

@dao
abstract class CartDao {
  @Query('SELECT * FROM Cart WHERE  uid=:uid')
  Stream<List<Cart>> getAllItemInCartByUid(String uid);

  @Query('SELECT * FROM Cart WHERE uid=:uid AND id=:id')
  Future<Cart?> getItemInCartByUid(String uid,int id);

  @Query('DELETE FROM Cart WHERE uid=:uid ')
  Stream<List<Cart>> clearCartByUid(String uid);

  @insert
  Future<void> insertData(Cart item);

  @update
  Future<int> updateData(Cart item);

  @delete
  Future<int> deleteData(Cart item);
}
