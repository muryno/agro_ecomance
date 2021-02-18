


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/request/addNextOfKin.dart';
import 'package:agro_ecomance/entity/request/addPersonalInfor.dart';
import 'package:agro_ecomance/entity/request/bankReq.dart';
import 'package:agro_ecomance/entity/responds/BankRes.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class CartBloc {


  final apiProvider = RetrofitClientInstance.getInstance();




  final _cartDataa = PublishSubject<List<CartDataa>>();
  Stream<List<CartDataa>> get fetchCart => _cartDataa.stream;








  addCartData( int product_id,int quantity , BuildContext context) {



    var addBask = AddCart();
    addBask.product_id = product_id;
    addBask.quantity = quantity;


    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addCart(addBask).then((value)=>{


        if(value.dataa!= null){
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


        if(value.dataa!= null){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }







  getSlider() async{
    CartData item = await apiProvider.getDataService().getCart();
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



