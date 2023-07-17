

import 'package:doc_on_call_24_7_mobile/entity/CallLogBase.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:rxdart/rxdart.dart';

class CallHistoryBloc {

  final apiProvider = RetrofitClientInstance.getInstance();
  final _userCallHistory= PublishSubject<List<CallLog>>();
  Stream< List<CallLog>> get allUserCallHistory => _userCallHistory.stream;

  final _doctorCallHistory= PublishSubject<List<CallLog>>();
  Stream< List<CallLog>> get allDoctorCallHistory => _doctorCallHistory.stream;


  getUserCallHistory() async{
    CallLogBase item = await apiProvider.getDataService().getUserVoiceCallLog();
    _userCallHistory.sink.add(item.logs);
  }

  getDoctorCallHistory() async{
    CallLogBase item = await apiProvider.getDataService().getDoctorVoiceCalLog();
    _userCallHistory.sink.add(item.logs);
  }


  dispose() {
    _userCallHistory.drain();
    _doctorCallHistory.drain();

  }
}

final callHistoryBloc = CallHistoryBloc();