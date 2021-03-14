

import 'package:agro_ecomance/entity/db/database.dart';
import 'package:agro_ecomance/utils/background_utils.dart';
import 'package:agro_ecomance/utils/login_custom_dialog.dart';
import 'package:agro_ecomance/utils/navigation_service.dart';
import 'package:agro_ecomance/utils/router.dart';
import 'package:agro_ecomance/view/sidebar/Network.dart';
import 'package:agro_ecomance/view/sidebar/commision.dart';
import 'package:agro_ecomance/view/sidebar/dashboard.dart';
import 'package:agro_ecomance/view/sidebar/ewallet.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:agro_ecomance/view/splash/splash_screens.dart';
import 'package:agro_ecomance/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'onboarding/Sign_up_screen.dart';
import 'cart/add_address_screen.dart';
import 'cart/address_screen.dart';
import 'cart/cart_screen.dart';
import 'sidebar/shoping.dart';
import 'onboarding/login_screen.dart';





class MyApp extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MyApp>{


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {


    AppDatabase.init();
    NavigationService();


    return    MaterialApp(
      onGenerateRoute: Routers.generateRoute,
      debugShowCheckedModeBanner: false,

      builder: EasyLoading.init(),
      home: SplashScreens(),

    );

//{
//     "payment_type": "paycode",
//     "paycode": "4596955164",
//
// }

  //{
    //     "payment_type": "e-wallet",
    //
    // }


    //{
    //     "payment_type": "paystack",
    //

    //     "reference": "9vk1o1zbam"
    // }


  }


}