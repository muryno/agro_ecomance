


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/responds/DashboardGrowth.dart';
import 'package:agro_ecomance/entity/responds/DashboardResp.dart';
import 'package:agro_ecomance/entity/responds/EwalletResp.dart';


import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class EwallletBloc {


  final apiProvider = RetrofitClientInstance.getInstance();






  final _fetchChart = PublishSubject< List<CommissionGrowth> >();
  Stream<  List<CommissionGrowth> > get fetchChart => _fetchChart.stream;
//






  // int total_referral;

  final _agropoint = PublishSubject<String>();
  Stream<String> get fetchaAgroPoint => _agropoint.stream;



  final _legerBalance = PublishSubject<String>();
  Stream<String> get fetchWithdrawBalance => _legerBalance.stream;



  getDashBoard() async{
    EwalletResp item = await apiProvider.getDataService().getEwalletBalance();
    _agropoint.sink.add(item.data.withdrawable_balance);
    _legerBalance.sink.add(item.data.ledger_balance);
  }








  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }


  dispose() {




    _legerBalance.drain();
    _agropoint.drain();

  }



}

final ewalletBloc = EwallletBloc();



