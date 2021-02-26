


import 'dart:convert';




import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/request/otpReq.dart';
import 'package:agro_ecomance/entity/request/signUpReq.dart';
import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc {
  // ignore: close_sinks


  final apiProvider = RetrofitClientInstance.getInstance();


  startSignUp(String phone,String referral_code,String username,String password,String email, BuildContext context) {

    Helper.startLoading(context);
    try {
      var urs = signUpReq();

      if(phone == "" && email == "" ){
        Helper.toastFailed("Phone number or email is require");
        return;
      }


      var phne ;

      if(phone.substring(0,3) != "234"){
        phne = "${234}$phone";
      }else if(phone.substring(0,3) == "234" && phone.substring(0,4) != "2340"){
        phne = "${2340}${phone.substring(3)}";
      }else{
        phne = phone;
      }



      urs.phone =phne;
      urs.referral_code = referral_code;
      urs.username = username;
      urs.password = password;
      urs.email = email;


      RetrofitClientInstance.getInstance().getDataService().startSignUp(urs).then((value)=>{
        if (value.status_code== 200 ||value.status_code== 201 ) {
          Helper.loadingSuccessful("Success"),


          // Navigator.pushReplacementNamed(context, PageRouteConstants.completeSignUp,arguments: urs)

          Navigator.pushReplacementNamed(context, PageRouteConstants.oTPScreen,arguments: value.otp_secret)

        } else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }




  verifyOtp(String otp_secret,int _otp, BuildContext context) {

    Helper.startLoading(context);
    try {
      var urs = otpReq();
      urs.otp_secret = otp_secret;
      urs.otp = _otp;

      RetrofitClientInstance.getInstance().getDataService().verifyOtp(urs).then((value)=>{
      if (value.status_code== 200) {


         Helper.loadingSuccessful("Success"),
        Navigator.of(context).pushNamedAndRemoveUntil(
            PageRouteConstants.loginScreen,(r)=>false)

      }

      else

         Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }

  resendotp(String otp_secret,String otp, BuildContext context) {

    Helper.startLoading(context);
    try {
      var urs = otpReq();
      urs.otp_secret = otp_secret;
      urs.otp = int.parse(otp);


      RetrofitClientInstance.getInstance().getDataService().getNewOtp(urs).then((value)=>{
        if (value.status_code== 200) {
          Helper.loadingSuccessful("Success"),

        } else


          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }



  attempLogin(String type, email_or_phone,String password, BuildContext context) {

    Helper.startLoading(context);
    try {
      var urs = login_request();
      urs.client = type;

      urs.password = password;
      urs.email_or_phone = email_or_phone;


      RetrofitClientInstance.getInstance().getDataService().attemptLogin(urs).then((value)=>{

      if (value.data.access_token != null) {


        Helper.loadingSuccessful("Welcome back"),
             //
                 StorageUtil.saveUser(value).then((value) =>
             RetrofitClientInstance.getInstance().reset()),
             RetrofitClientInstance.getInstance().resets(value.data.access_token),

             StorageUtil.userDataBiometric(urs),


    Helper.startLoading(context,"Wait... loading your data"),
    getProfile(context,value.data.client)
    // Future.delayed(Duration(seconds: 1), () {
    //
    // })







      }  else
        {

          Helper.loadingFailed(value.message)
        }


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


      getProfile( BuildContext context, String client) async{
        RetrofitClientInstance.getInstance().getDataService().getUserProfile().then(
                (value) => {

                  Helper.loadingSuccessful("Success"),
                StorageUtil.saveProfileUser(value.data),
          Navigator.of(context).pushNamedAndRemoveUntil(PageRouteConstants.dashBoardScreen,(r)=>false),
        }




        );




      }







  onError(e) {
  var ad =  jsonDecode(e.response.toString());

  ad["error"] == null ?
  Helper.loadingFailed(ad["message"]):
    Helper.loadingFailed(ad["error"]);
  }



}

final loginBloc = LoginBloc();


