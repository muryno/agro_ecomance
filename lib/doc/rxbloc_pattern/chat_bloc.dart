






import 'dart:convert';

import 'package:doc_on_call_24_7_mobile/entity/chat_payload.dart';
import 'package:doc_on_call_24_7_mobile/entity/doctor_entity.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/page_route_constants.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:doc_on_call_24_7_mobile/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CallHistoryBloc {

  final apiProvider = RetrofitClientInstance.getInstance();


  final _allDoctors= PublishSubject<List<Doctor>>();
  Stream< List<Doctor>> get allDoctors=> _allDoctors.stream;




  getAllDoctors() async{
    ChatRequest item = await apiProvider.getDataService().getAllDoctors();
    _allDoctors.sink.add(item.data);
  }

  getChatRequestApi(String doc_id,BuildContext context ) async{

    Helper.startLoading(context);
    try {
      RetrofitClientInstance.getInstance().getDataService().chatRequestApi(doc_id).then((value)=>{
        if (value.success == true  ) {
          Helper.loadingSuccessful(value.message),

             Navigator.of(context).pushNamed(PageRouteConstants.AppointmentChat,arguments:value.chatPayload )

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
    Helper.loadingFailed(ad["message"]);
  }


  dispose() {
    _allDoctors.drain();


  }
}

final chatBloc = CallHistoryBloc();