
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/sidebar/shoping.dart';
import 'package:agro_ecomance/view/sidebar/ewallet.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Network.dart';
import 'dashboard.dart';


class Commission extends StatefulWidget {

  @override
  _Commission createState() => _Commission();
}

class _Commission extends State<Commission> {
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
                child:        Hero(
    tag:UrlConstant.Hero,
    child:


    Container(
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
                )
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
                'COMMISSION ',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFFABA3A3),
                    fontFamily:'PoppinsRegular' ),
              ),

              SizedBox(
                height: 16.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child:  Text(
                      'FIlter by:  ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0XFF3ABC16),
                          fontFamily:'PoppinsRegular' ),
                    ),
                  ),



                  Expanded(
                    child:   DropdownButtonFormField(

                      isDense: true,
                      hint: new Text('All ',
                          textAlign: TextAlign.center),
                      items:_stock.map((value) {
                        return DropdownMenuItem<String>(

                          value: value.toString(),
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {

                      },

                      decoration: InputDecoration(

                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0XFFD8D8D8).withOpacity(0.2),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: 16.0,
              ),



              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                child:  Text("Commission History",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
              ),
              SizedBox(height: 15,),

              ...List.generate(5, (index) =>

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                    child: Row(
                      children: [


                        Text("Bunch of Plantain",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 16 ),),
                        Spacer(),
                        Text("N50",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 16 ),)


                      ],
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
                        ReUseAble().drawerItem(isActive:true,title: "Commissions",icon: Icons.alternate_email_sharp,),
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
                        ReUseAble().drawerItem( title: "Network",icon: Icons.share, ),
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
