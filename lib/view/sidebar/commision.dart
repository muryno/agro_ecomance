
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/sidebar/shoping.dart';
import 'package:agro_ecomance/view/sidebar/ewallet.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:agro_ecomance/view/sidebar/wishList.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Network.dart';
import 'dashboard.dart';
import 'logout.dart';


class Commission extends StatefulWidget {
  UserProfileData userProfileData;

  Commission({@required  this.userProfileData});

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
          leading: InkWell(

              onTap: (){
                _scaffoldKey.currentState.openDrawer();
              },

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child:    Image.asset(
                  'assets/images/menu.png',
                  width: 24,height: 24,color: Colors.black,
                ),
              )

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

            InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      ReUseAble().getTransition(SettingScreen(userProfileData:widget?.userProfileData))
                  );

                },
                child:    Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 14.0),
                  child:   Container(
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
                )
            )


          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(24.0),
          child: Stack(
            children: [
              Column(
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


              Align(
                alignment: Alignment.bottomCenter,
                  child:    Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: RaisedGradientButton(
                        child: Text(
                          'Withdraw Commission',
                          style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                        ),
                        onPressed: (){
                          Navigator.of(context).pushNamed(PageRouteConstants.withdrawScreen);

                        }
                    ),
                  ),
              )
            ],
          )
        ),
        drawer: Container(



            width: MediaQuery.of(context).size.width * 0.7,
            child: Drawer(
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

                              Text("${widget?.userProfileData?.username}",style: TextStyle(fontSize: 20,color: Color(0xff003C5E),fontFamily: 'PoppinsBold'),),
                              Text("REF ID: 3Y92Q1",style: TextStyle(fontSize: 16,color: Color(0xff003C5E)),)

                            ],

                          )



                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){ Navigator.of(context).push(
                          ReUseAble().getTransition(HomePageDashboard(userProfileData:widget.userProfileData))
                      );},
                      child:
                      ReUseAble().drawerItem(title: "Dashboard",icon: Icons.dashboard),
                    ),

                    GestureDetector(
                      onTap: (){ Navigator.of(context).push(
                          ReUseAble().getTransition(Commission(userProfileData:widget.userProfileData))
                      );},
                      child:
                      ReUseAble().drawerItem(isActive:true,title: "Commissions",icon: Icons.alternate_email_sharp,),
                    ),


                    GestureDetector(
                      onTap: (){ Navigator.of(context).push(
                          ReUseAble().getTransition(Purchase(userProfileData:widget.userProfileData))
                      );},
                      child:
                      ReUseAble().drawerItem( title: "Purchases",icon: Icons.shopping_basket, ),
                    ),



                    GestureDetector(
                      onTap: (){ Navigator.of(context).push(
                          ReUseAble().getTransition(NetworkScreen(userProfileData:widget.userProfileData))
                      );},
                      child:
                      ReUseAble().drawerItem( title: "Network",icon: Icons.share, ),
                    ),


                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            ReUseAble().getTransition(EWallet(userProfileData:widget.userProfileData))
                        );
                      },
                      child:
                      ReUseAble().drawerItem(title: "E-wallet",icon: Icons.account_balance_wallet_rounded, ),
                    ),






                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            ReUseAble().getTransition(SettingScreen(userProfileData:widget.userProfileData))
                        );
                      },
                      child:
                      ReUseAble().drawerItem(title: "Profile",icon: Icons.person, ),
                    ),



                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            ReUseAble().getTransition(WishListScreen())
                        );
                      },
                      child:
                      ReUseAble().drawerItem(title: "Wish / Bookings",icon: Icons.card_travel_sharp, ),
                    ),




                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                            ReUseAble().getTransition(LogoOut())
                        );
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
            ))

    );
  }



}
