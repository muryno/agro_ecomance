




import 'package:doc_on_call_24_7_mobile/entity/user_general.dart';
import 'package:doc_on_call_24_7_mobile/server/retrofit_clients.dart';
import 'package:doc_on_call_24_7_mobile/utils/share_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {

  final apiProvider = RetrofitClientInstance.getInstance();

  getPatientProfilePics() async{
    UserGeneral item = await apiProvider.getDataService().getUserProfile();
    StorageUtil.saveProfileUser(item);
    //Repository.saveProfile(item);
  }

  getDoctorProfilePics() async{
    UserGeneral item = await apiProvider.getDataService().getDoctorProfile();
    StorageUtil.saveProfileUser(item);
  }

}

final profileBloc = ProfileBloc();