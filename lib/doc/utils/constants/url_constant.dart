class UrlConstant {
  static const String BASE_URL =
      "http://178.128.144.191/";


  //Login
  static const String LOGIN = "api/login";
  static const String REGISTER_USER =  "api/register";
  static const String VERIFY_OTP=  "api/post_token_confirmation";
  static const String ATTEMPT_REG =  "api/get_contact_token";

  static const String GET_SPECIALITY =  "api/get_specialty";

  static const String GET_SPECIALIZE_DOC =  "api/get_specialist_doctor/1";

  static const String GET_APPOINTMENT_TIME =  "api/get_appointment_time/2/2020-09-23/2";

  static const String GET_APPOINTMENT_SESSION=  "api/get_appointment_session";

  static const String SUBMIT_APPOINTMENT =  "api/submit_appointment";

  static const String  GET_USER_APPOINTMENT =  "api/get_user_appointment";

  static const String  GET_SUBSCRIPTION =  "api/all_subscription";


  static const String  GET_DOC_APPOINTMENT =  "api/doctor_seven_days_appointment";


  static const String  GET_VIDEO_CREDENTIAL =  "api/get_video_credential";

  static const String  GET_AUDIO_CREDENTIAL =  "api/get_voice_credential";

  static const String  GET_PROFILE=  "api/get_user_details";

  static const String  USER_VOICE_CALL_LOG=  "api/user_voice_log";

  static const String  DOCTOR_VOICE_CALL_LOG=  "api/doctor_voice_log";



  static const String  GET_DOCTOR_PROFILE=  "api/get_doctor_details";

  static const String  UPDATE_DOCTOR_PROFILE=  "api/update_doctor_profile";

  static const String  UPDATE_PATIENT_PROFILE=  "api/update_user_profile";
////
  static const String  RESEND_OTP=  "api/resend_otp/";

  static const String AGORA_KEY = "7d778d68673143819f1a676e625a9da4";


  static const String USER_PREF = "Doconcall247";
  static const String USER_PROF_PREF = "USERPROFILE";

  static const String      PAYSTACK_LIVE    = "sk_live_8d478f401d0cc6dcda0c562779cb80ea77906d0c";

//
//  static const String      PAYSTACK_SECRETE_kEY     = "sk_test_94fd9a7241e410d2a4f8b8dc36b823a6e5199b56";
//
//  static const String       PAYSTACK_PUBLIC_KEY    = "pk_test_b5ea48205fcd181ee3487efe2391ec999285356b";

  static const String      PAYSTACK_SECRETE_kEY     = "sk_live_8d478f401d0cc6dcda0c562779cb80ea77906d0c";

  static const String       PAYSTACK_PUBLIC_KEY    = "pk_live_5c4174557d179cea47ba3e1057e3f654d77720fc";

  static const String connectionFails = "Cannot connect to Doc 24/7, check your internet connection";
}
