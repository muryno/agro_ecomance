


import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:doc_on_call_24_7_mobile/entity/globe_responds.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/page_route_constants.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:doc_on_call_24_7_mobile/utils/helper.dart';
import 'package:doc_on_call_24_7_mobile/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc {
  // ignore: close_sinks


  final apiProvider = RetrofitClientInstance.getInstance();

  final _respondsFetcher = PublishSubject<GlobeResponds>();



  @override
  void dispose() {
   _respondsFetcher.drain();
  }


  resendOtp(String _phone, BuildContext context) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().resendOtp(_phone).then((value)=>{
        if (value.status== "success") {
          Helper.loadingSuccessful(value.message),
        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  attemptLogin(String _email,String _password,String token, BuildContext context) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().attemptLogin(_email,_password,token).then((value)=>{
        if (value.status== "success") {

          Helper.loadingSuccessful(value.message),

          StorageUtil.saveUser(value).then((value) =>
              RetrofitClientInstance.getInstance().reset()
          ),

              if (value.role == 1){
                      Navigator.of(context).pushNamedAndRemoveUntil(
                      PageRouteConstants.patient_home_screen,(r)=>false)
              }else if(value.role == 2){
                    Navigator.of(context).pushNamedAndRemoveUntil(
                    PageRouteConstants.doctor_home_screen,(r)=>false)
              }else if(value.role == 3){
                      Navigator.of(context).pushNamedAndRemoveUntil(
                      PageRouteConstants.PharmacyHomeScreen,(r)=>false)
              }

        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }

//attemptNewPassword
  attemptNewPassword(String otp, String _password,  String confirm_password,String _phone,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().attemptNewPassword(otp,_password,confirm_password,_phone).then((value)=>{
        if (value.status== "success"  ) {
          Helper.loadingSuccessful(value.message),



          Navigator.of(context).pushNamedAndRemoveUntil(
              PageRouteConstants.login_screen,(r)=>false)
        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }

  }




  attemptCreateAccount(String _email, String _password,  String country_id, String first_name, String last_name, String sex,String phone,String address,String dob,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().createAccount(first_name,last_name,_email,dob,sex,country_id,address,_password,phone).then((value)=>{
      if (value.status== "success"  ) {
        Helper.loadingSuccessful(value.message),

          StorageUtil.saveUser(value).then((value) =>
          RetrofitClientInstance.getInstance().reset()),


         Navigator.of(context).pushNamedAndRemoveUntil(
            PageRouteConstants.patient_home_screen,(r)=>false)
    }
    else

      Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }

  }

  patientUpdateAccount(String _email,  String country_id, String first_name, String last_name, String sex,String address,String dob,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().updatePatient(first_name,last_name,_email,dob,sex,country_id,address).then((value)=>{
        if (value.status== "success"  ) {
          Helper.loadingSuccessful(value.message),

          Navigator.pop(context),
        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }

  }


  doctorUpdateAccount(String _email, String country_id, String first_name, String last_name, String sex,String language,String address,String dob,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().updateDoctor(first_name,last_name,_email,dob,sex,country_id,address,language).then((value)=>{
        if (value.status== "success"  ) {
          Helper.loadingSuccessful(value.message),

          Navigator.pop(context),
        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }

  }
//uploadProfilePicture
  uploadProfilePicture(File _otp,BuildContext context) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().uploadProfilePicture(_otp).then((value)=>{
        if (value.status== "success" ) {
          Helper.loadingSuccessful(value.message),

          StorageUtil.saveUser(value).then((value) =>
              RetrofitClientInstance.getInstance().reset()),


          Navigator.pushReplacementNamed(context, PageRouteConstants.RegistrationScreen,arguments: value.mobile)


        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }



  attemptOtp(String _otp,BuildContext context) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().attemptOtp(_otp).then((value)=>{
        if (value.status== "success" ) {
          Helper.loadingSuccessful(value.message),

          StorageUtil.saveUser(value).then((value) =>
              RetrofitClientInstance.getInstance().reset()),


          Navigator.pushReplacementNamed(context, PageRouteConstants.RegistrationScreen,arguments: value.mobile)


        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }

  attemptReg(String _otp,BuildContext context) {


    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().attemptReg(_otp).then((value)=>{
        if (value.status== "success") {
          Helper.loadingSuccessful(value.message),
              RetrofitClientInstance.getInstance().reset(),
              Navigator.pushReplacementNamed(context, PageRouteConstants.otpScreen,arguments: _otp)
        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }


  forgotPassword(String _num,BuildContext context) {


    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().forgotPassword(_num).then((value)=>{
        if (value.status== "success") {
          Helper.loadingSuccessful(value.message),


          RetrofitClientInstance.getInstance().reset(),


          Navigator.pushReplacementNamed(context, PageRouteConstants.ConfirmNewScreen,arguments: _num)


        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }




  onError(e) {
  var ad =  jsonDecode(e.response.toString());


  if (ad["message"]!=null){
    Helper.loadingFailed(ad["message"]);
  }else{
    Helper.loadingFailed(ad["error"]);
  }

  }



}

final viewModelBloc = LoginBloc();


