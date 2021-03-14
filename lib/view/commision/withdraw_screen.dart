import 'dart:convert';


import 'package:agro_ecomance/entity/responds/bankDetailResponds.dart';
import 'package:agro_ecomance/entity/responds/bankVerification.dart';
import 'package:agro_ecomance/rxbloc_pattern/ewallet_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class WithdrawScreen extends StatefulWidget {



  @override
  _Screen34To36State createState() => _Screen34To36State();
}

class _Screen34To36State extends State<WithdrawScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  var _amount2 = TextEditingController();
  BankData _bankData;

  final _formSignInKey = GlobalKey<FormState>();
  String avr ;

  @override
  void initState() {

    StorageUtil.getProfileUser().then((value) {
      if (value != null){

        setState(() {

          avr = value.avatar_url;

        });


      }

    });

    ewalletBloc.getDashBoard();

    super.initState();


  }



  @override
  void dispose() {
    ewalletBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    Widget amount_ = Container(
        child: TextFormField(
          controller: _amount2,
          decoration: ReUseAble().inputWithoutIcon(hint: 'How much will you like to withdraw',label: 'How much will you like to withdraw'),
          keyboardType: TextInputType.emailAddress,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter withdraw amount';
            }
            return null;
          },
        )
    );



    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.white,
        actions: [
        ],
      ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child:Container(
            // height: MediaQuery.of(context).size.height * 0.8,
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {

                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          "Make Withdrawal",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0XFFABA3A3),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        )
                      ],
                    ),

                    SizedBox(
                      height: 25,
                    ),


                    Text(
                      "Available Agropoints",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF707070),
                      ),
                    ),

                    StreamBuilder(
                      stream: ewalletBloc.fetchaAgroPoint,
                      builder: (context, AsyncSnapshot< String >  snapshot){
                        if(snapshot.hasData ){
                          return  Text("${snapshot.data}",

                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0XFF3ABC16),
                                  fontFamily: 'PoppinsBold'
                              )
                          );
                              }else if(snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }

                        return CircularProgressIndicator();
                      },
                    ),


                    SizedBox(
                      height: 45,
                    ),



                    amount_,
                    Text(
                      "50,000 = NGN50,000",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFFA6A6A6),
                      ),
                    ),

                    SizedBox(
                      height: 75,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: RaisedGradientButton(
                          child: Text(
                            'Complete Withdraw',
                            style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                          ),
                          onPressed: (){


                          }
                      ),
                    ),

                  ],
                ),
              )
            // ],
            // ),
          )
        ),
      );


  }


}
