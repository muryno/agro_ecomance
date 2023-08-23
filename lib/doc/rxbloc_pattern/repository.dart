
import 'package:doc_on_call_24_7_mobile/db/app_database.dart';
import 'package:doc_on_call_24_7_mobile/entity/user_general.dart';

class Repository{
  static Repository _instance = Repository._internal();
  Repository._internal();
  static Repository getInstance(){
    return _instance;
  }

 static void saveProfile(UserGeneral data) {
      AppDatabase.getInstance().userkDao.saveUser(data);
  }





}