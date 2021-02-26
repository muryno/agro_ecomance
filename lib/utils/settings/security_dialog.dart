// import 'dart:ui';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';

import '../RaisedGradientButton.dart';


class SecurityDialogBox extends StatefulWidget {


  final  BuildContext context;

  const SecurityDialogBox(
      {Key key,  this.context})
      : super(key: key);

  @override
  _SecurityDialogBox createState() => _SecurityDialogBox();
}

class _SecurityDialogBox extends State<SecurityDialogBox> {

  var currentPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmnewPassword = TextEditingController();




  final formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {



    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }



  contentBox(context) {

    Widget current_password = Container(
        child: TextFormField(
          controller: currentPassword,
          decoration: ReUseAble().inputWithoutIcon(hint: 'current password',label: 'current password'),
          keyboardType: TextInputType.visiblePassword,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your current password ';
            }
            return null;
          },
        )
    );


    Widget _new_password = Container(
        child: TextFormField(
          controller: newPassword,
          decoration: ReUseAble().inputWithoutIcon(hint: 'New password',label: 'New password'),
          keyboardType: TextInputType.visiblePassword,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your New password ';
            }
            return null;
          },
        )
    );

    Widget _confirm_password = Container(
        child: TextFormField(
          controller: confirmnewPassword,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Confirm password',label: 'Confirm password'),
          keyboardType: TextInputType.visiblePassword,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Confirm password';
            }
            return null;
          },
        )
    );




    return Center(
      child:    Form(
        key: formKey,
        child: Container(
        height: 700,
        width: MediaQuery.of(context).size.width-80,

        padding: EdgeInsets.only(
            left: Constants.padding,
            top: Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding),
        margin: EdgeInsets.only(top: Constants.avatarRadius),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        child: Stack(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:  Column(


                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  SizedBox(height: 25,),

                  InkWell(
                    child:    Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    onTap: (){
                      Navigator.of(context).pop();

                    },
                  ),
                  SizedBox(height: 30,),



                  Container(
                      padding: EdgeInsets.only(top: 40,bottom: 15),
                      child:  Text("Change password",style: TextStyle(color: Color(0xff3EB120),fontWeight: FontWeight.bold,fontSize: 25),)
                  ),

                  SizedBox(height: 15,),
                  current_password,
                  SizedBox(height: 15,),
                  _new_password,
                  SizedBox(height: 15,),
                  _confirm_password,


                  SizedBox(height: 35,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: RaisedGradientButton(
                        child: Text(
                          'Save change',
                          style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                        ),
                        onPressed: (){
                          if (formKey.currentState.validate()) {


                            settingsBloc.changePassword( this.currentPassword.text, this.newPassword.text,this.confirmnewPassword.text, context);

                          }

                        }
                    ),
                  ),






                  SizedBox(
                    height: 20,
                  ),

                ],

              ),
            ),

          ],
        )
      ),
      )
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
