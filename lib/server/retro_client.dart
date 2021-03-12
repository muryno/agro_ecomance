import 'dart:convert';




import 'package:agro_ecomance/entity/request/AddBasicInfoReq.dart';
import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/request/AddDeliveryAddres.dart';
import 'package:agro_ecomance/entity/request/AddWishBasket.dart';
import 'package:agro_ecomance/entity/request/addNextOfKin.dart';
import 'package:agro_ecomance/entity/request/addPersonalInfor.dart';
import 'package:agro_ecomance/entity/request/addWishBasketReq.dart';
import 'package:agro_ecomance/entity/request/bankReq.dart';
import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/request/otpReq.dart';
import 'package:agro_ecomance/entity/request/passReq.dart';
import 'package:agro_ecomance/entity/request/setReminderReq.dart';
import 'package:agro_ecomance/entity/request/signUpReq.dart';
import 'package:agro_ecomance/entity/responds/BankRes.dart';
import 'package:agro_ecomance/entity/responds/BaseResp.dart';
import 'package:agro_ecomance/entity/responds/DashboardGrowth.dart';
import 'package:agro_ecomance/entity/responds/DashboardResp.dart';
import 'package:agro_ecomance/entity/responds/NetworkResp.dart';
import 'package:agro_ecomance/entity/responds/NewWishList.dart';
import 'package:agro_ecomance/entity/responds/NextKinResp.dart';
import 'package:agro_ecomance/entity/responds/PickupAddress.dart';
import 'package:agro_ecomance/entity/responds/ProductCategory.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/Reminder.dart';
import 'package:agro_ecomance/entity/responds/SignUpRes.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/WishBaskResp.dart';
import 'package:agro_ecomance/entity/responds/WishListBasketDetails.dart';
import 'package:agro_ecomance/entity/responds/WishdataResp.dart';
import 'package:agro_ecomance/entity/responds/addCartResp/AddCartResp.dart';
import 'package:agro_ecomance/entity/responds/addCartResp/CategoryDataResp.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/ProfileResp.dart';
import 'package:agro_ecomance/entity/responds/DeliveryAddressResp.dart';
import 'package:agro_ecomance/entity/responds/loginToken.dart';
import 'package:agro_ecomance/entity/responds/withdrawResp.dart';
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
  Future<loginToken> verifyOtp(@Body() otpReq usr);


  @POST("auth/user/verify/{id}?gateway={paystack}")
  Future<UserProfile> verifySignUpPayment(@Path('id') id,@Path('paystack') paystack);


  @POST("signup/otp/request")
  Future<SignUpRes> getNewOtp(
      @Body() otpReq usr );


  @POST("auth/login")
  Future<loginToken> attemptLogin(@Body() login_request usr);



 @GET("auth/profile")
 Future<UserProfile> getUserProfile();



  @POST("auth/refresh")
  Future<loginToken> refreshToken();




  @GET("ecommerce/products?featured=1")
  Future<ProductResp> getFeaturedProduct();

  @GET("slides?perPage=6&type=ecommerce")
  Future<Sliders> getSlider();

  @GET("ecommerce/categories")
  Future<CategoryDataResp> getCategories();

  @GET("ecommerce/products?category={id}")
  Future<ProductResp> getProductByCategories(@Path('id') id);

  @PATCH("ecommerce/profile/nextOfKin")
  Future<NextKinResp> nextOfKin (@Body() addNextOfKin usr);

  @PATCH("ecommerce/profile/bank")
  Future<BankRes> bankResp(@Body() bankReq usr);

  @PATCH("ecommerce/profile/password")
  Future<passReq> changePassword(@Body() passReq usr);

  @PATCH("ecommerce/profile/basic")
  Future<ProfileResp> updatePersonalInfor(@Body() AddBasicInfoReq usr);



  @PATCH("ecommerce/profile/address")
  Future<ProfileResp> addProfileAddress(@Body() AddDeliveryAddres usr);


  @GET("ecommerce/profile/bank")
  Future<BankRes> getBankDetails();



  @POST("ecommerce/cart/add")
  Future<AddCartResp> addCart(@Body() AddCart usr);

  @GET("ecommerce/cart")
  Future<CartDataBase> getCart();

  @DELETE("ecommerce/cart/{id}")
  Future<BaseResp> deleteCart(@Path('id') id);






  @POST("ecommerce/delivery")
  Future<DeliveryAddressResp> addDeliveryAddress(@Body() addPersonalInfor usr);

  @PATCH("ecommerce/delivery/default/{id}")
  Future<DeliveryAddressResp> addDefaultAddress(@Path('id') id);



  @PATCH("ecommerce/delivery/{id}")
  Future<DeliveryAddressResp> updateDeliveryAddress(@Body() addPersonalInfor usr,@Path('id') id);


  @DELETE("ecommerce/delivery/{id}")
  Future<DeliveryAddressResp> deleteAddress(@Path('id') id);



  @GET("ecommerce/network")
  Future<NetworkResp> getNetwork();



  @GET("ecommerce/network/{id}")
  Future<NetworkResp> getDecentNetwork(@Path('id') id);


  @GET("ecommerce/dashboard")
  Future<DashboardResp> getDashboard();

  @GET("ecommerce/dashboard/commission?year={id}")
  Future<DashboardGrowth> getDashboardGrowth(@Path('id') id);

  //fhfj

  @POST("ecommerce/wish_basket")
  Future<NewWishList> addNewWishList(@Body() Map<String,String> usr);


  //-->
  @POST("ecommerce/wish_basket/{id}/wish")
  Future<WishdataResp> addWishBasket(@Path('id') id,  @Body() AddWishBasket addWishBasket);

  @GET("ecommerce/wish_basket/{id}/wishes")
  Future<WishListBasketDetails> getBasketWishes(@Path('id') id);
  //<--
  @POST("ecommerce/wish_basket/{id}/buy")
  Future<CartDataBase> convertWishToCart(@Path('id') id);


  @POST("ecommerce/wish_basket/{id}/reminder")
  Future<Reminder> setReminder(@Body() setReminderReq usr);

  @DELETE("ecommerce/wish_basket/wish/{id}")
  Future<Reminder> removeWishBasket(@Body() setReminderReq usr);

  @DELETE("ecommerce/wish_basket/{id}")
  Future<Reminder> removeBasket(@Body() setReminderReq usr);


  @GET("wish_basket/wish/{id}")
  Future<CartDataBase> fetchWishes(@Path('id') id);


  @GET("ecommerce/wish_basket/")
  Future<WishBaskResp> getSingleBasket();


  @GET("ecommerce/wish_basket")
  Future<WishBaskResp> getBaskets();


  @POST("withdraw")
  Future<withdrawResp>   withdraw(@Body() bankReq usr);


  @GET("ecommerce/cart/pickup-locations?lat={lat}&long={lon}")
  Future<PickupAddress> fetchPickupLocation(@Path('lat') lat,@Path('lon') lon);


  @PATCH("ecommerce/cart/delivery")
  Future<CartDataBase> setDeliveryAddress(@Body() Map<String,String> usr);


  @PATCH("ecommerce/cart/pickup")
  Future<CartDataBase> setPickUpAddress(@Body() Map<String,int> usr);


  @PATCH("ecommerce/cart/set-payment")
  Future<CartDataBase> payForCart(@Body() Map<String,String> usr);


  @POST("ecommerce/order/make-order")
  Future<withdrawResp>   makeOrder();


  @GET("ecommerce/order/requests")
  Future<CartDataBase> getOrderRequest();


//ecommerce/order/requests
}