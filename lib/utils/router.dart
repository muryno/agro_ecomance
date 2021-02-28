




import 'package:agro_ecomance/view/cart/payment_screen.dart';
import 'package:agro_ecomance/view/onboarding/Signup_payment_screen.dart';
import 'package:agro_ecomance/view/shoping/CategoriesItems.dart';
import 'package:agro_ecomance/view/shoping/seeAllDetails.dart';
import 'package:agro_ecomance/view/shoping/shoping_details.dart';
import 'package:agro_ecomance/view/onboarding/Sign_up_screen.dart';
import 'package:agro_ecomance/view/cart/add_address_screen.dart';
import 'package:agro_ecomance/view/cart/address_screen.dart';
import 'package:agro_ecomance/view/cart/cart_screen.dart';
import 'package:agro_ecomance/view/cart/checkout_screen.dart';
import 'package:agro_ecomance/view/confirm_payment_screen.dart';
import 'package:agro_ecomance/view/shoping/shoping_details.dart';
import 'package:agro_ecomance/view/sidebar/shoping.dart';
import 'package:agro_ecomance/view/shoping/shoping_details.dart';
import 'package:agro_ecomance/view/onboarding/login_screen.dart';
import 'package:agro_ecomance/view/payment_screen.dart';
import 'package:agro_ecomance/view/onboarding/verifyotp.dart';
import 'package:agro_ecomance/view/welcome_screen.dart';
import 'package:flutter/material.dart';




import 'constants/page_route_constants.dart';


class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case PageRouteConstants.view_page:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());

      case PageRouteConstants.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());


      case PageRouteConstants.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case PageRouteConstants.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case PageRouteConstants.dashBoardScreen:
        return MaterialPageRoute(builder: (_) => DashBoardScreen());

      case PageRouteConstants.dashBoardDetailsScreen:
        return MaterialPageRoute(builder: (_) => DashBoardDetailsScreen());


      case PageRouteConstants.itemDashBoardDetailsScreen:
        return MaterialPageRoute(builder: (_) => ShopingDetails(),settings: RouteSettings( arguments: settings.arguments));

      case PageRouteConstants.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());

      case PageRouteConstants.addressScreen:
        return MaterialPageRoute(builder: (_) => AddressScreen(),settings: RouteSettings( arguments: settings.arguments));


      case PageRouteConstants.addAddressScreen:
        return MaterialPageRoute(builder: (_) => AddAddressScreen());



      case PageRouteConstants.checkOutScreen:
        return MaterialPageRoute(builder: (_) => CheckOutScreen(),settings: RouteSettings( arguments: settings.arguments));

      case PageRouteConstants.confirmPaymentScreen:
        return MaterialPageRoute(builder: (_) => ConfirmPaymentScreen());

      case PageRouteConstants.paymentScreen:
        return MaterialPageRoute(builder: (_) => PaymentScreen());
      case PageRouteConstants.categoryItemScreenScreen:
        return MaterialPageRoute(builder: (_) => CategoryItemScreenScreen());

      case PageRouteConstants.signUpPaymentScreen:
        return MaterialPageRoute(builder: (_) => SignUpPaymentScreen());

      //SignUpPaymentScreen
      case PageRouteConstants.oTPScreen:
        return MaterialPageRoute(builder: (_) => OTPScreen(),settings: RouteSettings( arguments: settings.arguments));



      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
