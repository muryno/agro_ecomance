





import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:agro_ecomance/view/sidebar/Network.dart';
import 'package:agro_ecomance/view/sidebar/commision.dart';
import 'package:agro_ecomance/view/sidebar/dashboard.dart';
import 'package:agro_ecomance/view/sidebar/ewallet.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';






class DashBoardScreen extends StatefulWidget{


  @override
  _DashBoardScreen createState()  =>  _DashBoardScreen();

}


class _DashBoardScreen extends State<DashBoardScreen>{


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserProfileData userProfileData;

  @override
  void initState() {
    StorageUtil.getProfileUser().then(
            (value) => userProfileData
    );
    super.initState();
  }



  @override
  Widget build(BuildContext context) {





    return Scaffold(
      key: _scaffoldKey,

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white54,
          padding: EdgeInsets.only(top:60,right: 16,left: 16 ),


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if(userProfileData?.email!= null) {
                        _scaffoldKey.currentState.openDrawer();
                      }else{
                        Navigator.of(context).pushNamed(PageRouteConstants.view_page);
                      }
                    },
                  ),


                  Spacer(),
                  Icon(Icons.notifications_none_sharp,color: Colors.black,),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(PageRouteConstants.cartScreen);
                    },
                    child:        Icon(Icons.shopping_basket,color: Colors.black,),
                  )
                ],
              ),
              SizedBox(height: 15,),

              Card(
                elevation: 3,
                child:  TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      filled: true,

                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search)),
                ),
              ),

              SizedBox(height: 30,),

              CarouselSlider(
                  items: [
                    "assets/images/banner.png",
                    "assets/images/banana.png",
                    "assets/images/img6.png",
                    "assets/images/img5.png",
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
//Image.asset("assets/images/slide_one.jpeg")
                            child: Image.asset(i, fit:BoxFit.cover ,)
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,


                    scrollDirection: Axis.horizontal,
                  )
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("Featured",style: TextStyle(color: Colors.black,fontFamily: "PoppinsMedium",fontSize: 22),),

                  Spacer(),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(PageRouteConstants.dashBoardDetailsScreen);
                    },
                    child:    Text("See all",style: TextStyle(color: Color(0xff656565),fontFamily: "PoppinsRegular",fontSize: 14),),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(

                height: 250,

                child:  ListView(

                  scrollDirection: Axis.horizontal,
                  children: [

                    ...List.generate(10, (index) =>      InkWell(
                        onTap: (){},
                        child: InkWell(
                          onTap: (){ Navigator.of(context).pushNamed(PageRouteConstants.itemDashBoardDetailsScreen);},
                          child:   ReUseAble().homeProductItem(img: "img6.png"),
                        )                    )


                    ),

                  ],
                ),

                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
              ),




              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Best Sell",style: TextStyle(color: Colors.black,fontFamily: "PoppinsMedium",fontSize: 22),),

                  Spacer(),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(PageRouteConstants.dashBoardDetailsScreen);
                    },
                    child:    Text("See all",style: TextStyle(color: Color(0xff656565),fontFamily: "PoppinsRegular",fontSize: 14),),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(

                height: 240,

                child:  ListView(

                  scrollDirection: Axis.horizontal,
                  children: [

                    ...List.generate(10, (index) =>      InkWell(
                        onTap: (){},
                        child: InkWell(
                          onTap: (){ Navigator.of(context).pushNamed(PageRouteConstants.itemDashBoardDetailsScreen);},
                          child:   ReUseAble().homeProductItem(img: "img3.png"),
                        )
                    )
//

                    ),

                  ],
                ),

                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
              )


            ],
          )
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
                        ReUseAble().drawerItem( title: "Dashboard",icon: Icons.dashboard),
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
                        ReUseAble().drawerItem(isActive: true,title: "Continue Shopping",icon: Icons.arrow_back, ),
                      ),





                    ],
                  ),
                ),
              ),
            ))
    );

  }




}


