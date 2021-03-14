


import 'dart:convert';





import 'package:agro_ecomance/entity/db/database.dart';
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


  var myData = List<CartDataa>();




  addCartData( int product_id,int weight, int  quantity, BuildContext context) {



    var addBask = AddCart();
    addBask.product_id = product_id;
    addBask.weight = weight;

    addBask.quantity = quantity;

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addCart(addBask).then((value)=>{


        if(value.data!= null){
          Helper.loadingSuccessful("success"),
          AppDatabase.getInstance().cartDataDao.nukeCart(),
          getCart(),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


   updateCartData( int product_id,int weight, int  quantity) {



     var addBask = AddCart();
     addBask.product_id = product_id;
     addBask.weight = weight;

     addBask.quantity = quantity;

   //  Helper.startLoading(context);


     try {


       RetrofitClientInstance.getInstance().getDataService().addCart(addBask).then((value)=>{


         if(value.data!= null){
           // Helper.loadingSuccessful("success"),
           // Navigator.of(context).pop(),
              getCart()
         }

         //  Helper.loadingFailed("Can't update ")


       }).catchError(onError);
     }catch(e){

      // Helper.loadingFailed(e.toString());
     }
   }







   deleteCart( String path_id, BuildContext context) {
    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().deleteCart(path_id).then((value)=>{


        if(value.status_code== 200){
          Helper.loadingSuccessful("${value.message}"),

          AppDatabase.getInstance().cartDataDao.nukeCart(),
            getCart()


        } else

          Helper.loadingFailed("${value.message}")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }







  getCart() async{
    CartDataBase item = await apiProvider.getDataService().getCart();
    CartCount  = item.datad?.dataa?.length;
    myData = item.datad.dataa;
    myData.forEach((element) {
      element.img_url =  element.product.featured_image.thumbnail_url;
      element.name =  element.product.name;
      element.price =  element.product.price.toString();
    });
    AppDatabase.getInstance()?.cartDataDao?.nukeCart();
    AppDatabase.getInstance()?.cartDataDao?.insertAllCart(myData);

  }





   addIncrementICarts(CartDataa item) async{

   //  CartDataa sd =  myData.where((element) => element.uuid == item.uuid).single;
     myData.remove(item);
     myData.add(item);
     _cartDataa.sink.add(myData);
   }

   addAllIncrementICarts(List<CartDataa> item) async{
     _cartDataa.sink.add(item);
   }





   dispose() {

    _cartDataa.drain();
  //  addedCart.drain();

  }

  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final cartBloc = CartBloc();



