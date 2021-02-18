


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


class DeliveryBloc {


  final apiProvider = RetrofitClientInstance.getInstance();





  addDeliveryAddress( String address,String city , String email, String first_name,String last_name,String state, String phone,double lat,double lon,String lga,bool set_default,String nearest_bus_stop, BuildContext context) {


    var addBask = addPersonalInfor();
    addBask.address = address;
    addBask.city = city;
    addBask.email = email;
    addBask.first_name = first_name;
    addBask.last_name = last_name;
    addBask.phone = phone;
    addBask.state = state;
    addBask.long = lon;
    addBask.set_default = set_default;
    addBask.lga = lga;
    addBask.nearest_bus_stop = nearest_bus_stop;

    Helper.startLoading(context);


    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addDeliveryAddress(addBask).then((value)=>{


        if(value.deliveryAddress!= null){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }



  updateDeliveryAddres(String deliveryId, String address,String city , String email, String first_name,String last_name,String state, String phone,double lat,double lon,String lga,bool set_default,String nearest_bus_stop, BuildContext context) {


    var addBask = addPersonalInfor();
    addBask.address = address;
    addBask.city = city;
    addBask.email = email;
    addBask.first_name = first_name;
    addBask.last_name = last_name;
    addBask.phone = phone;
    addBask.state = state;
    addBask.long = lon;
    addBask.set_default = set_default;
    addBask.lga = lga;
    addBask.nearest_bus_stop = nearest_bus_stop;

    Helper.startLoading(context);


    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().updateDeliveryAddress(addBask,deliveryId).then((value)=>{


        if(value.deliveryAddress!= null){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }





  deleteAddres( String path_id, BuildContext context) {
    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().deleteAddress(path_id).then((value)=>{


        if(value.deliveryAddress!= null){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  addDefaultAddres( String path_id, BuildContext context) {
    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addDefaultAddress(path_id).then((value)=>{


        if(value.deliveryAddress!= null){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


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

final deliveryBloc = DeliveryBloc();



