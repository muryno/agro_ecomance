import 'dart:convert';

import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:http/http.dart' as http;

  createAccessCode(String email,int amount ) async {
  // skTest -> Secret key
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${UrlConstant.PAYSTACK_SECRETE_kEY}'
  };
  Map data = {"amount": amount*100, "email":email};
  String payload = json.encode(data);
  http.Response response = await http.post(
      'https://api.paystack.co/transaction/initialize',
      headers: headers,
      body: payload);
  return jsonDecode(response.body);
}