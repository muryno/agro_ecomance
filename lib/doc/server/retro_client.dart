import 'dart:convert';


import 'package:doc_on_call_24_7_mobile/entity/CallLogBase.dart';
import 'package:doc_on_call_24_7_mobile/entity/doctor_entity.dart';
import 'package:doc_on_call_24_7_mobile/entity/Speciality.dart';
import 'package:doc_on_call_24_7_mobile/entity/appointment_sesseion.dart';
import 'package:doc_on_call_24_7_mobile/entity/appointment_time.dart';
import 'package:doc_on_call_24_7_mobile/entity/call_token.dart';
import 'package:doc_on_call_24_7_mobile/entity/chat_payload.dart';
import 'package:doc_on_call_24_7_mobile/entity/doctor_appointment.dart';
import 'package:doc_on_call_24_7_mobile/entity/patient_appointment_model.dart';
import 'package:doc_on_call_24_7_mobile/entity/pharmacy_entity.dart';
import 'package:doc_on_call_24_7_mobile/entity/review_responds.dart';
import 'package:doc_on_call_24_7_mobile/entity/subscription.dart';
import 'package:doc_on_call_24_7_mobile/entity/user.dart';
import 'package:doc_on_call_24_7_mobile/entity/user_general.dart';
import 'package:doc_on_call_24_7_mobile/utils/constants/url_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:http_parser/http_parser.dart' show MediaType;

part 'retro_client.g.dart';

@RestApi(baseUrl: UrlConstant.BASE_URL)
abstract class ApiRestClient {
  factory ApiRestClient(Dio dio) = _ApiRestClient;




  @POST(UrlConstant.LOGIN)
  Future<user> attemptLogin(
      @Field("identity") String identity,
      @Field("password") String password,
      @Field("device_token") String device_token);

  @POST(UrlConstant.REGISTER_USER)
  Future<user> createAccount(@Field("firstname") String firstname, @Field("lastname") String lastname,
      @Field("email") String email, @Field("dob") String dob,
      @Field("sex") String sex, @Field("nationality") String nationality,
      @Field("address") String address, @Field("password") String password,
       @Field("mobile") String mobile);


  @POST(UrlConstant.VERIFY_OTP)
  Future<user> attemptOtp(@Field("token") String token);

  @POST(UrlConstant.ATTEMPT_REG)
  Future<user> attemptReg(@Field("mobile") String mobile);


  @GET("api/number_validation/{phone}")
  Future<user> forgotPassword(@Path("phone") String phone);


  @GET("api/get_medication/{code}")
  Future<PhamacyBase> pharmacyMedication(@Path("cod") String phone);

//ChatRequest
//http://178.128.144.191/api/get_transaction/{reference}/{subscription_id

  @GET("api/get_transaction/{reference}/{subscription_id}")
  Future<ChatRequest> payForSubscription(@Path("reference") String reference,@Path("subscription_id") String subscription_id,);


  @POST("api/chat/room-info")
  Future<ChatBase> chatRequestApi(@Field("doctor_id") String mobile);

  @GET("api/chat/doctors")
  Future<ChatRequest> getAllDoctors();



  @POST("api/resetPassword2")
  Future<user> attemptNewPassword(
      @Field("otp") String otp,
      @Field("password") String password,
      @Field("password_confirmation") String passwordConfirmation,
      @Field("mobile") String mobile);




  @GET( UrlConstant.GET_SPECIALITY)
  Future<List<Speciality>> getSpeciality();

  @GET("api/get_specialist_doctor/{id}")
  Future<List<Doctor>> getSpecializedDoctor(@Path("id") int id);

  @GET( UrlConstant.GET_APPOINTMENT_SESSION)
  Future<List<AppointmentSession>> getAppointmentSession();

  @GET( "api/get_appointment_time/{id}")
  Future<List<AppointmentTime>> getAppointmentTime(@Path("id") String id);

  @GET( "api/upload_profile_image")
  Future<user> uploadProfilePicture(@Part(name: "profile_picture") File profile_picture);



  @POST( UrlConstant.SUBMIT_APPOINTMENT)
  Future<user> SubmitAppointment(@Field("doctor_id") String doctor_id, @Field("appointment_date") String appointment_date,
      @Field("complaint") String complaint, @Field("appointment_time") String appointment_time,@Field("appointment_types_id") int appointment_types_id);




  @POST("api/post_medication")
  Future<user> giveMedication(@Field("consultation_id") String consultation_id, @Field("medication") String medication);



