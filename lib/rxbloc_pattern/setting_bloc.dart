


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddBasicInfoReq.dart';
import 'package:agro_ecomance/entity/request/AddDeliveryAddres.dart';
import 'package:agro_ecomance/entity/request/addNextOfKin.dart';
import 'package:agro_ecomance/entity/request/addPersonalInfor.dart';
import 'package:agro_ecomance/entity/request/bankReq.dart';
import 'package:agro_ecomance/entity/request/passReq.dart';
import 'package:agro_ecomance/entity/responds/BankRes.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';

class SettingsBloc {


  final apiProvider = RetrofitClientInstance.getInstance();




  final _productArrayResp = PublishSubject<List<ProductRespData>>();
  Stream<List<ProductRespData>> get fetchProduce => _productArrayResp.stream;


  // final _sliderData = PublishSubject<BankResX>();
  // Stream<BankResX> get fetchBank => _sliderData.stream;





  addsNextOfKin( String address,String city , String email, String name,String state, String phone,double lat,double lon,String lga, BuildContext context) {

    var addBask = addNextOfKin();
    addBask.address = address;
    addBask.city = city;
    addBask.email = email;
    addBask.name = name;
    addBask.phone = int.parse(phone)?? 00000000000;
    addBask.state = state;
    addBask.long = lon;
    addBask.long = lon;
    addBask.lga = lga;

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().nextOfKin(addBask).then((value)=>{


        if(value.nextKinData!= null){
          Helper.loadingSuccessful("success"),
          getProfile(),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }



  uploadProfile(String means_id,String client,String token, BuildContext context) async {

    if(means_id == null){
      Helper.loadingFailed("Kindly select or snap means of identification");
      return ;
    }

    // final bytes = (await File(means_id).readAsBytes()).toList();
    // var multipart = http.MultipartFile.fromBytes("images[][file]", bytes, filename: "images.png");








    Helper.startLoading(context,"Uploading your image...");
    try {

      String fileName = means_id.split('/').last;

      FormData data = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(
          means_id,
          filename: fileName,
        ),
      });

      Dio dio = new Dio();

      dio.options.headers["Authorization"] = 'Bearer$token';
      dio.options.responseType = ResponseType.json;
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, request: true, error: true));
      dio.post("https://dev.ownafarm.biz/api/v1/account/avatar", data: data)
          .then((value)=>onResponds(value.data,context))
          .catchError(onError);






      //  RetrofitClientInstances.getInstance().getDataService().uploadGalleryImages( multipart).then((value)=>onResponds(value,type,context)).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }






  addsBank( String account_name,String account_number , String bank_name, BuildContext context) {


    var addBask = bankReq();
    addBask.account_name = account_name;
    addBask.account_number = account_number;
    addBask.bank_name = bank_name;


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



//

  addUpdatePersonal( String display_name,String email, String name ,String phone,BuildContext context) {

    var addBask = AddBasicInfoReq();

    addBask.display_name = display_name;
    addBask.email = email;
    addBask.name = name;
    addBask.phone = phone;


    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().updatePersonalInfor(addBask).then((value)=>{


        if(value.data!= null){
          Helper.loadingSuccessful("success"),
          getProfile(),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }

  addProfileAddress(String address,String city , double lat,double lon,String lga ,String state,BuildContext context) {

    var addBask = AddDeliveryAddres();

    addBask.state = state;
    addBask.address = address;
    addBask.city = city;
    addBask.lga = lga;
    addBask.long = lon;
    addBask.lat = lat;
    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addProfileAddress(addBask).then((value)=>{


        if(value.data!= null){
          Helper.loadingSuccessful("success"),
          getProfile(),
          Navigator.of(context).pop(),


        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }



  changePassword(String current_password,String password , String confirmPassword,BuildContext context) {

    var addBask = passReq();
    addBask.current_password = current_password;
    addBask.new_password = password;
    addBask.new_password_confirmation = confirmPassword;


    Helper.startLoading(context);

    if(password!= confirmPassword){
      Helper.loadingFailed("Password not equal ");
    }

    try {


      RetrofitClientInstance.getInstance().getDataService().changePassword(addBask).then((value)=>{


        if(value.status_code== 200 ||value.status_code== 201 ){
          Helper.loadingSuccessful("success"),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't update ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }






  getBankDetails() async{
    BankRes item = await apiProvider.getDataService().getBankDetails();
    StorageUtil.SaveBankDetails(item.bankRes);

  }



  getProfile() async{
    RetrofitClientInstance.getInstance().getDataService().getUserProfile().then(
            (value) => {

              if(value.data != null){
                StorageUtil.saveProfileUser(value.data),

                Helper.loadingSuccessful("success"),
              }else{
                Helper.loadingFailed("failed"),
              }

        }




    );




  }



  dispose() {
    _productArrayResp.drain();


  }

  onResponds(Map<String, dynamic>  value,BuildContext context) {

    //  final Map parsed = json.decode(value);

    var resp =  UserProfile.fromJson(value);



    if (resp.status_code == 200|| resp.status_code == 201) {


      getProfile();
    }
    else
      Helper.loadingFailed(resp.message);
  }



  onError(e) {
  var ad =  jsonDecode(e.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final settingsBloc = SettingsBloc();



extension parseNmumber on  String {
   int parseInt(){
     return  int.parse(this);
}
}