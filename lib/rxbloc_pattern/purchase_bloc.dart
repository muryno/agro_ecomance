


import 'dart:convert';





import 'package:agro_ecomance/entity/db/database.dart';
import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/entity/responds/purchased/PurchaseResp.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class  PurchaseBloc {

   var  CartCount = 0 ;
  final apiProvider = RetrofitClientInstance.getInstance();




  final _PurchaseRespData = PublishSubject<List<PurchaseRespData>>();
  Stream<List<PurchaseRespData>> get fetchPurchaseRespData => _PurchaseRespData.stream;










   getPurchase() async{
     PurchaseRespd item = await apiProvider.getDataService().getPurchaseResp();
    _PurchaseRespData.sink.add(item.data);





  }







   dispose() {

     _PurchaseRespData.drain();


  }

  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final purchaseBloc = PurchaseBloc();



