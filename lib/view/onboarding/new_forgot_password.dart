import 'package:agro_ecomance/rxbloc_pattern/login_bloc.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';

class NewPassword extends StatefulWidget {


  @override
  _Screen23State createState() => _Screen23State();
}

class _Screen23State extends State<NewPassword> {
  String phoneNumber;
  String phoneIsoCode;

  var _otp = TextEditingController();
  var _password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _showPassword = true;


  String otp_secret;
  @override
  Widget build(BuildContext context) {
    otp_secret = ModalRoute.of(context).settings.arguments;


    Widget otp = Container(
        child: TextFormField(
          controller: _otp,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Enter OTP Code',label: 'Enter OTP Code'),
          keyboardType: TextInputType.number,
          maxLength: 6,
          validator: (value){
            if(value.isEmpty ||  value.length <5 ){
              return 'Otp code is not valid';
            }
            return null;
          },
        )
    );





    Widget password = Container(
        child: TextFormField(

          controller: _password,
          obscureText: _showPassword,
          decoration: InputDecoration(
              hintText: "New Password",
              //#2C2C2C
              hintStyle: TextStyle(color: Colors.grey),
              labelText: "New Password",
              labelStyle: TextStyle(color: Colors.grey),
              hoverColor: Colors.black,
              fillColor: Colors.grey[100].withOpacity(0.1),
              filled: true,

              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              suffixIcon: IconButton(
                icon: Icon(

                    _showPassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _showPassword = _showPassword?false: true;
                  });
                },
                color: Colors.green,
              )),

          keyboardType: TextInputType.text,

          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Password';
            }
            return null;
          },
        )

    );




    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
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
                height: 70.0,
              ),
              Text(
                "Your new password",
                style: TextStyle(
                    fontSize: 22,
                    color: ReUseAble().getButtonColor(),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 10.0,
              ),

              otp,
              SizedBox(
                height: 20.0,
              ),
              password,

              SizedBox(
                height: 40.0,
              ),
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

                    if (formKey.currentState.validate()) {

                      //String first_name,String last_name,String phone,String password,
                      loginBloc.completeForgetPassword(otp_secret, _otp.text,  _password.text, context);
                    }



                  },
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
