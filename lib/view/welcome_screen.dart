



import 'dart:io';


import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';






class WelcomeScreen extends StatefulWidget{


  @override
  _WelcomeScreen createState()  =>  _WelcomeScreen();

}


class _WelcomeScreen extends State<WelcomeScreen>{


  @override
  Widget build(BuildContext context) {




    return Scaffold(


        body: SingleChildScrollView(
          child: Container(
            color: Colors.white54,


            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,


              children: [



                      SizedBox(
                        height: 66.0,
                      ),


                Center(
                  child:   Image.asset(
                    'assets/images/logo.png',
                  ),


                ),

                SizedBox(
                  height: 76.0,
                ),

                Text("Explore Us",style: TextStyle(fontSize: 45,fontFamily: 'GothamRegular',color: Color(0xff3EB120)),),

                SizedBox(
                  height: 56.0,
                ),

                Image.asset(
                  'assets/images/splash.png',
                ),

                SizedBox(
                  height: 26.0,
                ),


                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: RaisedGradientButton(
                      child: Text(
                        'Sign Up with email or phone number',
                        style: TextStyle(fontSize: 14,fontFamily: 'PoppinsBook',color: Colors.white),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed(PageRouteConstants.signUpScreen);
                      }
                  ),
                ),



                SizedBox(
                  height: 30.0,
                ),

              RichText(
                text: new TextSpan(
                  text: 'Already registered? ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                    text: ' Login',
                        style: TextStyle(fontSize: 16,fontFamily: 'PoppinsBold',color: Color(0xff3DAF1C)),


                        recognizer: TapGestureRecognizer()..onTap = () =>{
                        Navigator.of(context).pushNamed(PageRouteConstants.loginScreen)
                        }
                     ),

                  ],
                ),
              ),

                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(PageRouteConstants.dashBoardScreen);
                  },
                  child:      Text("Go back home",style: TextStyle(fontSize: 14,fontFamily: 'PoppinsBook',color: Colors.black),),
                ),


                SizedBox(height: 20,),
              ],
                  ),
                ),




          ),
        );

  }


  GestureRecognizer gotoLogin(){

  }



}


