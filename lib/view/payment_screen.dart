import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';








class  CheckoutScreen extends StatefulWidget{


  @override
  _PaymentScreen createState()  =>  _PaymentScreen();

}


class _PaymentScreen extends State<CheckoutScreen>{

  final progressKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;






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
                margin: EdgeInsets.only(top: 50,left: 16,right: 16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

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

                    SizedBox(height: 20,),

                    Text("Checkout",style: TextStyle(color: Color(0xff3CBE1B),fontFamily:'PoppinsRegular' ,fontSize: 25),),






                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child:    ButtonTheme(
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          child: Text("Add Card",style: TextStyle(color: Color(0xff3ABC16)),),
                          onPressed: () {
                         //   Navigator.of(context).pushNamed(PageRouteConstants.addAddressScreen);

                          },

                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color:   Colors.grey.withOpacity(0.2),
                                width: 1,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(5.0),


                          ),
                          color: Colors.grey.withOpacity(0.2),
                          textColor: Colors.white,

                        ),
                      ),
                    ),




                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: RaisedGradientButton(
                          child: Text(
                            'Check Out',
                            style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                          ),
                          onPressed: (){
                            Navigator.of(context).pushNamed(PageRouteConstants.checkOutScreen);

                          }
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )

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
