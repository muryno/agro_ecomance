
import 'package:agro_ecomance/entity/myEntity/CartEntity.dart';
import 'package:agro_ecomance/entity/myEntity/WishEntity.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:floor/floor.dart';

@dao
abstract class WishDataDao {


  @insert
  Future<void> insertSingleCart(Wishe person);

  @insert
  Future<void> insertAllWishe(List<Wishe> person);



  @Query("update WishEntity SET quantity = :quantity WHERE id = :tid")
  Future<void> updateQuantity(int quantity,int tid);



  @Query("select * from WishEntity")
  Stream<List<Wishe>> findAllWish();

  @Query("DELETE from WishEntity")
  Future<void> nukeWishe();


}