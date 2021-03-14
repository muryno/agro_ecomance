


import 'dart:convert';





import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/responds/DashboardGrowth.dart';
import 'package:agro_ecomance/entity/responds/DashboardResp.dart';
import 'package:agro_ecomance/entity/responds/NetworkResp.dart';


import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class NetworkBloc {


  final apiProvider = RetrofitClientInstance.getInstance();




  final _networkData= PublishSubject<NetworkResp>();
  Stream<NetworkResp> get fetchNetwork => _networkData.stream;


  final _networkDataDetails = PublishSubject< List<NetworkData> >();
  Stream<  List<NetworkData> > get fetchNetworkDetails => _networkDataDetails.stream;
//






 





  getNetworkResp() async{
    NetworkResp item = await apiProvider.getDataService().getNetwork();
    _networkData.sink.add(item);
  }



  getNetworkDecendent(String uuid) async{

    NetworkResp item = await apiProvider.getDataService().getDecentNetwork(uuid);
    _networkDataDetails.sink.add(item?.data);
  }



  dispose() {

    _networkData.drain();
    _networkDataDetails.drain();
  }

  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final networkBloc = NetworkBloc();



