
import 'package:agro_ecomance/entity/myEntity/CartEntity.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:floor/floor.dart';

@dao
abstract class CartDataDao {


  @insert
  Future<void> insertSingleCart(CartDataa person);

  @insert
  Future<void> insertAllCart(List<CartDataa> person);



  @Query("UPDATE CartEntity SET quantity = :quantity WHERE id = :tid")
  Future<void> updateQuantity(int quantity,int tid);



  @Query("select * from CartEntity")
  Stream<List<CartDataa>> findAllCart();

  @Query("DELETE from CartEntity")
  Future<void> nukeCart();


}