// import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/page_route_constants.dart';

class CustomDialogBox extends StatefulWidget {


  final  BuildContext context;

  const CustomDialogBox(
      {Key key,  this.context})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
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
          color: Color(0XFF3ABC16),
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'You are about to\n request a booking .\n Would you like to proceed?',textAlign: TextAlign.center,
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
                    Text("Yes, confirm Request",style: TextStyle(fontSize: 16,fontFamily: 'PoppinsBold',color: Color(0XFF3ABC16)),),

                    Spacer(),
                    Icon(
                      Icons.play_circle_filled,
                      color: Color(0XFF3ABC16),
                    )

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


            ButtonTheme(
              minWidth: 150,

              child: RaisedButton(
                elevation: 0.0,
                textColor: Colors.white,
                color: Color(0XFF3ABC16) ,

                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color:  Colors.white ,
                        width: 1,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  children: [
                    Text("No, Cancel Request",style: TextStyle(fontSize: 16,fontFamily: 'PoppinsBold',color: Colors.white),),

                    Spacer(),
                    Icon(
                      Icons.cancel,
                      color: Colors.white,
                    )

                  ],
                ),

                onPressed: () {

                  Navigator.of(context).pop();
                },
              ),
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
