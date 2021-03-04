


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/request/AddWishBasket.dart';
import 'package:agro_ecomance/entity/request/bankReq.dart';
import 'package:agro_ecomance/entity/responds/WishBaskResp.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class CommissionBloc {

   var  CartCount = 0 ;
  final apiProvider = RetrofitClientInstance.getInstance();


  //
  //
  // final _basketData = PublishSubject<List<WishBaskData> >();
  // Stream<List<WishBaskData>> get fetchbasket => _basketData.stream;
  //
  //




   attemptWithdraw(int amount,String account_number,String account_name,String bank_name, BuildContext context) {

     Helper.startLoading(context);
     try {
       var urs = bankReq();
       urs.amount = amount;
       urs.account_number = account_number;
       urs.account_name = account_name;
       urs.bank_name = bank_name;


       RetrofitClientInstance.getInstance().getDataService().withdraw(urs).then((value)=>{

         if (value.status_code ==201 || value.status_code ==200) {

           Helper.loadingSuccessful("${value.message}"),
           Navigator.of(context).pop()

         }  else
           {

             Helper.loadingFailed(value.message)
           }


       }).catchError(onError);
     }catch(e){

       Helper.loadingFailed(e.toString());
     }
   }






   dispose() {

   // _basketData.drain();

  }

  onError(e) {

  var ad =  jsonDecode(e.toString());
    Helper.loadingFailed(ad["message"] ?? "");


  }



}

final commissionBloc = CommissionBloc();



