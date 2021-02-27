


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/responds/WishBaskResp.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class WishBloc {

   var  CartCount = 0 ;
  final apiProvider = RetrofitClientInstance.getInstance();




  final _basketData = PublishSubject<List<WishBaskData> >();
  Stream<List<WishBaskData>> get fetchbasket => _basketData.stream;








  addWishList( String wish , BuildContext context) {



    var addBask = {"title":wish};

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addNewWishList(addBask).then((value)=>{


        if(value.status_code == 200 ||value.status_code == 201 ){
          Helper.loadingSuccessful(value.message),
          fetchWishBasket(),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't add wishes  ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }





  fetchWishBasket() async{
    WishBaskResp item = await apiProvider.getDataService().getBaskets();
    _basketData.sink.add(item.wishBaskData);
  }






  dispose() {

    _basketData.drain();

  }

  onError(e) {

  var ad =  jsonDecode(e.toString());
    Helper.loadingFailed(ad["message"] ?? "");


  }



}

final wishBloc = WishBloc();



