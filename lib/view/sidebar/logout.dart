import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/share_pref.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LogoOut extends StatefulWidget {



  @override
  _Screen12State createState() => _Screen12State();
}

class _Screen12State extends State<LogoOut> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  login_request _str;

  @override
  Widget build(BuildContext context) {


    StorageUtil.getUserDataBiometric().then((value) {
      if (value != null){

        setState(() {
          _str = value;

        });


      }

    });


    return Scaffold(


        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Are you sure you want to log out?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              SizedBox(
                height: 40,
              ),

              Text(" We can't notify you of new request if you are logged out. ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),

              SizedBox(
                height: 40,
              ),


              ButtonTheme(
                height: 50,

                child: FlatButton(
                    child: Text("Exit app",style: TextStyle(color: Colors.white),),
                    onPressed: () {

                      StorageUtil.clearUser();
                      StorageUtil.clearUsers(_str);

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          PageRouteConstants.dashBoardScreen,(r)=>false);
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color:  Colors.red ,
                            width: 1,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(5.0)),
                    color:  Colors.red ,
                    textColor: Colors.white
                ),
              ) ,

              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                height: 50,

                child: FlatButton(
                    child: Text("Go back ",style: TextStyle(color: Colors.black),),
                    onPressed: () {

                      Navigator.of(context).pop();

                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color:  Colors.black,
                            width: 1,
                            style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(5.0)),
                    color:  Colors.white ,
                    textColor: Colors.white
                ),
              ) ,

            ],
          ),
        ),

    );

  }


}
