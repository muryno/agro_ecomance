


import 'dart:convert';

import 'package:doc_on_call_24_7_mobile/entity/patient_appointment_model.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/page_route_constants.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:doc_on_call_24_7_mobile/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class PatientBloc {

  final apiProvider = RetrofitClientInstance.getInstance();

  final _PatientAppointmentResa = PublishSubject<PatientAppointmentRes>();

  Stream< PatientAppointmentRes> get allSpecialistDoc => _PatientAppointmentResa.stream;


  getAppointment() async{
    PatientAppointmentRes item = await apiProvider.getDataService().getAppointPatientDetail();
    _PatientAppointmentResa.sink.add(item);
  }

  //attemptNewPassword
  patientVoiceToken(String doc_id,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().getVoiceAppointmentToken(doc_id).then((value)=>{
        if (value.success == true  ) {
          Helper.loadingSuccessful(value.message),

        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(UrlConstant.connectionFails);
    }

  }


  patientVideoToken(String doc_id,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().getVideoAppointmentToken(doc_id).then((value)=>{
        if (value.success == true  ) {
          Helper.loadingSuccessful(value.message),

        }
        else

          Helper.loadingFailed(value.message)


      }).catchError(onError);
    }catch(e){
      Helper.loadingFailed(UrlConstant.connectionFails);
    }

  }


  deleteAppointment(String doc_id,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().deleteAppointment(doc_id).then((value)=>{
        if (value.status == "success"  ) {
          Helper.loadingSuccessful(value.message),

          Navigator.of(context).pushNamed(PageRouteConstants.patient_home_screen),

        } else

          Helper.loadingFailed(value.message)


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
    _PatientAppointmentResa.drain();
  }
}

final patientBloc = PatientBloc();