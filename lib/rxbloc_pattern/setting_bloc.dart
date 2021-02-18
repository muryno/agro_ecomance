


import 'dart:convert';





import 'package:agro_ecomance/entity/request/addNextOfKin.dart';
import 'package:agro_ecomance/entity/request/addPersonalInfor.dart';
import 'package:agro_ecomance/entity/request/bankReq.dart';
import 'package:agro_ecomance/entity/responds/BankRes.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class SettingsBloc {


  final apiProvider = RetrofitClientInstance.getInstance();




  final _productArrayResp = PublishSubject<List<ProductRespData>>();
  Stream<List<ProductRespData>> get fetchProduce => _productArrayResp.stream;


  final _sliderData = PublishSubject<BankResX>();
  Stream<BankResX> get fetchBank => _sliderData.stream;





  addsNextOfKin( String address,String city , String email, String name,String state, String phone,double lat,double lon,String lga, BuildContext context) {

    var addBask = addNextOfKin();
    addBask.address = address;
    addBask.city = city;
    addBask.email = email;
    addBask.name = name;
    addBask.phone = phone;
    addBask.state = state;
    addBask.long = lon;
    addBask.long = lon;
    addBask.lga = lga;

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().nextOfKin(addBask).then((value)=>{


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







  addsBank( String account_name,String account_number , String bank_name,String sort_code, BuildContext context) {


    var addBask = bankReq();
    addBask.account_name = account_name;
    addBask.account_number = account_number;
    addBask.bank_name = bank_name;
    addBask.sort_code = sort_code;


    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().bankResp(addBask).then((value)=>{


        if(value.bankRes!= null){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }





  addUpdatePersonal(String address,String city , String display_name,String email, String first_name,String last_name, double lat,String lga, double lon,String phone, String state, bool use_as_delivery_address,BuildContext context) {

    var addBask = addPersonalInfor();
    addBask.address = address;
    addBask.city = city;
    addBask.display_name = display_name;
    addBask.email = email;
    addBask.first_name = first_name;
    addBask.lat = lat;
    addBask.lga = lga;
    addBask.long = lon;
    addBask.phone = phone;
    addBask.state = state;
    addBask.use_as_delivery_address = use_as_delivery_address;

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().updatePersonalInfor(addBask).then((value)=>{


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








  getSlider() async{
    BankRes item = await apiProvider.getDataService().getBankDetails();
    _sliderData.sink.add(item.bankRes);
  }






  dispose() {
    _productArrayResp.drain();
    _sliderData.drain();

  }

  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final productsBloc = SettingsBloc();



extension parseNmumber on  String {
   int parseInt(){
     return  int.parse(this);
}
}