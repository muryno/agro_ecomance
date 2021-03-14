import 'package:agro_ecomance/rxbloc_pattern/login_bloc.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';


class ForgotPassword extends StatefulWidget {


  @override
  _Screen23State createState() => _Screen23State();
}

class _Screen23State extends State<ForgotPassword> {
  String phoneNumber;
  String phoneIsoCode;

  var _email = TextEditingController();
  var _phone = TextEditingController();







  @override
  Widget build(BuildContext context) {
    Widget email = Container(
        child: TextFormField(

          controller: _email,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Email',label: 'Email  '),
          keyboardType: TextInputType.emailAddress,


        )
    );



    Widget number = Container(
        child: TextFormField(

          controller: _phone,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Phone number',label: 'Phone number'),
          keyboardType: TextInputType.number,


        )
    );



    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             SizedBox(
              height: 50.0,
            ),

            InkWell(
              onTap: ()=>{
                Navigator.of(context).pop()
              },
              child:   Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Icon(Icons.arrow_back_ios,color: Colors.black,size: 29,),
                  Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 13,
                      )
                  ),
                ],
              ),
            ),
             SizedBox(
              height: 40.0,
            ),
            Text(
              "Forgot your password?",
              style: TextStyle(
                  fontSize: 22,
                  color: ReUseAble().getButtonColor(),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            Spacer(),



            email,

            SizedBox(
              height: 40.0,
            ),

             Container(
               alignment: Alignment.center,
               child:  Text("OR"),
             ),
             SizedBox(
              height: 40.0,
            ),
            number,



            Spacer(),
            ButtonTheme(
              minWidth: double.infinity,
              height: 45,
              child: RaisedButton(
                elevation: 0.0,
                textColor: Colors.white,
                color: ReUseAble().getButtonColor(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text("Reset Password"),
                onPressed: () {
                  if(  _phone.text.isEmpty &&  _email.text.isEmpty){
                    return Helper.toastError("Enter your Email or phone number");

                  }

                  if(  _phone.text.isEmpty == false){
                    loginBloc.startForgetPhonePassword(   _phone.text, context);
                  }


                  if(  _email.text.isEmpty == false){
                    loginBloc.startForgetEmailPassword( _email.text,   context);
                  }



                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