  @GET("api/get_video_feedback/{min}/{doc_id}/{user_id}/{channel_name}/{consultation}")
  Future<ReviewResponds> submitVideoCallTime(@Path("min") String min, @Path("doc_id") String doc_id,
      @Path("user_id") String user_id, @Path("channel_name") String channel_name,@Path("consultation") String consultation);

  @GET("api/get_voice_feedback/{min}/{doc_id}/{user_id}/{channel_name}/{consultation}")
  Future<ReviewResponds> submitAudioCallTime(@Path("min") String min, @Path("doc_id") String doc_id,
      @Path("user_id") String user_id, @Path("channel_name") String channel_name,@Path("consultation") String consultation);


  @GET( UrlConstant.GET_USER_APPOINTMENT)
  Future<PatientAppointmentRes> getAppointPatientDetail();


  //
  @GET("api/delete_appointment/{appointment_id}")
  Future<PatientAppointmentRes> deleteAppointment(@Path("appointment_id") String appointment_id);

  @GET("api/video_appointment/{doc_id}")
  Future<CallToken> getVideoAppointmentToken(@Path("doc_id") String doc_id);


  @GET("api/voice_appointment/{doc_id}")
  Future<CallToken> getVoiceAppointmentToken(@Path("doc_id") String doc_id);




  //CallToken
  @GET( UrlConstant.USER_VOICE_CALL_LOG)
  Future<CallLogBase> getUserVoiceCallLog();

  @GET( UrlConstant.DOCTOR_VOICE_CALL_LOG)
  Future<CallLogBase> getDoctorVoiceCalLog();


//USER_VOICE_CALL_LOG
  @GET( UrlConstant.GET_DOC_APPOINTMENT)
  Future<List<DoctorAppointment>> getDoctorAppointment();

  @GET( UrlConstant.GET_SUBSCRIPTION)
  Future<List<Subscription>> getSubscription();

  @GET( UrlConstant.GET_VIDEO_CREDENTIAL)
  Future<CallToken> getCallToken();


  @GET( UrlConstant.GET_AUDIO_CREDENTIAL)
  Future<CallToken> getAudioCallToken();



   @GET( UrlConstant.GET_PROFILE)
  Future<UserGeneral> getUserProfile();

  @GET( UrlConstant.GET_DOCTOR_PROFILE)
  Future<UserGeneral> getDoctorProfile();


  @POST(UrlConstant.UPDATE_DOCTOR_PROFILE)
  Future<user> updateDoctor(@Field("firstname") String firstname, @Field("lastname") String lastname,
      @Field("email") String email, @Field("dob") String dob,
      @Field("sex") String sex, @Field("nationality") String nationality,
      @Field("address") String address, @Field("language") String language,);



  @POST(UrlConstant.UPDATE_PATIENT_PROFILE)
  Future<user> updatePatient(@Field("firstname") String firstname, @Field("lastname") String lastname,
      @Field("email") String email, @Field("dob") String dob,
      @Field("sex") String sex, @Field("nationality") String nationality,
      @Field("address") String address);


  @GET( "api/resend_otp/{id}")
  Future<user> resendOtp(@Path("id") String id);


//http://178.128.144.191/api/resend_otp/{mobile
//  @PUT( UrlConstant.UPDATE_USER_BASIC)
//  Future<BaseData> updateBasisProfile(@Field("first_name") String first_name, @Field("surname") String surname,
//      @Field("dob") String dob, @Field("email") String email,@Field("gender") String gender,);
//
//
//
//  @PUT( UrlConstant.UPDATE_USER_BUSSINESS)
//  Future<BaseData> updateBusiness(@Field("business_name") String business_name, @Field("location") String location,
//      @Field("state") String state, @Field("lga") String lga);
//
//
//  @PUT(UrlConstant.ADD_USER_PIN)
//  Future<BaseData> addPin(@Field("password") String password);
//
//
//
//  @PUT( UrlConstant.VERIFY_OTP)
//  Future<BaseData> verifyOtp(@Field("otp") String email);
//
//
//
//
//  @GET( UrlConstant.WALLET_HISTORY)
//  Future<BaseData> getWalletHistory();
//
//  @GET(UrlConstant.TRANSACTION_HISTORY)
//  Future<BaseData> getTransactionHistory();

//  @PUT(UrlConstant.ADD_USER_PROFILE)
//  Future<BaseData> AddImage(@Part() File image);
}