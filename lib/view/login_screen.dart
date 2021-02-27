import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/request/openBefore.dart';
import 'package:agro_ecomance/rxbloc_pattern/login_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';








class  LoginScreen extends StatefulWidget{


  @override
  _LoginPage createState()  =>  _LoginPage();

}


class _LoginPage extends State<LoginScreen>{

  final progressKey = GlobalKey();

  var _email = TextEditingController();
  var _password = TextEditingController();

  bool _showPassword = true;


  login_request   usr;
  @override
  void initState() {


    StorageUtil.saveopenedApp(openBefore(openned: true));


    StorageUtil.getUserDataBiometric().then((value) {
      if (value != null){
        this.usr = value;
      }

    });
    super.initState();
  }


  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;








    Widget userName = Container(
        child: TextFormField(
          controller: _email,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Email or Phone number',label: 'Email or Phone number '),
          keyboardType: TextInputType.emailAddress,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Email Address';
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
                              child:  Text("Login",style: TextStyle(color: Color(0xff3EB120),fontWeight: FontWeight.bold,fontSize: 25),)
                          ),



                          SizedBox(height: 15,),
                          userName,
                          SizedBox(height: 15,),
                          password,
                          SizedBox(height: 35,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: RaisedGradientButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                                ),
                                onPressed: (){

                                  if (formKey.currentState.validate()) {

                                    //String first_name,String last_name,String phone,String password,
                                    loginBloc.attempLogin("user",  this._email.text,this._password.text, context);
                                  }

                                  // Navigator.of(context).pushNamedAndRemoveUntil(
                                  //     PageRouteConstants.dashBoardScreen, (r) => false
                                  // );

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
                                          text: " Sign Up",
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context).pushNamed(PageRouteConstants.signUpScreen);
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


                          Center(
                            child:   Text(
                              "OR",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0XFF3ABC17),
                                  fontFamily: 'PoppinsBold'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),



                          Align(

                            alignment: Alignment.bottomCenter,

                            child: Container(
                              margin: EdgeInsets.only(bottom: 60),

                              child: InkWell(
                                hoverColor: Color(0XFF3ABC16),
                                onTap: ()=>{

                                  if (usr!=null ){
                                    _authenticate(usr,context)
                                  }else{
                                    ReUseAble().curvesDialog(context,"Not Available","TouchID / FaceID is not available for use. Login using username and password to activate", "ok")
                                  }



                                },
                                child: Icon(
                                  Icons.fingerprint,
                                  color: Color(0XFF3ABC16),
                                  size: 80,
                                ),
                              ),
                            ),
                          ),

                          Align(

                              alignment: Alignment.bottomCenter,

                              child: Text("Sign in using biometrics",style: TextStyle(color: Color(0xFF3ABC17),fontSize: 16),)
                          ),
                        ],

                      ),
                    ),







//#



                  ],
                )
            ),
          )
        )

        ],


      )
    );




  }

  final LocalAuthentication auth = LocalAuthentication();
  Future<void> _authenticate(login_request usr,BuildContext context) async {
    bool authenticated = false;
    try {

      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);

    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    if (authenticated){
      loginBloc.attempLogin("user",  usr.email_or_phone,usr.password, context);

    }
  }

}//


//         ],
//       ),
//     );
//   }
//
