
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/payment/create_access.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';









class PaymentScreen extends StatefulWidget{


  @override
  _PaymentScreen createState()  =>  _PaymentScreen();

}


class _PaymentScreen extends State<PaymentScreen>{


  @override
  void initState() {


    super.initState();



  }










  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {






    return Scaffold(
        body:SingleChildScrollView(
          child:  Form(
            key: _formKey,
            child:  Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(
                    height: 30,
                  ),

                  GestureDetector(
                    onTap: ()=>{
                      Navigator.pop(context)
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        Text("Go back",style: TextStyle(color: Colors.black),),
                        Spacer()
                      ],
                    ),
                  ),



                ],
              ),
            ),
          )
        )
    );
  }

}