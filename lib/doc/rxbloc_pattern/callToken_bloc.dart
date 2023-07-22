


import 'dart:convert';

import 'package:doc_on_call_24_7_mobile/entity/call_token.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/page_route_constants.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:doc_on_call_24_7_mobile/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CallTokenBloc {

  final apiProvider = RetrofitClientInstance.getInstance();
  final _callToken= PublishSubject<CallToken>();
  Stream<CallToken> get allCallToken => _callToken.stream;


  final _callAudioToken= PublishSubject<CallToken>();
  Stream<CallToken> get allAudioCallToken => _callAudioToken.stream;


  getCallTokens() async{
    CallToken item = await apiProvider.getDataService().getCallToken();
    _callToken.sink.add(item);
  }


  getAudioCallToken() async{
    CallToken item = await apiProvider.getDataService().getAudioCallToken();
    _callAudioToken.sink.add(item);
  }


  getPatientAudioCallTokens(String  doc_id) async{
    CallToken item = await apiProvider.getDataService().getVoiceAppointmentToken(doc_id);
    _callToken.sink.add(item);
  }


  getPatientVideoCallToken(String  doc_id) async{
    CallToken item = await apiProvider.getDataService().getVideoAppointmentToken(doc_id);
    _callAudioToken.sink.add(item);
  }


  giveMedication(String consultation_id,String medication,BuildContext context) {


    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().giveMedication(consultation_id,medication).then((value)=>{


        if (value.status== "success"  ) {
          Helper.loadingSuccessful(value.message),

          Navigator.of(context).pushNamedAndRemoveUntil(
              PageRouteConstants.doctor_home_screen,(r)=>false)
        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }




  //getAudioCallToken


  submitVideoCall(String minutes_left,String doc_id,String patient_id,String channel_name, String consultation,BuildContext context) {


     Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().submitVideoCallTime(minutes_left,doc_id,patient_id,channel_name,consultation).then((value)=>{

        if(value.status == "success" ){

          Helper.loadingSuccessful(value.status),

          Navigator.pushReplacementNamed(context, PageRouteConstants.DoctorMedication,arguments:value.consultation_id )

        } else

          Helper.loadingFailed(value.status)




      }).catchError(onError);
    }catch(e){

     // Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }




  submitAudioCall(String minutes_left,String doc_id,String patient_id,String channel_name, String consultation,BuildContext context) {


     Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().submitAudioCallTime(minutes_left,doc_id,patient_id,channel_name,consultation).then((value)=>{

        if(value.status =="success" ){

          Helper.loadingSuccessful(value.status),



          Navigator.pushReplacementNamed(context, PageRouteConstants.DoctorMedication,arguments:value.consultation_id )
        }

      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }
  }



  onError(e) {
    var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }


  dispose() {

    _callToken.drain();
    _callAudioToken.drain();
  }
}

final callTokenBloc = CallTokenBloc();