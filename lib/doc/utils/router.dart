

import 'package:doc_on_call_24_7_mobile/view/chat/appointment_chat.dart';
import 'package:doc_on_call_24_7_mobile/view/appointment/appointment_detail.dart';
import 'package:doc_on_call_24_7_mobile/view/appointment/book_appointment.dart';

import 'package:doc_on_call_24_7_mobile/view/chat/display_all_doctor_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/doctor/doctor_appointment_detail.dart';
import 'package:doc_on_call_24_7_mobile/view/doctor/doctor_history_detail.dart';
import 'package:doc_on_call_24_7_mobile/view/doctor/doctor_history_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/doctor/doctor_main_buttom_nav_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/general/edit_profile_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/general/notification_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/general/subscription_screen_successDialog.dart';
import 'package:doc_on_call_24_7_mobile/view/onboarding_pages/forgotpassword_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/onboarding_pages/login_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/onboarding_pages/new_password_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/onboarding_pages/otp_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/onboarding_pages/phone_number_registration_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/onboarding_pages/registration_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/patient_home/main_buttom_nav_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/patient_home/patient_appointment_detail.dart';
import 'package:doc_on_call_24_7_mobile/view/patient_home/patient_call_history_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/phamarcy/pharmacy_home_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/splash/splash_pager.dart';
import 'package:doc_on_call_24_7_mobile/view/video/Doctor_video.dart';
import 'package:doc_on_call_24_7_mobile/view/video/call_for_video.dart';
import 'package:doc_on_call_24_7_mobile/view/video/call_video_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/video/doctor_give_medication.dart';
import 'package:doc_on_call_24_7_mobile/view/video/pickup_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/voiceCall/Audio_pickup_screen.dart';
import 'package:doc_on_call_24_7_mobile/view/voiceCall/call_for_voice.dart';
import 'package:doc_on_call_24_7_mobile/view/voiceCall/voice_call.dart';
import 'package:flutter/material.dart';




import 'constants/page_route_constants.dart';


class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteConstants.view_page:
        return MaterialPageRoute(builder: (_) => WelcomeActivity());

      case PageRouteConstants.patient_home_screen:
        return MaterialPageRoute(builder: (_) => PatientHome());


      case PageRouteConstants.login_screen:
        return MaterialPageRoute(builder: (_) => LoginScreen());


      case PageRouteConstants.PhoneNumberRegScreen:
        return MaterialPageRoute(builder: (_) => PhoneNumberRegScreen());


      case PageRouteConstants.otpScreen:
        return MaterialPageRoute(builder: (_) => OtpScreen(),settings: RouteSettings( arguments: settings.arguments));

      case PageRouteConstants.RegistrationScreen:
        return MaterialPageRoute(builder: (_) => RegistrationScreen(),settings: RouteSettings( arguments: settings.arguments));


      case PageRouteConstants.PhoneNumberRegScreen:
        return MaterialPageRoute(builder: (_) => PhoneNumberRegScreen());



      case PageRouteConstants.ChatDoctorsScreen:
        return MaterialPageRoute(builder: (_) => ChatDoctorsScreen());

      case PageRouteConstants.AppointmentDetails:
        return MaterialPageRoute(builder: (_) => AppointmentDetails());


      case PageRouteConstants.BookAppointment:
        return MaterialPageRoute(builder: (_) => BookAppointment(),settings: RouteSettings( arguments: settings.arguments));

      case PageRouteConstants.DoctorHistoryDetails:
        return MaterialPageRoute(builder: (_) => DoctorHistoryDetails(),settings: RouteSettings( arguments: settings.arguments));

      case PageRouteConstants.doctor_home_screen:
        return MaterialPageRoute(builder: (_) => DoctorNavHome());

      case PageRouteConstants.doctorAppointmentReview:
        return MaterialPageRoute(builder: (_) => DoctorAppointmentReview(),settings: RouteSettings( arguments: settings.arguments));

      case PageRouteConstants.AppointmentChat:
        return MaterialPageRoute(builder: (_) =>  AppointmentChat(),settings: RouteSettings( arguments: settings.arguments));

//

      case PageRouteConstants.ChatPickupScreen:
        return MaterialPageRoute(builder: (_) => DoctorHistoryDetails(),settings: RouteSettings( arguments: settings.arguments));


      case PageRouteConstants.PatientAppointmentDetails:
      return MaterialPageRoute(builder: (_) => PatientAppointmentDetails());

      case PageRouteConstants.PharmacyHomeScreen:
        return MaterialPageRoute(builder: (_) => PharmacyHomeScreen());

