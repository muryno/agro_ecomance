

import 'package:doc_on_call_24_7_mobile/entity/doctor_appointment.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class DoctorBloc {

  final apiProvider = RetrofitClientInstance.getInstance();
  final _subscription= PublishSubject<List<DoctorAppointment>>();
  Stream< List<DoctorAppointment>> get allDocApoint => _subscription.stream;


  getDoctorsSubscription() async{
    List<DoctorAppointment> item = await apiProvider.getDataService().getDoctorAppointment();
    _subscription.sink.add(item);
  }

  dispose() {

    _subscription.drain();
  }
}

final doctorBloc = DoctorBloc();