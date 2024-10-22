


import 'dart:convert';




import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/request/otpReq.dart';
import 'package:agro_ecomance/entity/request/signUpReq.dart';
import 'package:agro_ecomance/entity/responds/FailedLogin.dart';
import 'package:agro_ecomance/entity/responds/errorResponds/SignUpError.dart';
import 'package:agro_ecomance/entity/responds/errorResponds/otpError.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/background_utils.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/material.dart';



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

      if(phone.substring(0,3) != "234" &&phone.substring(0,1) == "0"  ){
        phne = "${234}${phone.substring(1)}";
      }else if(phone.substring(0,3) == "234" && phone.substring(0,4) == "2340"){
        phne = "${234}${phone.substring(4)}";
      }else if(phone.substring(0,1) != "0" && phone.substring(0,3) != "234" ){
        Helper.toastFailed("Phone number is invalid");
        return;
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


      }).catchError((e){
//otpError
        var ad =  jsonDecode(e.response.toString());

        var resp = SignUpError.fromJson(ad);

        if(resp?.errors!= null){

          if(resp?.errors?.phone != null && resp?.errors?.phone?.length > 0) {
            Helper.loadingFailed(resp.errors.phone[0].toString());
          }
          if(resp?.errors?.email != null && resp?.errors?.email?.length> 0) {
            Helper.loadingFailed(resp?.errors?.email[0].toString());
          }
          if(resp?.errors?.username != null && resp?.errors?.username?.length  > 0) {
            Helper.loadingFailed(resp?.errors?.username[0].toString());
          }
          if(resp?.errors?.password != null && resp?.errors?.password?.length  > 0) {
            Helper.loadingFailed(resp?.errors?.password[0].toString());
          }


        }

        //
      });
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

        if (value.data.access_token != null) {
          Helper.loadingSuccessful("Account verified"),

          RetrofitClientInstance.getInstance().resets(value.data.access_token),

          Navigator.of(context).pushNamedAndRemoveUntil(
              PageRouteConstants.signUpPaymentScreen,(r)=>false),


        }

      else

         Helper.loadingFailed(value.message)


      }).catchError((e){
//
        var ad =  jsonDecode(e.response.toString());

        var resp = OtpError.fromJson(ad);

        if(resp.errors!= null){

          if(resp?.errors?.otp != null &&  resp?.errors?.otp?.length> 0) {
            Helper.loadingFailed(resp.errors.otp[0].toString());
          }


        }

        //
      });
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }



  verifyReference(String reference, String mode,BuildContext context) {

    Helper.startLoading(context,"Please wait while we confirm your payment..");
    try {


      RetrofitClientInstance.getInstance().getDataService().verifySignUpPayment(reference,mode).then((value)=>{
        if (value.data!= null) {


          Helper.loadingSuccessful("Success"),
          Navigator.of(context).pushNamedAndRemoveUntil(
              PageRouteConstants.loginScreen,(r)=>false)

        }



      }).catchError((e){
//
        var ad =  jsonDecode(e.response.toString());

        var resp = OtpError.fromJson(ad);

        if(resp.message!= null){
          Helper.loadingFailed(resp.message.toString());
        }

        //
      });
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


  refreshToken({BuildContext context}) {


    try {


      RetrofitClientInstance.getInstance().getDataService().refreshToken().then((value)=>{
        if (value.data.access_token != null) {
          //

          print(value.data.toString()),

          StorageUtil.clearUserToken(),
          StorageUtil.saveUser(value).then((value) =>
              RetrofitClientInstance.getInstance().reset()),
          RetrofitClientInstance.getInstance().resets(value.data.access_token),

          BackgroundUtils.getTimers(context: context, times: value.data.expires_in)

        }


      }).catchError(onError);
    }catch(e){

     // Helper.loadingFailed(e.toString());
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
          getProfile(context,value.data.client),


          BackgroundUtils.getTimers(context: context,times:value.data.expires_in )



        }  else
          {

            Helper.loadingFailed(value.message)
          }


      }).catchError((e){
        var ad =  jsonDecode(e.response.toString());

        var resp = FailedLogin.fromJson(ad);

        if(resp.data!= null){
          Navigator.pushReplacementNamed(context, PageRouteConstants.oTPScreen,arguments: resp.data.otp_secret);
          Helper.loadingFailed(resp.error.toString());

        }else if(resp.error!= null){
          Helper.loadingFailed(resp.error.toString());
        }else if(resp.message!= null){
          Helper.loadingFailed(resp.message.toString());
        }else{
          Helper.loadingFailed("error with login.. please check your credentials and try again");
        }
      });
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }




