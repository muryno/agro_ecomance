




import 'package:agro_ecomance/view/Item_dashboard_details.dart';
import 'package:agro_ecomance/view/Sign_up_screen.dart';
import 'package:agro_ecomance/view/cart_screen.dart';
import 'package:agro_ecomance/view/dashboard.dart';
import 'package:agro_ecomance/view/dashboard_details.dart';
import 'package:agro_ecomance/view/login_screen.dart';
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
      //
      // case PageRouteConstants.inbox:
      //   return MaterialPageRoute(builder: (_) => Inbox(),settings: RouteSettings( arguments: settings.arguments));
      //


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
