// import 'dart:ui';
import 'package:agro_ecomance/entity/responds/NetworkResp.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/page_route_constants.dart';

class ProfileDialogBox extends StatefulWidget {


  final  BuildContext context;
  final NetworkData networkData;
  final Meta meta;

  const ProfileDialogBox(
      {Key key,  this.context,this.networkData,this.meta})
      : super(key: key);

  @override
  _ProfileDialogBox createState() => _ProfileDialogBox();
}

class _ProfileDialogBox extends State<ProfileDialogBox> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[


            Container(
              width: 120,
              height: 120,
              child: CircleAvatar(
                  backgroundColor: ReUseAble().getButtonColor(),
                  radius: 20,child: widget.networkData.avatar_url!= null ? Image.network(widget.networkData.avatar_url): Icon(Icons.person,color: Colors.white, size: 90)),
            ),

            SizedBox(height: 15,),
            Text(
              '${widget.networkData.display_name}',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0XFF707070),
                  fontFamily:'PoppinsBold' ),
            ),

            SizedBox(height: 5,),
            Text(
                '${widget.networkData.referral_code}',
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0XFF3ABC16),
                  fontFamily:'PoppinsBold' ),
            ),

            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  color: Colors.green,
                  child: Text("L.V.S",style: TextStyle(color: Colors.white),),
                ),
                SizedBox(width: 10,),

                Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  color: Colors.green,
                  child: Text('${widget.meta.level}',style: TextStyle(color: Colors.white),),
                ),


              ],
            ),
            SizedBox(height: 15,),

            Container(
              height: 45,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width-120,

              child: Text("${widget.networkData.phone}"),

              decoration:  BoxDecoration(
                  color: Color(0xffDEDFE2),
                  borderRadius:  BorderRadius.only(
                      bottomLeft:    Radius.circular(20.0),
                      bottomRight:   Radius.circular(20.0))
              ),
            )
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
