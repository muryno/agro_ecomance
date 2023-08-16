


import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:doc_on_call_24_7_mobile/entity/globe_responds.dart';
import 'package:doc_on_call_24_7_mobile/entity/pharmacy_entity.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/page_route_constants.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:doc_on_call_24_7_mobile/utils/helper.dart';
import 'package:doc_on_call_24_7_mobile/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class PharmacyBloc {
  // ignore: close_sinks


  final apiProvider = RetrofitClientInstance.getInstance();





  void dispose() {
   _medication.drain();
  }


  final _medication= PublishSubject<Medication>();
  Stream<Medication> get medicationResult => _medication.stream;

  getMedication(String _code, BuildContext context) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().pharmacyMedication(_code).then((value)=>{
        if (value.status== "success") {
          Helper.loadingSuccessful(value.status),
          _medication.sink.add(value.medication)
        } else

          Helper.loadingFailed(value.status)


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }


  }







  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final pharmacyBloc = PharmacyBloc();


