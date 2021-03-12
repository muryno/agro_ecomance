


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/request/addNextOfKin.dart';
import 'package:agro_ecomance/entity/request/addPersonalInfor.dart';
import 'package:agro_ecomance/entity/request/bankReq.dart';
import 'package:agro_ecomance/entity/responds/BankRes.dart';
import 'package:agro_ecomance/entity/responds/PickupAddress.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/cart/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class CartPaymentBloc {


  final apiProvider = RetrofitClientInstance.getInstance();



  payForEWalletCart( String paymentType , BuildContext context) {


   var addBask  = {
     "payment_type":paymentType,
   };

    Helper.startLoading(context);

    try {


      RetrofitClientInstance.getInstance().getDataService().payForCart(addBask).then((value)=>{


        if(value.status_code == 200 || value.status_code == 201){

          Helper.loadingSuccessful("success"),
       //   Navigator.of(context).pop(),


          Navigator.of(context).pushNamedAndRemoveUntil(PageRouteConstants.confirmPaymentScreen,(r)=>false),



        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  payForPayCodeCart( String paymentType,String paycode, BuildContext context) {


    var addBask  = {
      "payment_type":paymentType,
      "paycode":paycode,
    };

    Helper.startLoading(context);

    try {


      RetrofitClientInstance.getInstance().getDataService().payForCart(addBask).then((value)=>{


        if(value.status_code == 200 || value.status_code == 201){

          Helper.loadingSuccessful("success"),
          //   Navigator.of(context).pop(),


          Navigator.of(context).pushNamedAndRemoveUntil(PageRouteConstants.confirmPaymentScreen,(r)=>false),



        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }





  makeOrderNow( BuildContext context) {



    Helper.startLoading(context);

    try {


      RetrofitClientInstance.getInstance().getDataService().makeOrder().then((value)=>{


        if(value.status_code == 200 || value.status_code == 201){

          Helper.loadingSuccessful(value.message),
          //   Navigator.of(context).pop(),

          Navigator.of(context).pushNamedAndRemoveUntil(
          PageRouteConstants.dashBoardScreen, (r) => false
    )




        } else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }









  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final cartPaymentBloc = CartPaymentBloc();



