// import 'dart:ui';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RaisedGradientButton.dart';
import '../share_pref.dart';


class PersonalDialogBox extends StatefulWidget {


  final  BuildContext context;

  const PersonalDialogBox(
      {Key key,  this.context})
      : super(key: key);

  @override
  _PersonalDialogBox createState() => _PersonalDialogBox();
}

class _PersonalDialogBox extends State<PersonalDialogBox> {

  var _displayName = TextEditingController();
  var _Name = TextEditingController();
  var _email = TextEditingController();
  var _phone = TextEditingController();




  @override
  void initState() {


    StorageUtil.getProfileUser().then((value) =>
    {
      if (value != null ){


          setState(() {
            _displayName.text = value.display_name != null ? value.display_name : "";
            _Name.text = "${value.first_name != null ? value.first_name : ""} ${value.last_name != null ? value.last_name : ""} " ?? "";
            _email.text = value.email.toString();
            _phone.text = value.phone.toString();
          })
        }

    }

    );

    super.initState();
  }



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

    Widget firstName = Container(
        child: TextFormField(
          controller: _displayName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Display Name',label: 'Display Name'),
          keyboardType: TextInputType.emailAddress,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Display Name ';
            }
            return null;
          },
        )
    );


    Widget lastName = Container(
        child: TextFormField(
          controller: _Name,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Name',label: 'Name'),
          keyboardType: TextInputType.text,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Name ';
            }
            return null;
          },
        )
    );

    Widget email = Container(
        child: TextFormField(
          controller: _email,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Email',label: 'Email'),
          keyboardType: TextInputType.emailAddress,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Email Address';
            }
            return null;
          },
        )
    );


    Widget phone = Container(
        child: TextFormField(
          controller: _phone,

          decoration: ReUseAble().inputWithoutIcon(hint: 'Phone number',label: 'Phone number'),
          keyboardType: TextInputType.number,

          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Phone number';
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
                      child:  Text("Personal Information",style: TextStyle(color: Color(0xff3EB120),fontWeight: FontWeight.bold,fontSize: 25),)
                  ),

                  SizedBox(height: 15,),
                  firstName,
                  SizedBox(height: 15,),
                  lastName,
                  SizedBox(height: 15,),
                  phone,
                  SizedBox(height: 15,),
                  email,

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
                          // settingBloc.startSignUp(_phone.text, _referalCode.text, _fullName.text, _password.text, _email.text, context);

                            settingsBloc.addUpdatePersonal(_displayName.text, _email.text, _Name.text, _phone.text, context);
                          }
                          //  var _displayName = TextEditingController();
                          //   var _Name = TextEditingController();
                          //   var _email = TextEditingController();
                          //   var _phone = TextEditingController();

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
