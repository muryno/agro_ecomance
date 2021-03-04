


import 'dart:async';


import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/login_bloc.dart';
import 'package:flutter/material.dart';



import 'package:async/async.dart';


class BackgroundUtils{

  static    getTimers({BuildContext context,int times = 100}){


     RestartableTimer(Duration(seconds: times), ()=>{
       loginBloc.refreshToken(context: context)
    }
    );
  }


  static  RestartableTimer   updateCart({int product_id ,int weight, int  quantity}){

    var timer =  RestartableTimer(Duration(seconds: 8), ()=>{
      cartBloc.updateCartData(product_id, weight,quantity)
    }
    );

   if(timer.isActive) {
     timer.cancel();
     timer.reset();
   }
  }
}