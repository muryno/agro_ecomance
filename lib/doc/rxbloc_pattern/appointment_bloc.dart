






import 'dart:convert';

import 'package:doc_on_call_24_7_mobile/entity/doctor_entity.dart';
import 'package:doc_on_call_24_7_mobile/entity/appointment_sesseion.dart';
import 'package:doc_on_call_24_7_mobile/entity/appointment_time.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/page_route_constants.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:doc_on_call_24_7_mobile/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class GeneralSpecialistBloc {

  final apiProvider = RetrofitClientInstance.getInstance();
  final _locationData = PublishSubject<List<Doctor>>();
  Stream< List<Doctor>> get allSpecialistDoc => _locationData.stream;

  final _appointSessionData = PublishSubject<List<AppointmentSession>>();
  Stream< List<AppointmentSession>> get allAppointmentSession => _appointSessionData.stream;

  final _appointTimeData = PublishSubject<List<AppointmentTime>>();
  Stream< List<AppointmentTime>> get allAppointmentTimeData  => _appointTimeData.stream;


  getSpecialityDoctor(int id) async{
    List<Doctor> itemModel = await apiProvider.getDataService().getSpecializedDoctor(id);
    _locationData.sink.add(itemModel);
  }

  getAppointmentSession() async{
    List<AppointmentSession> item = await apiProvider.getDataService().getAppointmentSession();
    _appointSessionData.sink.add(item);
  }

  getAppointmentTime(String data) async{
    List<AppointmentTime> item = await apiProvider.getDataService().getAppointmentTime(data);
    _appointTimeData.sink.add(item);
  }


  attemptCreateComplains(String complaint, String doctor_id,  String appointment_date, String appointment_time,int appointment_type_id,BuildContext context ) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().SubmitAppointment(doctor_id,appointment_date,complaint,appointment_time,appointment_type_id).then((value)=>{
        if (value.status== "success"  ) {
          Helper.loadingSuccessful(value.message),
        }
        else
          {
            Helper.loadingFailed(value.message)
          },

        Navigator.pushReplacementNamed(context, PageRouteConstants.patient_home_screen),

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
    _locationData.drain();
    _appointSessionData.drain();
    _appointTimeData.drain();
  }
}

final generalSpecialistDocBloc = GeneralSpecialistBloc();