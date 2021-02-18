
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'shoping.dart';
import 'commision.dart';
import 'dashboard.dart';
import 'ewallet.dart';


class NetworkScreen extends StatefulWidget {

  @override
  _NetworkScreen createState() => _NetworkScreen();
}

class _NetworkScreen extends State<NetworkScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  String _name = "";

  String _usr = "";


  var _stock = ["All(34)","Few"];

  String avr ;

  @override
  void initState() {



    super.initState();


  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          backgroundColor: Colors.white,
          actions: [


            Padding(
              padding: const EdgeInsets.only(right: 4.0, left: 16.0),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                onPressed: () {

                  },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 14.0),
              child:InkWell(
                onTap: (){

                  },
                child:     Container(
                    width: 40,
                    height: 40,
                    child:  this?.avr!= null ?
                    Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "${this?.avr}")
                            )
                        )): CircleAvatar(
                        backgroundColor: ReUseAble().getButtonColor(),
                        radius: 20,child: Icon(Icons.person,color: Colors.white, size: 30))
                ),
              ) ,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Network',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFFABA3A3),
                    fontFamily:'PoppinsBold' ),
              ),



              SizedBox(
                height: 16.0,
              ),

//


              ...List.generate(5, (index) =>
                GestureDetector(
                  onTap: (){ReUseAble().curvesProfileDialog(context);},
                  child:   Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),

                    child: Container(

                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      child: Row(
                        children: [


                          Container(
                            child: CircleAvatar(
                                backgroundColor: ReUseAble().getButtonColor(),
                                radius: 20,child: Icon(Icons.person,color: Colors.white, size: 30)),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sarak Stark",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0XFF707070),
                                    fontFamily:'PoppinsBold' ),),

                              Text("REFR : ER45",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Color(0XFF3ABC16),
                                    fontFamily:'PoppinsBold' ),),
                              Text("08011223443",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0XFF707070),
                                    fontFamily:'PoppinsBold' ),),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
        drawer: Container(



            width: MediaQuery.of(context).size.width * 0.7,
            child: Drawer(
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF3ABC16), Color(0xFF66EA96)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),


                  child: Column(
                    children: [

                      Container(
                        color: Colors.white,
                        height: 170,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [

                            Hero(
                                tag:UrlConstant.Hero,
                                child:  Container(
                                    width: 80,
                                    height: 80,
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child:   CircleAvatar(
                                        backgroundColor: ReUseAble().getButtonColor(),
                                        radius: 20,child: Icon(Icons.person,color: Colors.white, size: 60))
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("John Doe",style: TextStyle(fontSize: 20,color: Color(0xff003C5E),fontFamily: 'PoppinsBold'),),
                                Text("REF ID: 3Y92Q1",style: TextStyle(fontSize: 16,color: Color(0xff003C5E)),)

                              ],

                            )



                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(HomePageDashboard())
                        );},
                        child:
                        ReUseAble().drawerItem(title: "Dashboard",icon: Icons.dashboard),
                      ),

                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(Commission())
                        );},
                        child:
                        ReUseAble().drawerItem(title: "Commissions",icon: Icons.alternate_email_sharp,),
                      ),


                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(Purchase())
                        );},
                        child:
                        ReUseAble().drawerItem( title: "Purchases",icon: Icons.shopping_basket, ),
                      ),



                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(NetworkScreen())
                        );},
                        child:
                        ReUseAble().drawerItem(isActive: true, title: "Network",icon: Icons.share, ),
                      ),


                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(EWallet())
                          );
                        },
                        child:
                        ReUseAble().drawerItem(title: "E-wallet",icon: Icons.account_balance_wallet_rounded, ),
                      ),






                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(SettingScreen())
                          );
                        },
                        child:
                        ReUseAble().drawerItem(title: "Profile",icon: Icons.person, ),
                      ),



                      GestureDetector(
                        onTap: (){

                        },
                        child:
                        ReUseAble().drawerItem(title: "Wish / Bookings",icon: Icons.card_travel_sharp, ),
                      ),




                      GestureDetector(
                        onTap: (){

                        },
                        child:
                        ReUseAble().drawerItem(title: "Logout",icon: Icons.exit_to_app_sharp, ),
                      ),


                      Spacer(),


                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(DashBoardScreen())
                          );
                        },
                        child:
                        ReUseAble().drawerItem(title: "Continue Shopping",icon: Icons.arrow_back, ),
                      ),





                    ],
                  ),
                ),
              ),
            ))

    );
  }



}
