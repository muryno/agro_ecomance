
import 'package:agro_ecomance/entity/responds/NetworkResp.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/rxbloc_pattern/network_bloc.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
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




class NetworkDtailsScreen extends StatefulWidget {

 final UserProfileData userProfileData;

 final NetworkData networkData;

  NetworkDtailsScreen({@required  this.networkData,@required  this.userProfileData});


  @override
  _NetworkScreen createState() => _NetworkScreen();
}

class _NetworkScreen extends State<NetworkDtailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  String avr ;
  @override
  void initState() {

    networkBloc.getNetworkDecendent(widget?.networkData?.uuid);

    super.initState();
  }

  @override
  void dispose() {
    networkBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading:  InkWell(

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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Network Details",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0XFFABA3A3),
                    ),
                  ),
                  Spacer(),



                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          ReUseAble().getTransition(NetworkScreen(userProfileData:widget.userProfileData))
                      );
                    },
                    child:    Text(
                      "Main",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0XFF3CBE1B),
                        fontFamily: 'PoppinsBold'
                      ),
                    ),
                  )
                ],
              ),





              SizedBox(
                height: 16.0,
              ),

              Container(
                width: 120,
                height: 120,
                child: CircleAvatar(
                    backgroundColor: ReUseAble().getButtonColor(),
                    radius: 20,child: widget?.networkData?.avatar_url!= null ? Image.network(widget?.networkData?.avatar_url): Icon(Icons.person,color: Colors.white, size: 30)),
              ),


          SizedBox(height: 5,),
          Text(
            '${widget?.networkData?.display_name}Chuchwu akpan ',
            style: TextStyle(
                fontSize: 15,
                color: Color(0XFF707070),
                fontFamily:'PoppinsBold' ),
          ),

          SizedBox(height: 5,),
          Text(
            '${widget?.networkData?.phone}',
            style: TextStyle(
                fontSize: 10,
                color: Color(0XFF3ABC16),
                fontFamily:'PoppinsBold' ),
          ),

          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Container(
                alignment: Alignment.center,
                width: 15,
                height: 15,
                color: Colors.green,
                child: Text("L.V.S",style: TextStyle(color: Colors.white),),
              ),
              SizedBox(width: 10,),

              Container(
                alignment: Alignment.center,
                width: 15,
                height: 15,
                color: Colors.green,
                child: Text('${widget?.networkData?.referral_code}',style: TextStyle(color: Colors.white),),
              ),


            ],
          ),

              SizedBox(
                height: 35,
              ),


              StreamBuilder(
                stream: networkBloc.fetchNetworkDetails,
                builder: (context, AsyncSnapshot<List<NetworkData> >  snapshot){
                  if(snapshot.hasData ){


                    if(snapshot?.data?.length == 0){

                      return   Center(child:  Text("No network available"),);
                    }else {
                      return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot?.data?.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return networkItem(
                                    networkData: snapshot.data[index],
                                    );
                              })
                      );
                    }

                  }else if(snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  return Center(child:  CircularProgressIndicator(),);
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
                                ReUseAble().drawerItem( title: "Purchases",icon: Icons.shopping_basket, ),
                              ),



                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    ReUseAble().getTransition(NetworkScreen(userProfileData:widget.userProfileData))
                                );
                                  },
                                child:
                                ReUseAble().drawerItem(isActive: true, title: "Network",icon: Icons.share, ),
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

  networkItem({NetworkData networkData}){
    return     GestureDetector(
      onTap: (){


        Navigator.of(context).push(
            ReUseAble().getTransition(NetworkDtailsScreen(networkData: networkData,))
        );
        },
      child:  Container(



        margin: EdgeInsets.symmetric(
            vertical: 20,
          ),

        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[



            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                      backgroundColor: ReUseAble().getButtonColor(),
                      radius: 20,child: networkData.avatar_url!= null ? Image.network(networkData.avatar_url): Icon(Icons.person,color: Colors.white, size: 30)),
                ),

                SizedBox(width: 30,),

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 5,),
                    Text(
                      '${networkData?.display_name}Chuchwu akpan ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0XFF707070),
                          fontFamily:'PoppinsBold' ),
                    ),

                    SizedBox(height: 5,),
                    Text(
                      '${networkData.referral_code}',
                      style: TextStyle(
                          fontSize: 10,
                          color: Color(0XFF3ABC16),
                          fontFamily:'PoppinsBold' ),
                    ),

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Container(
                          alignment: Alignment.center,
                          width: 15,
                          height: 15,
                          color: Colors.green,
                          child: Text("L.V.S",style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox(width: 10,),

                        // Container(
                        //   alignment: Alignment.center,
                        //   width: 15,
                        //   height: 15,
                        //   color: Colors.green,
                        //   child: Text('${meta.level}',style: TextStyle(color: Colors.white),),
                        // ),


                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                )
              ],
            ),

            Container(
              height: 25,
              alignment: Alignment.center,


              child: Text("${networkData.phone}"),

              decoration:  BoxDecoration(
                  color: Color(0xffDEDFE2),
                  borderRadius:  BorderRadius.only(
                      bottomLeft:    Radius.circular(20.0),
                      bottomRight:   Radius.circular(20.0))
              ),
            )
          ],
        ),
      ),
    );
  }



}