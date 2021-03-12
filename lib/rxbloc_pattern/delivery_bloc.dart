


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
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/cart/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class DeliveryBloc {


  final apiProvider = RetrofitClientInstance.getInstance();



  final _addressData = PublishSubject<List<DeliveryAddres>>();
  Stream<List<DeliveryAddres>> get fetchAddress => _addressData.stream;

  List<DeliveryAddres> dfr = [];



  emptyAddress() async{
   // UserProfile item = await apiProvider.getDataService().getUserProfile();
    _addressData.drain();
    _addressData.sink.add(dfr);
  }

  getAddress() async{
    UserProfile item = await apiProvider.getDataService().getUserProfile();
    _addressData.drain();
    _addressData.sink.add(item.data.delivery_address != null ? item.data.delivery_address  :dfr );
  }

  getPickupAddress(double lat  ,double lon,BuildContext context) async{
    Helper.startLoading(context);
    try {
      PickupAddress item = await apiProvider.getDataService()
          .fetchPickupLocation(lat.toString(), lon.toString());
      _addressData.drain();
      _addressData.sink.add(item.delivery_address != null ? item.delivery_address : dfr);

      Helper.loadingSuccessful("");
    }catch(e){
      Helper.loadingFailed(e.toString());
    }
  }


  //


  setDeliveryAddress( String uuid, List<dynamic> dyn , BuildContext context) {


   var addBask  = {"address":uuid};

    Helper.startLoading(context);

    try {


      RetrofitClientInstance.getInstance().getDataService().setDeliveryAddress(addBask).then((value)=>{


        if(value.status_code == 200 || value.status_code == 201){

          Helper.loadingSuccessful("success"),
       //   Navigator.of(context).pop(),

          Navigator.of(context).push(
              ReUseAble().getTransition(CheckOutScreen(snapshotData: dyn))
          )


        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  setPickUpAddress( int uuid,List<dynamic> dyn, BuildContext context) {


    var addBask  = {"distributor_id":uuid};





    Helper.startLoading(context);

    try {


      RetrofitClientInstance.getInstance().getDataService().setPickUpAddress(addBask).then((value)=>{


        if(value.status_code == 200 || value.status_code == 201){

          Helper.loadingSuccessful("success"),
          //   Navigator.of(context).pop(),


          Navigator.of(context).push(
              ReUseAble().getTransition(CheckOutScreen(snapshotData: dyn))
          )




    } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }


  }




  addDeliveryAddress( String address,String city , String email, String first_name,String last_name,String state, String phone,double lat,double lon,bool set_default,String nearest_bus_stop, BuildContext context) {


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
    addBask.nearest_bus_stop = nearest_bus_stop;

    Helper.startLoading(context);



    try {


      RetrofitClientInstance.getInstance().getDataService().addDeliveryAddress(addBask).then((value)=>{


        if(value.deliveryAddress!= null){
          Helper.loadingSuccessful("success"),
          getAddress(),
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
       //   Navigator.of(context).pop(),

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
          getAddress(),
        //  Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }






  dispose(){
    _addressData.drain();
  }








  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final deliveryBloc = DeliveryBloc();



