


import 'dart:convert';


import 'package:agro_ecomance/entity/responds/NetworkResp.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/utils/pin_dialog.dart';
import 'package:agro_ecomance/utils/profile_dialog.dart';
import 'package:agro_ecomance/utils/settings/address_dialog.dart';
import 'package:agro_ecomance/utils/settings/bank_dialog.dart';
import 'package:agro_ecomance/utils/settings/nextKin_dialog.dart';
import 'package:agro_ecomance/utils/settings/personal_dialog.dart';
import 'package:agro_ecomance/utils/settings/security_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'CustomDialog.dart';

import 'package:async/async.dart';

import 'constants/Consts.dart';
import 'constants/page_route_constants.dart';
import 'constants/url_constant.dart';
import 'custom_dialog.dart';






class ReUseAble {

  /// TextField with icon **/
  InputDecoration inputWithSuffixIcon(String str, IconData icon) {
    return InputDecoration(
      hintText: str,
      hintStyle: TextStyle(color: Colors.grey),
      labelText: str,
      labelStyle: TextStyle(color: Colors.grey),
      hoverColor: Colors.black,
      fillColor: Colors.white,

      errorStyle: TextStyle(color: getButtonColor()),
      filled: true,
      suffixIcon: Icon(icon, color:Colors.black,),


    );}

  /// TextField without icon **/

  /// TextField without icon **/
  InputDecoration inputWithoutIcon({String hint, String label,String suffix=''}) {
    return InputDecoration(
      hintText: hint,
      //#2C2C2C
      hintStyle: TextStyle(color: Colors.grey),
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey),
      hoverColor: Colors.black,
      fillColor: Colors.grey[100].withOpacity(0.1),
      filled: true,
      suffix: Text('$suffix'),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),

      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),

    );}


  /// TextField without icon **/
  InputDecoration inputWithoutIconAndBorder(String str) {
    return InputDecoration(
      hintText: str,
      hintStyle: TextStyle(color: Colors.grey),

    );}


  BoxDecoration getBoxDecoration(){
    return  BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5) ,
        color: Colors.white70
    );
  }
//#3abc16
//#858585
//#d8d8d8
//#ffffff


  getGreenColor(){
    return Color(0xFF3abc16);
  }


  getGreyColor(){
    return Color(0xFF858585);
  }

  getLightGreyColor(){
    return Color(0xFFd8d8d8);
  }

  getBackgroundColor(){
    return Color(0xFF2D2D2D);
  }


  getRedColor(){
    return Color(0xFF953233);
  }

  getButtonColor(){
    return Color(0xFF3abc16);
  }


  getDarkGreyColor(){
    return Color(0xFFDADADA);
  }



  //, 100%




//
//  TextStyle getMediumWhite17Font(){
//    return TextStyle(fontFamily: 'GothamBold',fontSize: 17,color: Colors.white);
//  }




   getSnacks(BuildContext context){
    final snackBar = SnackBar(
      content: Text('Copied to Clipboard'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }



  getBackgroundImage(String img,BuildContext context){


    return Container(
      color: ReUseAble().getBackgroundColor(),

      child: Stack(

          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)),
                child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            ReUseAble().getBackgroundColor()
                          ]
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.darken,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height ,
                        decoration: BoxDecoration(

                          image: DecorationImage(
                            image: AssetImage('assets/$img'),
                            fit: BoxFit.cover,
                          ),
                        )
                    ))
            )
          ]
      ),
    );

  }




  Dialog successDialog(context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //this right here
      child: Stack(
        children: [
          Container(
            height: 500.0,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  CircleAvatar(
// borderRadius: BorderRadius.circular(45),
                    radius: 30,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Thank You',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'We have received your request and confirm you after few minutes.',
                      style: TextStyle(
                        color: Colors.black,
// fontSize: 17.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "REFERENCE ID: DOC5673HY",
                    style: TextStyle(
                        fontSize: 13,
                        color: ReUseAble().getRedColor(),
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(thickness: 2.0,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Tue, 27 Mar, 2020 in 3 days",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Appts Time",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "9:00AM",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Dr. Jennifer Kahn\nGeneral Practitioner",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: ReUseAble().getRedColor(),
                              child: Icon(Icons.person, size: 30),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact Type",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "Video",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        ButtonTheme(
                          minWidth: double.infinity,
                          height: 45,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "OK, THANKS!",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: ReUseAble().getButtonColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }








//referesh token base on expire time passed from the token
  void  RefereshTokenHandler([bool checkIfLog,int sec = 50000]){

    var secnd = sec - 36000;

    RestartableTimer(Duration(milliseconds: secnd), ()=>{




    });
  }

  drawerItem(
    {@required String title,
    IconData icon,
    String asset,
    bool isActive = false})
  {
      return      Container(
        color: isActive ? Color(0xff003C5E): Colors.transparent,
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(icon,color: Colors.white , size: 30),

            SizedBox(width: 10,),
            Text(title,style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'PoppinsBook'),),
          ],
        ),
      );
    }



   exitApp(BuildContext context) {
    // Navigator.of(context).pushNamed(PageRouteConstants.logoOut);
  }



  curveDialog(BuildContext context){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return CustomDialogBox(


          );
        }
    );
  }



  requestView(){
    return Container(
        height: 20.0,
        width: 20.0,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0XFF808080)),
              borderRadius: BorderRadius.circular(3.0)),
        ),
        child: Icon(
          Icons.check,
          size: 14,
          color: Colors.green,
        ));
  }


  getTransition(Widget stm){
    return  PageRouteBuilder(
      transitionDuration: Duration(microseconds: 1000),
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return stm;
      },
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return Align(
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },

    );
  }


  curvesDialog(BuildContext context,String title, String  desc, String btn){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return BiometricDialogBox(
            title: title,
            descriptions: desc,
            text: btn,
          );
        }
    );
  }

  curvesProfileDialog(BuildContext context, NetworkData networkData,Meta meta){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return ProfileDialogBox(networkData: networkData,meta: meta);
        }
    );
  }



  personalDialogBox(BuildContext context){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return PersonalDialogBox();
        }
    );
  }


  addressDialogBox(BuildContext context){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return AddressDialogBox();
        }
    );
  }
  securityDialogBox(BuildContext context){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return SecurityDialogBox();
        }
    );
  }

  bankDialogBox(BuildContext context){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return BankDialogBox();
        }
    );
  }

  nextKinDialogBox(BuildContext context){
    return   showDialog(context: context,
        builder: (BuildContext context){
          return NextKinDialogBox();
        }
    );
  }

//


  homeProductItem(ProductRespData dat,BuildContext context){
    return InkWell(
        onTap: (){ Navigator.of(context).pushNamed(PageRouteConstants.itemDashBoardDetailsScreen,arguments: dat);},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(
                height: 150,
                width: 150,
                child:     CachedNetworkImage(
                  imageUrl: '${dat.featured_image.file_url}',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter:
                          ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) =>Center(child:  CircularProgressIndicator(),),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),



              SizedBox(height: 3,),
              Text("NGN${dat.price}",style: TextStyle(color: Color(0xff434343),fontFamily: "PoppinsBold",fontSize: 18),),

              SizedBox(height: 5,),

              Text(dat.name,style: TextStyle(color: Color(0xff656565),fontFamily: "PoppinsRegular",fontSize: 14),)
            ],
          ),)
    );
  }

}//










