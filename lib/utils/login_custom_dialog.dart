// import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/page_route_constants.dart';

class LoginCustomDialogBox extends StatefulWidget {


  final  BuildContext context;

  const LoginCustomDialogBox(
      {Key key,  this.context})
      : super(key: key);

  @override
  _LoginCustomDialogBox createState() => _LoginCustomDialogBox();
}

class _LoginCustomDialogBox extends State<LoginCustomDialogBox> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,

      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Center(
      child:  Container(
        height: 400,

        padding: EdgeInsets.only(
            left: Constants.padding,
            top: Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding),
        margin: EdgeInsets.only(top: Constants.avatarRadius),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black38,
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'We need you to \nSignIn or create an account \nbefore you can make an order',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontFamily: 'PoppinsRegular',color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),

            ButtonTheme(
              minWidth: 150,

              child: RaisedButton(
                elevation: 0.0,
                textColor: Colors.white,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    Text("SignIn using Email or Phone number",style: TextStyle(fontSize: 13,fontFamily: 'PoppinsBold', color: Colors.black38,),),


                  ],
                ),
                onPressed: () {

                  //Navigator.of(context).pushNamed(PageRouteConstants.logisticPay);
                },
              ),
            ),

            SizedBox(
              height: 15,
            ),

            Container(
              alignment: Alignment.center,
              child:
              Text("OR",style: TextStyle(fontSize: 16,fontFamily: 'PoppinsBold',color: Colors.white),),



            ),
            SizedBox(
              height: 15,
            ),


            ButtonTheme(
              minWidth: 150,

              child: RaisedButton(
                elevation: 0.0,
                textColor: Colors.white,
                color: Colors.black38,

                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black38,
                        width: 1,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Container(
                  alignment: Alignment.center,
                  child:
                    Text("Create an account",style: TextStyle(fontSize: 13,fontFamily: 'PoppinsBold',color: Colors.white),),



                ),

                onPressed: () {


                },
              ),
            ),
            SizedBox(
              height: 15,
            ),



                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child:     Container(
                    alignment: Alignment.center,
                    child:Column(
                      children: [
                        Icon(Icons.cancel, size: 20,color: Colors.red,),
                        Text("Cancel",style: TextStyle(fontSize: 15,fontFamily: 'PoppinsBold',color: Colors.red),),

                      ],
                    )
                    ,
                )
                //


            ),
          ],
        ),
      ),
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
