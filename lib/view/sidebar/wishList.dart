
import 'package:agro_ecomance/entity/responds/DashboardResp.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/WishBaskResp.dart';
import 'package:agro_ecomance/rxbloc_pattern/dashboard_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/wish_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:agro_ecomance/view/sidebar/dashboard.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:agro_ecomance/view/wish_list/wish_list_details_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'logout.dart';
import 'shoping.dart';
import 'Network.dart';
import 'commision.dart';
import 'ewallet.dart';


class WishListScreen extends StatefulWidget {

 final UserProfileData userProfileData;
 final ProductRespData productRespData;


 WishListScreen({  this.userProfileData,this.productRespData});
  @override
  _WishListScreen createState() => _WishListScreen();
}

class _WishListScreen extends State<WishListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  String _usr = "";



  String avr ;

  UserProfileData userProfileData;

  @override
  void initState() {
    StorageUtil.getProfileUser().then(

            (value )=>
        {
          if(value != null )
            {
              setState((){
                userProfileData = value;
              }),



            }
        }
    );

    wishBloc.fetchWishBasket();
    super.initState();
  }

  @override
  void dispose() {
    wishBloc.dispose();
    super.dispose();
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [


              Row(
                children: [
                  Text(
                    "Wish Basket",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0XFF3ABC16),
                        fontFamily:'PoppinsRegular' ),
                  ),

                  Spacer(),

                  ButtonTheme(
                    // minWidth: 120,
                    child: RaisedButton(
                      elevation: 0.0,
                      textColor: Colors.white,
                      color: Color(0XFF3ABC16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New "),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(Icons.add_circle_outline)
                        ],
                      ),
                      onPressed: () {


                        ReUseAble().addWishListDialogBox(context);
                      },
                    ),
                  ),

                ],
              ),


               SizedBox(
                height: 24.0,
              ),



              StreamBuilder(
                stream: wishBloc.fetchbasket,
                builder: (context, AsyncSnapshot< List<WishBaskData> >  snapshot){
                  if(snapshot.hasData ){

                    return   Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              return itemWishies( wishBaskData : snapshot.data[index],respData: widget?.productRespData );
                            })
                    );


                  }else if(snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  return Center(child: CircularProgressIndicator(),);
                },
              ),




              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              //   child: RaisedGradientButton(
              //       child: Text(
              //         'Add All Wishes',
              //         style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
              //       ),
              //       gradient: LinearGradient(
              //         colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
              //       ),
              //       onPressed: (){
              //
              //
              //       }
              //   ),
              // ),

            ],
          ),
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

                              Text("${userProfileData?.username}",style: TextStyle(fontSize: 20,color: Color(0xff003C5E),fontFamily: 'PoppinsBold'),),
                              Text("REF ID: 3Y92Q1",style: TextStyle(fontSize: 16,color: Color(0xff003C5E)),)

                            ],

                          )



                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){ Navigator.of(context).push(
                          ReUseAble().getTransition(HomePageDashboard(userProfileData:userProfileData))
                      );},
                      child:
                      ReUseAble().drawerItem(title: "Dashboard",icon: Icons.dashboard),
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
                      ReUseAble().drawerItem(title: "Profile",icon: Icons.person, ),
                    ),



                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child:
                      ReUseAble().drawerItem(isActive: true, title: "Wish / Bookings",icon: Icons.card_travel_sharp, ),
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


  itemWishies({WishBaskData wishBaskData,ProductRespData respData}){
    return   GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            ReUseAble().getTransition(WishListItemDetailsScreen(wishBaskData: wishBaskData))
        );
      },
      child:    Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),

        child: Row(
          children: [

            Image.asset(

              'assets/images/wish.png',
              width:  90,
              height: 90,

            ),
            Spacer(),

            Text("${wishBaskData.title}"),

            Spacer(),



            Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(9),
                  child:   Icon(Icons.clear, color: Colors.black, size: 24,),
                ),


                respData!=null?   Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child:     ButtonTheme(
                    minWidth: 30,
                    child: RaisedButton(
                      elevation: 0.0,
                      textColor: Colors.white,
                      color: Color(0XFF3ABC16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child:  Text("Add",style: TextStyle( color: Colors.white,)),
                      onPressed: () {
                        wishBloc.addWishToBasket(wishBaskData.uuid,1, double.parse(respData.weight).toInt(),respData.id, context);
                      },
                    ),
                  ),
                )
                :Container(),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),

            SizedBox(
              height: 10.0,
            ),

          ],
        ),

      ),
    );
  }






}
