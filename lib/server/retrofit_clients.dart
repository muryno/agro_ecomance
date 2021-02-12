import 'dart:convert';



import 'package:agro_ecomance/server/retro_client.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:dio/dio.dart';




class RetrofitClientInstance{
  static RetrofitClientInstance _instance = RetrofitClientInstance._internal();



  reset(){
    StorageUtil.getUser().then((value){
      _instance = RetrofitClientInstance._internal(value.data.access_token);

    });
  }

  resets(String str){
    _instance = RetrofitClientInstance._internal(str);
  }

  RetrofitClientInstance._internal([String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2Lm93bmFmYXJtLmJpelwvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MTEzODYxNTUsImV4cCI6MTc2NjkwNjE1NSwibmJmIjoxNjExMzg2MTU1LCJqdGkiOiJFc0drbFFRYkhTUk56U0V2Iiwic3ViIjo2LCJwcnYiOiI4NGFkNGQ2NmRkNzZiZmQzY2FiZTE1NGM3Y2FkNDBmM2QzZTMxNjRmIiwiYWNjb3VudF90eXBlIjoiZm9vZF9tYXJ0In0.jSfraxeWoA92Mke0U-PB6fBl3vfXOaBvTpyIiD4F_Pk']){

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