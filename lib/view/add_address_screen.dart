import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';








class  AddAddressScreen extends StatefulWidget{


  @override
  _AddAddressScreen createState()  =>  _AddAddressScreen();

}


class _AddAddressScreen extends State<AddAddressScreen>{

  final progressKey = GlobalKey();

  var _fullName = TextEditingController();
  var _userName = TextEditingController();
  var _referalCode = TextEditingController();
  var _password = TextEditingController();

  bool _showPassword = true;

  bool _showReferralCode = true;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;








    Widget address = Container(
        child: TextFormField(
          controller: _userName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Address Line',label: 'Address Line'),
          keyboardType: TextInputType.text,
        )
    );

    Widget name = Container(
        child: TextFormField(
          controller: _fullName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Name',label: 'Name'),
          keyboardType: TextInputType.text,
        )
    );

    Widget city = Container(
        child: TextFormField(
          controller: _fullName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'City',label: 'City'),
          keyboardType: TextInputType.text,
        )
    );

    Widget postal = Container(
        child: TextFormField(
          controller: _fullName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Postal Code',label: 'Postal Code'),
          keyboardType: TextInputType.text,
        )
    );


    Widget phone_ = Container(
        child: TextFormField(
          controller: _fullName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Phone number',label: 'Phone number'),
          keyboardType: TextInputType.text,
        )
    );



    final formKey = GlobalKey<FormState>();



    return Scaffold(


      body:  Stack(


        children: <Widget>[

        SingleChildScrollView(
          child:   Form(
            key: formKey,
            child: Container (
                width: size.width,
                height: size.height,
                margin: EdgeInsets.only(top: 50),

                child: Stack(
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child:  Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[

                          SizedBox(height: 35,),

                          InkWell(
                            child:    Icon(
                              Icons.arrow_back_outlined,

                              size: 25,
                            ),
                            onTap: (){
                              Navigator.of(context).pop();

                            },
                          ),


                          SizedBox(height: 30,),

                          Container(
                              padding: EdgeInsets.only(top: 40,bottom: 15),
                              child:  Text("Create Address",style: TextStyle(color: Color(0xff3EB120),fontFamily:'PoppinsRegular' ,fontSize: 25),)
                          ),

                          SizedBox(height: 15,),
                          name,
                          SizedBox(height: 15,),
                          address,
                          SizedBox(height: 15,),
                          city,
                          SizedBox(height: 15,),
                          postal,
                          SizedBox(height: 15,),
                          phone_,
                          SizedBox(height: 35,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: RaisedGradientButton(
                                child: Text(
                                  'Add Address',
                                  style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                                ),
                                onPressed: (){
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      PageRouteConstants.dashBoardScreen, (r) => false
                                  );
                                }
                            ),
                          ),


                        ],

                      ),
                    ),

                  ],
                )
            ),
          )
        )

        ],


      )
    );




  }


}//