//


      case PageRouteConstants.DoctorMedication:
        return MaterialPageRoute(builder: (_) => DoctorMedication(),settings: RouteSettings( arguments: settings.arguments));


      case PageRouteConstants.DoctorAppointmentDetails:
        return MaterialPageRoute(builder: (_) => DoctorAppointmentDetails(),settings: RouteSettings( arguments: settings.arguments));

      case PageRouteConstants.SubscriptionScreen:
        return MaterialPageRoute(builder: (_) => SubscriptionScreen(),settings: RouteSettings( arguments: settings.arguments));
//

      case PageRouteConstants.DoctorHistory:
        return MaterialPageRoute(builder: (_) => DoctorHistory());


      case PageRouteConstants.PatientCallHistory:
        return MaterialPageRoute(builder: (_) => PatientCallHistory());


      case PageRouteConstants.CallAudioPage:
        return MaterialPageRoute(builder: (_) => CallAudioPage(),settings: RouteSettings( arguments: settings.arguments));


      case PageRouteConstants.VoiceCall:
        return MaterialPageRoute(builder: (_) => VoiceCall());

      case PageRouteConstants.CallerScreen:
        return MaterialPageRoute(builder: (_) => CallerScreen());

        //
      case PageRouteConstants.ConfirmNewScreen:
        return MaterialPageRoute(builder: (_) => ConfirmNewScreen(),settings: RouteSettings( arguments: settings.arguments));


      case PageRouteConstants.CallPage:
        return MaterialPageRoute(builder: (_) => CallPage(),settings: RouteSettings( arguments: settings.arguments));


      case PageRouteConstants.EditProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());



      case PageRouteConstants.NotificationScreen:
        return MaterialPageRoute(builder: (_) => NotificationScreen());




      case PageRouteConstants.ForgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
//

//
//      case PageRouteConstants.login_screen:
//        return MaterialPageRoute(builder: (_) => LoginScreen(),settings: RouteSettings( arguments: settings.arguments));
//
//      case PageRouteConstants.biometric:
//        return MaterialPageRoute(builder: (_) => Biometric(),settings: RouteSettings( arguments: settings.arguments));

//      case PageRouteConstants.profileScreen:
//        return MaterialPageRoute(builder: (_) => ProfileScreen());
//
//      case PageRouteConstants.historyBottomHome:
//        return MaterialPageRoute(builder: (_) => HistoryBottomHome());
//
//      case PageRouteConstants.homeScreen:
//        return MaterialPageRoute(builder: (_) => HomeScreen(),settings: RouteSettings( arguments: settings.arguments));
//
//
//      case PageRouteConstants.transactionScreen:
//        return MaterialPageRoute(builder: (_) => TransactionScreen());
//
//      case PageRouteConstants.transactionBreakdownScreen:
//        return MaterialPageRoute(builder: (_) => TransactionBreakdownScreen());
//
//      case PageRouteConstants.inboxScreen:
//        return MaterialPageRoute(builder: (_) => InboxScreen());
//
//      case PageRouteConstants.referAgentScreen:
//        return MaterialPageRoute(builder: (_) => ReferAgentScreen());
//
//      case PageRouteConstants.fundWalletScreen:
//        return MaterialPageRoute(builder: (_) => FundWalletScreen());
//
//      case PageRouteConstants.walletToWalletScreen:
//        return MaterialPageRoute(builder: (_) => WalletToWalletScreen());
//
//      case PageRouteConstants.addNewBankAccountScreen:
//        return MaterialPageRoute(builder: (_) => AddNewBankAccountScreen());
//
//      case PageRouteConstants.settingsScreen:
//        return MaterialPageRoute(builder: (_) => SettingsScreen());
//
//
//      case PageRouteConstants.takingPicture:
//        return MaterialPageRoute(builder: (_) => TakingPicture());
//
//      case PageRouteConstants.setUpOutletScreen:
//        return MaterialPageRoute(builder: (_) => SetUpOutletScreen());
//    //
//      case PageRouteConstants.passwordPinScreen:
//        return MaterialPageRoute(builder: (_) => PasswordPinScreen(),settings: RouteSettings( arguments: settings.arguments));
//
//      case PageRouteConstants.otpScreen:
//        return MaterialPageRoute(builder: (_) => OtpScreen(),settings: RouteSettings( arguments: settings.arguments));
        //OtpScreen
//      case PageRouteConstants.request_detail:
//        return MaterialPageRoute(builder: (_) => RequisitionDetailActivity(), settings: RouteSettings( arguments: settings.arguments));
//      case PageRouteConstants.signature:
//        return MaterialPageRoute(builder: (_) => SignatureActivity(), settings: RouteSettings( arguments: settings.arguments));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
