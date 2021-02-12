




import 'package:agro_ecomance/view/Item_dashboard_details.dart';
import 'package:agro_ecomance/view/Sign_up_screen.dart';
import 'package:agro_ecomance/view/add_address_screen.dart';
import 'package:agro_ecomance/view/address_screen.dart';
import 'package:agro_ecomance/view/cart_screen.dart';
import 'package:agro_ecomance/view/checkout_screen.dart';
import 'package:agro_ecomance/view/confirm_payment_screen.dart';
import 'package:agro_ecomance/view/dashboard.dart';
import 'package:agro_ecomance/view/dashboard_details.dart';
import 'package:agro_ecomance/view/login_screen.dart';
import 'package:agro_ecomance/view/payment_screen.dart';
import 'package:agro_ecomance/view/verifyotp.dart';
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
        return MaterialPageRoute(builder: (_) => ItemDashBoardDetailsScreen());

      case PageRouteConstants.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());

      case PageRouteConstants.addressScreen:
        return MaterialPageRoute(builder: (_) => AddressScreen());


      case PageRouteConstants.addAddressScreen:
        return MaterialPageRoute(builder: (_) => AddAddressScreen());

      case PageRouteConstants.paymentScreen:
        return MaterialPageRoute(builder: (_) => PaymentScreen());

      case PageRouteConstants.checkOutScreen:
        return MaterialPageRoute(builder: (_) => CheckOutScreen());

      case PageRouteConstants.confirmPaymentScreen:
        return MaterialPageRoute(builder: (_) => ConfirmPaymentScreen());
      //
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
