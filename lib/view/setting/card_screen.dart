

import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:agro_ecomance/view/cart/payout_screen.dart';
import 'package:agro_ecomance/view/sidebar/Network.dart';
import 'package:agro_ecomance/view/sidebar/commision.dart';
import 'package:agro_ecomance/view/sidebar/dashboard.dart';
import 'package:agro_ecomance/view/sidebar/ewallet.dart';
import 'package:agro_ecomance/view/sidebar/logout.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:agro_ecomance/view/sidebar/shoping.dart';
import 'package:agro_ecomance/view/sidebar/wishList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';



class CardSettingScreen extends StatefulWidget {



  @override
  _CardSettingScreen createState() => _CardSettingScreen();
}

class _CardSettingScreen extends State<CardSettingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  String reference_id;
  String Sub_id;
  String email;
  String amount = "5000";

  PaymentType chosenPayCode =   PaymentType.CARD;



  UserProfileData userProfileData;

  @override
  void initState() {



    StorageUtil.getProfileUser().then((value) =>
    {
      if (value != null ){


        setState(() {
          userProfileData = value;
          this.email = value.email;

        })
      }

  }

    );

    PaystackPlugin.initialize(
        publicKey: UrlConstant.PAYSTACK_PUBLIC_KEY);



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
        ],
      ),

        body: Container(
          // height: MediaQuery.of(context).size.height * 0.8,
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child:Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back,   color: Color(0XFFABA3A3),),
                          onPressed: () {

                            Navigator.of(context).pop();
                          },
                        ),
                        Spacer(),
                        Text(
                          "CARD INFORMATION",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0XFFABA3A3),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        )
                      ],
                    ),



                    SizedBox(height: 30,),


                    Text(
                      "Agrocard Details",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0XFF3BBD17),
                          fontFamily: 'PoppinsBold'
                      ),
                    ),

                    SizedBox(height: 26,),

                    InkWell(
                      onTap: (){},
                      child:  Container(
                        child:  Image.asset('assets/images/card_.png', fit:BoxFit.cover ,),
                      ),
                    ),

                    SizedBox(height: 30,),

                    Container(
                      child: Column(
                        children: [

                          Text(
                            "Card Processing Fee",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0XFF707070),

                            ),
                          ),

                          Text(
                            "NGN2,000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFF3BBD17),

                            ),
                          ),

                          SizedBox(height: 30,),
                        ],
                      ),
                    ),


                    Text(
                      "Naira Debit Card Details",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFF3BBD17),
                          fontFamily: 'PoppinsBold'
                      ),
                    ),
                    SizedBox(height: 26,),



                    GestureDetector(
                      onTap: (){

                      },
                      child:     Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            color: Color(0XFF3BBD17),
                            size: 75,
                          ),
                          SizedBox(width: 16,),
                          Text(
                            "Add New Card ",
                            style: TextStyle(
                              fontSize: 16,


                            ),
                          ),


                        ],
                      ),
                    ),



                  ],
                ),

                Align(

                  alignment: Alignment.bottomCenter,
                    child:   Container(
                      margin: EdgeInsets.symmetric(vertical: 40,horizontal:10 ),
                      child: RaisedGradientButton(
                          child: Text(
                            'Make Payment',
                            style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                          ),
                          onPressed: (){

                            // if (_token.data?.access_token != null){
                            //   chargeCard(int.parse(this.amount));
                            // }
                          }
                      ),
                    )
                )
              ],
            )
          // ],
          // ),
        ),

        drawer: Container(



            width: MediaQuery.of(context).size.width * 0.9,
            child: Drawer(
              child:Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF3ABC16), Color(0xFF66EA96)],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight),
                ),


                child: Column(
                  children: [

                    Container(
                      color: Colors.white,
                      height: 170,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [


                          Container(
                              width: 95,
                              height: 95,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child:   CircleAvatar(
                                  backgroundColor: ReUseAble().getButtonColor(),
                                  radius: 20,
                                  child:userProfileData?.avatar_url != null ?

                                  CircleAvatar(
                                    radius: 95.0,
                                    backgroundImage: NetworkImage("${userProfileData?.avatar_url}"),
                                    backgroundColor: Colors.transparent,
                                  ): Icon(Icons.person,color: Colors.white, size: 60))
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Text('${userProfileData?.display_name }',style: TextStyle(fontSize: 20,color: Color(0xff003C5E),fontFamily: 'PoppinsBold'),      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                  )
                              ),

                              Text("REF ID: ${userProfileData?.referral_code }",style: TextStyle(fontSize: 16,color: Color(0xff003C5E)),),


                            ],

                          )


                        ],
                      ),
                    ),



                    Expanded(

                        flex: 1,
                        child: ListView(

                          children: [

                            GestureDetector(
                              onTap: (){ Navigator.of(context).push(
                                  ReUseAble().getTransition(HomePageDashboard(userProfileData:userProfileData))
                              );},
                              child:
                              ReUseAble().drawerItem( title: "Dashboard",icon: Icons.dashboard),
                            ),


                            GestureDetector(
                              onTap: (){ Navigator.of(context).push(
                                  ReUseAble().getTransition(Commission(userProfileData:userProfileData))
                              );},
                              child:
                              ReUseAble().drawerItem(title: "Commissions",icon: Icons.alternate_email_sharp,),
                            ),


                            GestureDetector(
                              onTap: (){ Navigator.of(context).push(
                                  ReUseAble().getTransition(Purchase(userProfileData:userProfileData))
                              );},
                              child:
                              ReUseAble().drawerItem( title: "Purchases",icon: Icons.shopping_basket, ),
                            ),



                            GestureDetector(
                              onTap: (){ Navigator.of(context).push(
                                  ReUseAble().getTransition(NetworkScreen(userProfileData:userProfileData))
                              );},
                              child:
                              ReUseAble().drawerItem( title: "Network",icon: Icons.share, ),
                            ),


                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    ReUseAble().getTransition(EWallet(userProfileData:userProfileData))
                                );
                              },
                              child:
                              ReUseAble().drawerItem(title: "E-wallet",icon: Icons.account_balance_wallet_rounded, ),
                            ),






                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    ReUseAble().getTransition(SettingScreen(userProfileData:userProfileData))
                                );
                              },
                              child:
                              ReUseAble().drawerItem(isActive: true , title: "Profile",icon: Icons.person, ),
                            ),



                            GestureDetector(
                              onTap: (){


                                Navigator.of(context).push(
                                    ReUseAble().getTransition(WishListScreen(userProfileData:userProfileData ))
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
                              ReUseAble().drawerItem( title: "Continue Shopping",icon: Icons.arrow_back, ),
                            ),





                          ],
                        )

                    )




                  ],
                ),
              ),
            ))
      );


  }

}
