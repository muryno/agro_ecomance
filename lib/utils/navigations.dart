


import 'package:flutter/material.dart';

class NavigationRoute{
   GlobalKey<NavigatorState> navigatorKey ;

  NavigationRoute(){
    navigatorKey =  GlobalKey<NavigatorState>();
  }

  initNav(){
    return  navigatorKey;
  }

   navigateTo(String routeName, [dynamic request]) {
     navigatorKey.currentState.pushNamedAndRemoveUntil(
         routeName, (r) => true, arguments: request);
   }
}