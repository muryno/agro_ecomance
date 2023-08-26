import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:doc_on_call_24_7_mobile/server/retro_client.dart';
import 'package:doc_on_call_24_7_mobile/utils/share_pref.dart';




class RetrofitClientInstance{
  static RetrofitClientInstance _instance = RetrofitClientInstance._internal();



  reset(){
    StorageUtil.getUser().then((value){

      _instance = RetrofitClientInstance._internal(value.token);
    });
  }

  RetrofitClientInstance._internal([String token = '']){

    _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.headers["Authorization"] = 'Bearer$token';
    _dio.options.responseType = ResponseType.json;
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, request: true, error: true));
    _client = ApiRestClient(_dio);

  }

  Dio _dio;
  ApiRestClient _client;

  static RetrofitClientInstance getInstance() {
    return _instance;
  }

  ApiRestClient getDataService() {
    return _client;
  }

}