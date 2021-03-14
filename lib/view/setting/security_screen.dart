import 'dart:convert';


import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/bankDetailResponds.dart';
import 'package:agro_ecomance/entity/responds/bankVerification.dart';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
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
import 'package:dio/dio.dart';


class SecurityScreen extends StatefulWidget {



  @override
  _SecurityScreen createState() => _SecurityScreen();
}

class _SecurityScreen extends State<SecurityScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var currentPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmnewPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  UserProfileData userProfileData;

  @override
  void initState() {



    StorageUtil.getProfileUser().then((value) =>
    {
      if (value != null ){


        setState(() {
          userProfileData = value;


        })
      }

    }

    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget current_password = Container(
        child: TextFormField(
          controller: currentPassword,
          decoration: ReUseAble().inputWithoutIcon(hint: 'current password',label: 'current password'),
          keyboardType: TextInputType.visiblePassword,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your current password ';
            }
            return null;
          },
        )
    );


    Widget _new_password = Container(
        child: TextFormField(
          controller: newPassword,
          decoration: ReUseAble().inputWithoutIcon(hint: 'New password',label: 'New password'),
          keyboardType: TextInputType.visiblePassword,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your New password ';
            }
            return null;
          },
        )
    );

    Widget _confirm_password = Container(
        child: TextFormField(
          controller: confirmnewPassword,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Confirm password',label: 'Confirm password'),
          keyboardType: TextInputType.visiblePassword,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Confirm password';
            }
            return null;
          },
        )
    );




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

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child:  Container(
            // height: MediaQuery.of(context).size.height * 0.8,
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
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
                          "CHANGE PASSWORD",
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

                    SizedBox(height: 15,),
                    current_password,
                    SizedBox(height: 15,),
                    _new_password,
                    SizedBox(height: 15,),
                    _confirm_password,


                    SizedBox(height: 35,),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: RaisedGradientButton(
                          child: Text(
                            'Save change',
                            style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                          ),
                          onPressed: (){
                            if (formKey.currentState.validate()) {


                              settingsBloc.changePassword( this.currentPassword.text, this.newPassword.text,this.confirmnewPassword.text, context);

                            }

                          }
                      ),
                    ),







                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              )
            // ],
            // ),
          )
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
