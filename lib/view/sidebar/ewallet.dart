
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'shoping.dart';
import 'Network.dart';
import 'commision.dart';
import 'dashboard.dart';


class EWallet extends StatefulWidget {

  @override
  _EWallet createState() => _EWallet();
}

class _EWallet extends State<EWallet> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  String _name = "";

  String _usr = "";



  String avr ;

  @override
  void initState() {



    super.initState();


  }

  Widget amount = Container(
      child: TextFormField(

        decoration: ReUseAble().inputWithoutIcon(hint: 'Amount',label: 'Amount'),
        keyboardType: TextInputType.text,
        validator: (value){
          if(value.isEmpty   ){
            return 'Enter Amount';
          }
          return null;
        },
      )
  );



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

              const SizedBox(
                height: 8.0,
              ),
              Text(
                "E-wallet",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFF707070),
                    fontFamily:'PoppinsBook' ),
              ),
               SizedBox(
                height: 24.0,
              ),


              Row(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width/2 -30,

                    child:    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Text("Approved Commission",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                          SizedBox(height: 15,),
                          Text("N1,200,111.08",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsBold',fontSize: 16 ),)

                        ],
                      ) ,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width/2 -30,

                    child:    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Text("Pending Commission",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                          SizedBox(height: 15,),
                          Text("N84,715.40",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsBold',fontSize: 16 ),)

                        ],
                      ) ,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24.0,
              ),

              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                         SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Top-up Wallet",
                          style: TextStyle(
                             fontSize: 12,
                            color: Color(0xff0B2E70),
                            fontFamily:'PoppinsBold'
                          ),
                        ),


                        SizedBox(
                          height: 10.0,
                        ),

                        amount,

                        SizedBox(
                          height: 10.0,
                        ),


                        Container(
                          width: 120,
                          child:       ButtonTheme(

                            minWidth: 120,
                            height: 35,
                            child: RaisedButton(
                              elevation: 0.0,
                              textColor: Colors.white,
                              color: Color(0XFF3ABC16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text("TOP-UP"),
                              onPressed: () {


                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 18.0,
                        ),


                      ],
                    ),
                  )),

              SizedBox(
                height: 24.0,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Wallet distributor",
                          style: TextStyle(
                            // fontSize: 18,
                            color: Color(0XFF707070),
                          ),
                        ),

                        AspectRatio(
                          aspectRatio: 1.90,
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                              child: LineChart(
                                mainData(),
                              ),
                            ),
                          ),
                        ),





                      ],
                    ),
                  )),

              SizedBox(height: 35,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: RaisedGradientButton(
                    child: Text(
                      'Make a Withdraw',
                      style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                    ),
                    onPressed: (){

                    }
                ),
              ),
              SizedBox(height: 35,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                    child:  Text("New Downlines",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                  ),
                  SizedBox(height: 15,),

                  ...List.generate(5, (index) =>

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                        child:   Text("Wallet Deposit",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 16 ),),

                      )
                  )

                ],
              ) ,
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
                        ReUseAble().drawerItem( title: "Network",icon: Icons.share, ),
                      ),


                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(EWallet())
                          );
                        },
                        child:
                        ReUseAble().drawerItem(isActive: true, title: "E-wallet",icon: Icons.account_balance_wallet_rounded, ),
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



  List<Color> gradientColors = [
     Color(0xff707070),
    Colors.black45,
  ];


  LineChartData mainData() {
    return LineChartData(



      backgroundColor: Colors.transparent,
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(

        show: true,
        drawVerticalLine: false,


        drawHorizontalLine:true,
      ),
      titlesData: FlTitlesData(
        show: true,


        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),



      lineBarsData: [
        LineChartBarData(
          belowBarData:BarAreaData(
              show: false
          ),
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(

            show: false,
          ),

        ),
      ],
    );
  }








}