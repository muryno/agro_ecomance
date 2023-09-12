
import 'dart:convert';

import 'package:doc_on_call_24_7_mobile/entity/subscription.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/page_route_constants.dart';
import 'package:doc_on_call_24_7_mobile/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SubscriptionBloc {

  final apiProvider = RetrofitClientInstance.getInstance();
  final _subscription= PublishSubject<List<Subscription>>();
  Stream< List<Subscription>> get allSubscription => _subscription.stream;


  getSubscriptions() async{
    List<Subscription> item = await apiProvider.getDataService().getSubscription();
    _subscription.sink.add(item);
  }


  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return successDialog(context);
      },
    );
  }


  Dialog successDialog(context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child:InkWell(
          onTap: (){
            Navigator.of(context).pushNamedAndRemoveUntil(
                PageRouteConstants.patient_home_screen,(r)=>false);
          },
          child:  Container(
            height: 350.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_box,
                    color: Color(0xFF41aa5e),
                    size: 90,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Payment has successfully',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'been made',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Your payment has been successfully",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text("processed.", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
          ),
        )
    );
  }



  attemptSubscription(String _subId,String _reference, BuildContext context) {

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().payForSubscription(_reference,_subId).then((value)=>{
        if (value.status == "success") {
          Helper.loadingSuccessful(value.message),
          _showDialog(context)
        }
        else
          Helper.loadingFailed(value.message)
      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }




  onError(e) {
    var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }


  dispose() {

    _subscription.drain();
  }
}

final subscriptionBloc = SubscriptionBloc();