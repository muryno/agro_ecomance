
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/purchased/PurchaseResp.dart';
import 'package:agro_ecomance/rxbloc_pattern/purchase_bloc.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/custom_dialog.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/sidebar/setting.dart';
import 'package:agro_ecomance/view/sidebar/wishList.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'logout.dart';
import 'shoping.dart';
import 'Network.dart';
import 'commision.dart';
import 'dashboard.dart';
import 'ewallet.dart';


class Purchase extends StatefulWidget {

  UserProfileData userProfileData;

  Purchase({@required  this.userProfileData});



  @override
  _Purchase createState() => _Purchase();
}

class _Purchase extends State<Purchase> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  String _name = "";

  String _usr = "";


  var _stock = ["All(34)","Few"];

  String avr ;

  @override
  void initState() {
    purchaseBloc.getPurchase();
    super.initState();


  }

  @override
  void dispose() {

    purchaseBloc.dispose();

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
                  child:       Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child:   CircleAvatar(
                          backgroundColor: ReUseAble().getButtonColor(),
                          radius: 20,
                          child:widget.userProfileData?.avatar_url != null ?

                          CircleAvatar(
                            radius: 95.0,
                            backgroundImage: NetworkImage("${widget.userProfileData?.avatar_url}"),
                            backgroundColor: Colors.transparent,
                          ): Icon(Icons.person,color: Colors.white, size: 25))
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
              Text(
                'Purchase',
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
                child:  Text("Purchase History ",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
              ),
              SizedBox(height: 15,),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order ID  ",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsRegular',fontSize: 16 ),),
                  Text("Date",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsRegular',fontSize: 16 ),),
                  Text("Amount (₦)  ",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsRegular',fontSize: 16 ),),


                ],
              ),

              SizedBox(height: 15,),

              StreamBuilder(
                stream: purchaseBloc.fetchPurchaseRespData,
                builder: (context, AsyncSnapshot< List<PurchaseRespData> >  snapshot){
                  if(snapshot.hasData ){

                    if(snapshot.data.length > 0) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment
                              .center,
                          children: [

                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(

                                    onTap: (){

                                      ReUseAble().purchaseDialogBox(context,  snapshot.data[index]);
                                    },
                                    child:   Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                                      child:          Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${snapshot.data[index].id} ",style: TextStyle(color: Color(0xff808080),fontFamily:'PoppinsRegular',fontSize: 16 ),),
                                          Text("${snapshot.data[index].created_at.split(" ")[0]}",style: TextStyle(color: Color(0xff808080),fontFamily:'PoppinsRegular',fontSize: 16 ),),
                                          Text("${snapshot.data[index].total_price}",style: TextStyle(color: Color(0xff808080),fontFamily:'PoppinsRegular',fontSize: 16 ),),


                                        ],
                                      ),
                                    ),
                                  );
                                })

                          ]);
                    }else{
                      return Center(child: Text("No Request Order available"),);
                    }



                  }else if(snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                },
              ),




            ],
          ),
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
                                  child:widget.userProfileData?.avatar_url != null ?

                                  CircleAvatar(
                                    radius: 95.0,
                                    backgroundImage: NetworkImage("${widget.userProfileData?.avatar_url}"),
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
                                    child: Text('${widget.userProfileData?.display_name }',style: TextStyle(fontSize: 20,color: Color(0xff003C5E),fontFamily: 'PoppinsBold'),      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,),
                                  )
                              ),

                              Text("REF ID: ${widget.userProfileData?.referral_code }",style: TextStyle(fontSize: 16,color: Color(0xff003C5E)),),


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
                      ReUseAble().drawerItem(title: "Commissions",icon: Icons.alternate_email_sharp,),
                    ),


                    GestureDetector(
                      onTap: (){ Navigator.of(context).push(
                          ReUseAble().getTransition(Purchase(userProfileData:widget.userProfileData))
                      );},
                      child:
                      ReUseAble().drawerItem(isActive: true, title: "Purchases",icon: Icons.shopping_basket, ),
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
                            ReUseAble().getTransition(WishListScreen(userProfileData:widget.userProfileData ))
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



                  ]))

                  ],
                ),
              ),
            ))

    );
  }



}
