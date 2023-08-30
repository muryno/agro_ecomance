import 'dart:convert';



import 'package:doc_on_call_24_7_mobile/entity/user.dart';
import 'package:doc_on_call_24_7_mobile/entity/user_general.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'constants/url_constant.dart';
class StorageUtil {
  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;

  static Future getInstance() async {
    if (_storageUtil == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }
  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }





  static Future<user> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final str = pref.getString(UrlConstant.USER_PREF);
    if(str != null){
      final Map<String, dynamic> json = jsonDecode(str);
      return user.fromJson(json);
    }
    else
      return null;
  }


  static  clearUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  static Future<void> saveUser(user value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = value != null ? jsonEncode(value) : value;
    prefs.setString(UrlConstant.USER_PREF, str);
  }

  static Future<void> clearUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(UrlConstant.USER_PREF, "");
    prefs.remove(UrlConstant.USER_PREF);
    prefs.clear();

  }


  static Future<UserGeneral> getProfileUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final str = pref.getString(UrlConstant.USER_PROF_PREF);
    if(str != null){
      final Map<String, dynamic> json = jsonDecode(str);
      return UserGeneral.fromJson(json);
    }
    else
      return null;
  }

  static Future<void> saveProfileUser(UserGeneral value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = value != null ? jsonEncode(value) : value;
    prefs.setString(UrlConstant.USER_PROF_PREF, str);
  }



}