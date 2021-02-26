


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class CartBloc {

   var  CartCount = 0 ;
  final apiProvider = RetrofitClientInstance.getInstance();




  final _cartDataa = PublishSubject<List<CartDataa>>();
  Stream<List<CartDataa>> get fetchCart => _cartDataa.stream;








  addCartData( int product_id,int weight , BuildContext context) {



    var addBask = AddCart();
    addBask.product_id = product_id;
    addBask.weight = weight;

    addBask.quantity = 1;

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addCart(addBask).then((value)=>{


        if(value.data!= null){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }







  deleteCart( String path_id, BuildContext context) {
    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().deleteCart(path_id).then((value)=>{


        if(value.status_code== 200){
          Helper.loadingSuccessful("${value.message}"),

       getCart()


        } else

          Helper.loadingFailed("${value.message}")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }







  getCart() async{
    CartData item = await apiProvider.getDataService().getCart();
    CartCount  = item.dataa.length;
    _cartDataa.sink.add(item.dataa);
  }






  dispose() {

    _cartDataa.drain();

  }

  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final cartBloc = CartBloc();



