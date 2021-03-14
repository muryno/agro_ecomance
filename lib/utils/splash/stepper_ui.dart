import 'package:agro_ecomance/entity/request/openBefore.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:flutter/material.dart';

import '../share_pref.dart';




class StepperSlide extends StatelessWidget {
  String imagePath, title, desc;
  PageController controller;
  int slideIndex;

  StepperSlide({this.imagePath, this.title, this.desc, this.controller,this.slideIndex});

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 10,
      width: 10,
      child: CircleAvatar(
        backgroundColor:isCurrentPage ? Color(0xff3CBE1B) : Colors.grey.withOpacity(0.2) ,
      ),


    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/11),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[



            //


            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20,),
              child: Text(title , style: TextStyle(fontFamily: 'PoppinsBold',fontSize: 26,color: Color(0xff707070)),textAlign: TextAlign.left,),
            ),
            SizedBox(height: 3,),
            Text(desc , style: TextStyle(fontFamily: 'GothamLight',fontSize: 22,color: Colors.white)),



            Container(
              padding: EdgeInsets.only(left: 20,top: 30),
              child:    Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,

                children: [
                  for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                ],
              ),
            ),


            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,top: 30),
                  width: 150,
                  child:      FlatButton(
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color:  Color(0xff3CBE1B) )),
                    color: Colors.white,
                    textColor:  Color(0xff3CBE1B) ,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      StorageUtil.saveopenedApp(openBefore(openned: true));

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          PageRouteConstants.dashBoardScreen, (r) => false
                      );
                    },
                    child: Text(
                      "SKIP".toUpperCase(),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),








            Spacer(),





            Container(
                width:   double.infinity,

                height: MediaQuery.of(context).size.height/2-20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                )
            ),

          ],
        ),
      ),
    );


  }
}