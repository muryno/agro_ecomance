import 'dart:convert';




import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/request/addNextOfKin.dart';
import 'package:agro_ecomance/entity/request/addPersonalInfor.dart';
import 'package:agro_ecomance/entity/request/bankReq.dart';
import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/request/otpReq.dart';
import 'package:agro_ecomance/entity/request/passReq.dart';
import 'package:agro_ecomance/entity/request/signUpReq.dart';
import 'package:agro_ecomance/entity/responds/BankRes.dart';
import 'package:agro_ecomance/entity/responds/NextKinRes.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/SignUpRes.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/delievryAddress/DeliveryAddressResp.dart';
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


  //new

  @GET("ecommerce/products?featured=1")
  Future<ProductResp> getFeaturedProduct();

  @GET("slides?perPage=6&type=ecommerce")
  Future<Sliders> getSlider();



  @PATCH("ecommerce/profile/nextOfKin")
  Future<NextKinRes> nextOfKin(@Body() addNextOfKin usr);

  @PATCH("ecommerce/profile/bank")
  Future<BankRes> bankResp(@Body() bankReq usr);

  @PATCH("ecommerce/profile/password")
  Future<passReq> changePassword(@Body() passReq usr);

  @PATCH("ecommerce/profile/personal")
  Future<NextKinRes> updatePersonalInfor(@Body() addPersonalInfor usr);



  @GET("ecommerce/profile/bank")
  Future<BankRes> getBankDetails();



  @POST("order/basket/add")
  Future<CartData> addCart(@Body() AddCart usr);

  @GET("order/basket")
  Future<CartData> getCart();

  @DELETE("order/basket/{id}")
  Future<CartData> deleteCart(@Path('id') id);




  @PATCH("ecommerce/delivery")
  Future<DeliveryAddressResp> addDeliveryAddress(@Body() addNextOfKin usr);

}