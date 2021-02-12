import 'dart:convert';




import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/request/otpReq.dart';
import 'package:agro_ecomance/entity/request/signUpReq.dart';
import 'package:agro_ecomance/entity/responds/SignUpRes.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/loginToken.dart';
import 'package:agro_ecomance/entity/userBase.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'dart:io';
import 'package:http_parser/http_parser.dart' show MediaType;

part 'retro_client.g.dart';

@RestApi(baseUrl: UrlConstant.BASE_URL)
abstract class ApiRestClient {
  factory ApiRestClient(Dio dio) = _ApiRestClient;

///start

  @POST("signup/user")
  Future<SignUpRes> startSignUp(@Body() signUpReq usr);



  @POST("signup/otp/verify")
  Future<SignUpRes> verifyOtp(@Body() otpReq usr);


  @POST("signup/otp/request")
  Future<SignUpRes> getNewOtp(
      @Body() otpReq usr );


  @POST("auth/login")
  Future<loginToken> attemptLogin(@Body() login_request usr);



 @GET("auth/profile")
 Future<UserProfile> getUserProfile();



  @POST("auth/refresh")
  Future<loginToken> refreshToken();




}