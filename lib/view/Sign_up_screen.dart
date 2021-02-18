import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/rxbloc_pattern/login_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';








class  SignUpScreen extends StatefulWidget{


  @override
  _SignUpScreen createState()  =>  _SignUpScreen();

}


class _SignUpScreen extends State<SignUpScreen>{

  final progressKey = GlobalKey();

  var _fullName = TextEditingController();
  var _email = TextEditingController();
  var _phone = TextEditingController();
  var _referalCode = TextEditingController();
  var _password = TextEditingController();

  bool _showPassword = true;

  bool _showReferralCode = true;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;








    Widget userName = Container(
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

    Widget fullName = Container(
        child: TextFormField(
          controller: _fullName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Full Name',label: 'Full Name'),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Full name';
            }
            return null;
          },
        )
    );




    Widget password = Container(
        child: TextFormField(
          controller: _password,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "Password",
              //#2C2C2C
              hintStyle: TextStyle(color: Colors.grey),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.grey),
              hoverColor: Colors.black,
              fillColor: Colors.grey[100].withOpacity(0.1),
              filled: true,
              suffix: Text('Password'),
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
                    _showPassword = !_showPassword;
                  });
                },
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

    Widget referalCode = Container(
        child: TextFormField(

          controller: _referalCode,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "Referral Code",
              //#2C2C2C
              hintStyle: TextStyle(color: Colors.grey),
              labelText: "Referral Code",
              labelStyle: TextStyle(color: Colors.grey),
              hoverColor: Colors.black,
              fillColor: Colors.grey[100].withOpacity(0.1),
              filled: true,
              suffix: Text('Referral Code'),
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
                    _showReferralCode ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _showReferralCode = !_showPassword;
                  });
                },
              )),

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
                              child:  Text("Sign Up",style: TextStyle(color: Color(0xff3EB120),fontWeight: FontWeight.bold,fontSize: 25),)
                          ),

                          SizedBox(height: 15,),
                          fullName,
                          SizedBox(height: 15,),
                          userName,
                          SizedBox(height: 15,),
                          phone,
                          SizedBox(height: 15,),
                          referalCode,
                          SizedBox(height: 15,),
                          password,
                          SizedBox(height: 35,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: RaisedGradientButton(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                                ),
                                onPressed: (){
                                  if (formKey.currentState.validate()) {
                                    loginBloc.startSignUp(_phone.text, _referalCode.text, _fullName.text, _password.text, _email.text, context);
                                    //String first_name,String last_name,String phone,String password,
                                 //   loginBloc.attempLogin("user",  this._email.text,this._password.text, context);
                                  }

                                }
                            ),
                          ),


                          const SizedBox(
                            height: 12.0,
                          ),


                          Center(
                              child: InkWell(
                                onTap: ()=>{
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: "Don’t have an account ? ",
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: " Sign In",
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context).pushNamed(PageRouteConstants.loginScreen);
                                            },
                                          style: TextStyle(
                                            color: Color(0XFF3ABC16),
                                          ),
                                        )
                                      ],
                                      style: TextStyle(color: Colors.black)),
                                ),
                              )
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
        )

        ],


      )
    );




  }


}//