//{
//     "otp_secret": "9b75f46a276d57f01e8e973e729e07ca442b7517b14b201a910e93444063",
//     "otp": 384410,
//     "password": "sharktale"
// }

  startForgetEmailPassword(String email, BuildContext context) {

    Helper.startLoading(context);
    try {
      var urs = {

        "type": "users",
        "email":email,
      };




      RetrofitClientInstance.getInstance().getDataService().startPasswordReset(urs).then((value)=>{

      if (value.otp_secret != null) {
        Navigator.pushReplacementNamed(context, PageRouteConstants.newPassword,arguments: value.otp_secret)

      }  else
        {

          Helper.loadingFailed(value.message)
        }


      }).catchError((e){
        var ad =  jsonDecode(e.response.toString());

        var resp = FailedLogin.fromJson(ad);

        if(resp.data!= null){
          Navigator.pushReplacementNamed(context, PageRouteConstants.oTPScreen,arguments: resp.data.otp_secret);
          Helper.loadingFailed(resp.error.toString());

        }else if(resp.error!= null){
          Helper.loadingFailed(resp.error.toString());
        }else if(resp.message!= null){
          Helper.loadingFailed(resp.message.toString());
        }else{
          Helper.loadingFailed("error with login.. please check your credentials and try again");
        }
      });
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  startForgetPhonePassword(String phone, BuildContext context) {

    Helper.startLoading(context);
    try {
      var urs = {

        "type": "users",
        "phone": phone
      };




      RetrofitClientInstance.getInstance().getDataService().startPasswordReset(urs).then((value)=>{

        if (value.otp_secret != null) {
          Navigator.pushReplacementNamed(context, PageRouteConstants.newPassword,arguments: value.otp_secret)

        }  else
          {

            Helper.loadingFailed(value.message)
          }


      }).catchError((e){
        var ad =  jsonDecode(e.response.toString());

        var resp = FailedLogin.fromJson(ad);

        if(resp.data!= null){
          Navigator.pushReplacementNamed(context, PageRouteConstants.oTPScreen,arguments: resp.data.otp_secret);
          Helper.loadingFailed(resp.error.toString());

        }else if(resp.error!= null){
          Helper.loadingFailed(resp.error.toString());
        }else if(resp.message!= null){
          Helper.loadingFailed(resp.message.toString());
        }else{
          Helper.loadingFailed("error with login.. please check your credentials and try again");
        }
      });
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  completeForgetPassword(String otp_secret,String otp,String password, BuildContext context) {

    Helper.startLoading(context);
    try {
      var urs = {

        "otp_secret": otp_secret,
        "otp": otp,
        "password": password

      };




      RetrofitClientInstance.getInstance().getDataService().completePasswordReset(urs).then((value)=>{

        if (value.status_code ==200 ||value.status_code ==201 ) {


        } else {

            Helper.loadingFailed(value.message)
          }


      }).catchError((e){
        var ad =  jsonDecode(e.response.toString());

        var resp = FailedLogin.fromJson(ad);

        if(resp.data!= null){
          Navigator.pushReplacementNamed(context, PageRouteConstants.oTPScreen,arguments: resp.data.otp_secret);
          Helper.loadingFailed(resp.error.toString());

        }else if(resp.error!= null){
          Helper.loadingFailed(resp.error.toString());
        }else if(resp.message!= null){
          Helper.loadingFailed(resp.message.toString());
        }else{
          Helper.loadingFailed("error with login.. please check your credentials and try again");
        }
      });
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







  //
  // onErrors(e,BuildContext context) {
  //   var ad =  jsonDecode(e.toString());
  //
  //   var resp = FailedLogin.fromJson(ad);
  //
  //   if(resp.data!= null){
  //     Navigator.pushReplacementNamed(context, PageRouteConstants.oTPScreen,arguments: value.otp_secret)
  //   }
  //   ad["error"] == null ?
  //   Helper.loadingFailed(ad["message"]):
  //   Helper.loadingFailed(ad["error"]);
  // }


  onError(e) {
  var ad =  jsonDecode(e.response.toString());

  // var resp = FailedLogin.fromJson(ad);
  //
  // if(resp.data!= null){
  //   Navigator.pushReplacementNamed(context, PageRouteConstants.oTPScreen,arguments: value.otp_secret)
  // }
  ad["error"] == null ?
  Helper.loadingFailed(ad["message"]):
    Helper.loadingFailed(ad["error"]);
  }



}

final loginBloc = LoginBloc();


