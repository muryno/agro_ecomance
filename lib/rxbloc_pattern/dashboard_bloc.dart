


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/responds/DashboardGrowth.dart';
import 'package:agro_ecomance/entity/responds/DashboardResp.dart';


import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class DashBoardBloc {


  final apiProvider = RetrofitClientInstance.getInstance();






  final _fetchChart = PublishSubject< List<CommissionGrowth> >();
  Stream<  List<CommissionGrowth> > get fetchChart => _fetchChart.stream;
//






  // int total_referral;

  final _approvedCommission = PublishSubject<int>();
  Stream<int> get fetchApprovedCommission => _approvedCommission.stream;


  final _newDescendants = PublishSubject<List<NewDescendant>>();
  Stream<List<NewDescendant>> get fetchNewDescendantst => _newDescendants.stream;


  final _commissionGrowth = PublishSubject< List<CommissionGrowth> >();
  Stream<  List<CommissionGrowth> > get fetchCommissionGrowth => _commissionGrowth.stream;

  final _pendingCommission = PublishSubject<int>();
  Stream<int> get fetchPendingCommission => _pendingCommission.stream;

  final _totalCommission = PublishSubject<int>();
  Stream<int> get fetchTotalCommission => _totalCommission.stream;


  final _totalReferral = PublishSubject<int>();
  Stream<int> get fetchTotalReferral => _totalReferral.stream;



  getDashBoard() async{
    DashboardResp item = await apiProvider.getDataService().getDashboard();
    _approvedCommission.sink.add(item.dashboardData.approved_commission);
    _newDescendants.sink.add(item.dashboardData.new_descendants);
    _commissionGrowth.sink.add(item.dashboardData.commission_growth);
    _pendingCommission.sink.add(item.dashboardData.pending_commission);
    _totalCommission.sink.add(item.dashboardData.total_commission);
    _totalReferral.sink.add(item.dashboardData.total_referral);
  }



  getDashBoardGraph() async{
    DateTime now = new DateTime.now();
    DashboardGrowth item = await apiProvider.getDataService().getDashboardGrowth(now.year.toString());
    _fetchChart.sink.add(item.dashboardData.commission_growth);
  }





  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }


  dispose() {


    _fetchChart.drain();

    _approvedCommission.drain();
    _newDescendants.drain();
    _commissionGrowth.drain();
    _pendingCommission.drain();
    _totalCommission.drain();
    _totalReferral.drain();
  }



}

final dashBloc = DashBoardBloc();



