import 'dart:convert';






import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/request/openBefore.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/loginToken.dart';
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




  static Future<loginToken> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final str = pref.getString(UrlConstant.USER_PREF);
    if(str != null){
      final Map<String, dynamic> json = jsonDecode(str);
      return loginToken.fromJson(json);
    }
    else
      return null;
  }


  static  clearUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  static Future<void> saveUser(loginToken value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = value != null ? jsonEncode(value) : value;
    prefs.setString(UrlConstant.USER_PREF, str);
  }

  static Future<void> clearUsers(login_request str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(UrlConstant.USER_PREF, "");
    prefs.remove(UrlConstant.USER_PREF);
    prefs.clear();

    SharedPreferences pres = await SharedPreferences.getInstance();
    pres.setString(UrlConstant.USER_PROF_PREF, "");
    pres.remove(UrlConstant.USER_PROF_PREF);
    pres.clear();

    SharedPreferences prs = await SharedPreferences.getInstance();
    prs.setString(UrlConstant.Bank_Data, "");
    prs.remove(UrlConstant.Bank_Data);
    prs.clear();

    // SharedPreferences prss = await SharedPreferences.getInstance();
    // prss.setString(UrlConstant.UserData_Biometric, "");
    // prss.remove(UrlConstant.UserData_Biometric);
    // prs.clear();


    StorageUtil.userDataBiometric(str);

  }


  static Future<UserProfileData> getProfileUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final str = pref.getString(UrlConstant.USER_PROF_PREF);
    if(str != null){
      final Map<String, dynamic> json = jsonDecode(str);
      return UserProfileData.fromJson(json);
    }
    else
      return null;
  }

  static Future<void> saveProfileUser(UserProfileData value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = value != null ? jsonEncode(value) : value;
    prefs.setString(UrlConstant.USER_PROF_PREF, str);
  }



  static Future<openBefore> openedApp() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final str = pref.getString(UrlConstant.openBefore);
    if(str != null){
      final Map<String, dynamic> json = jsonDecode(str);
      return openBefore.fromJson(json);
    }
    else
      return null;
  }

  static Future<void> saveopenedApp(openBefore value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = value != null ? jsonEncode(value) : value;
    prefs.setString(UrlConstant.openBefore, str);
  }




  static Future<login_request> getUserDataBiometric() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final str = pref.getString(UrlConstant.UserData_Biometric);
    if(str != null){
      final Map<String, dynamic> json = jsonDecode(str);
      return login_request.fromJson(json);
    }
    else
      return null;
  }

  static Future<void> userDataBiometric(login_request value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var str = value != null ? jsonEncode(value) : value;
    prefs.setString(UrlConstant.UserData_Biometric, str);
  }


}