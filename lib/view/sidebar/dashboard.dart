
import 'package:agro_ecomance/entity/responds/DashboardResp.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/rxbloc_pattern/dashboard_bloc.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
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
import 'ewallet.dart';


class HomePageDashboard extends StatefulWidget {

 final UserProfileData userProfileData;

  HomePageDashboard({@required  this.userProfileData});
  @override
  _HomePageDashboard createState() => _HomePageDashboard();
}

class _HomePageDashboard extends State<HomePageDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  String _usr = "";



  String avr ;

  @override
  void initState() {

    dashBloc.getDashBoard();
    super.initState();
  }

  @override
  void dispose() {
    dashBloc.dispose();
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
                'Hello, ${widget?.userProfileData?.username}',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFFABA3A3),
                    fontFamily:'PoppinsRegular' ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0XFF707070),
                    fontFamily:'PoppinsBold' ),
              ),
              const SizedBox(
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
                          "Community growth",
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
                          Text("Total Referral",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                          SizedBox(height: 15,),


                          StreamBuilder(
                            stream: dashBloc.fetchTotalReferral,
                            builder: (context, AsyncSnapshot< int >  snapshot){
                              if(snapshot.hasData ){
                                return  Text("${snapshot.data}",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsBold',fontSize: 16 ),);
                              }else if(snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }

                              return CircularProgressIndicator();
                            },
                          ),



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
                          Text("Total Commission",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),

                          SizedBox(height: 15,),
                          StreamBuilder(
                            stream: dashBloc.fetchTotalCommission,
                            builder: (context, AsyncSnapshot< int >  snapshot){
                              if(snapshot.hasData ){
                                return Text("N${snapshot.data}",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsBold',fontSize: 16 ),);

                              }else if(snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }

                              return CircularProgressIndicator();
                            },
                          ),



                        ],
                      ) ,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
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
                          Text("Ledger Balance",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                          SizedBox(height: 15,),
                          StreamBuilder(
                            stream: dashBloc.fetchApprovedCommission,
                            builder: (context, AsyncSnapshot< int >  snapshot){
                              if(snapshot.hasData ){
                                return Text("N${snapshot.data}",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsBold',fontSize: 16 ),);

                              }else if(snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }

                              return CircularProgressIndicator();
                            },
                          ),


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
                          Text("Agropoint",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                          SizedBox(height: 15,),

                          StreamBuilder(
                            stream: dashBloc.fetchPendingCommission,
                            builder: (context, AsyncSnapshot< int >  snapshot){
                              if(snapshot.hasData ){
                                return Text("${snapshot.data}",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsBold',fontSize: 16 ),);

                              }else if(snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }

                              return CircularProgressIndicator();
                            },
                          ),


                        ],
                      ) ,
                    ),
                  )
                ],
              ),

              SizedBox(height: 35,),


              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child:  Text("Commission Distribution",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child:  Text("Rice",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 12 ),),
                    ),

                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width-60,
                      lineHeight: 3.0,
                      percent: 0.5,
                      backgroundColor: Colors.grey,
                      progressColor: Color(0xff3ABC16),
                    ),

                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child:  Text("Tomato",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 12 ),),
                    ),

                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width-60,
                      lineHeight: 3.0,
                      percent: 0.8,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.black45,
                    ),

                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child:  Text("Beans",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 12 ),),
                    ),

                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width-60,
                      lineHeight: 3.0,
                      percent: 0.3,
                      backgroundColor: Colors.grey,
                      progressColor: Color(0xff99DB86),
                    ),

                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child:  Text("Tomato",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 12 ),),
                    ),

                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width-60,
                      lineHeight: 3.0,
                      percent: 0.8,
                      backgroundColor: Colors.grey,
                      progressColor: Color(0xff808080),
                    ),
                    SizedBox(height: 15,),

                  ],
                ) ,
              ),
              SizedBox(height: 35,),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 15,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      child:  Text("New Downlines",style: TextStyle(color: Color(0xff0B2E70),fontFamily:'PoppinsBold',fontSize: 12 ),),
                    ),
                    SizedBox(height: 15,),


                    StreamBuilder(
                      stream: dashBloc.fetchNewDescendantst,
                      builder: (context, AsyncSnapshot< List<NewDescendant> >  snapshot){
                        if(snapshot.hasData ){

                          return   Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context,index){
                                    return descendantItem( newDescendant : snapshot.data[index] );
                                  })
                          );


                        }else if(snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }

                        return CircularProgressIndicator();
                      },
                    ),



                  ],
                ) ,
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
                              ReUseAble().drawerItem(isActive: true, title: "Dashboard",icon: Icons.dashboard),
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


                          ],
                        ))



                  ],
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



  descendantItem({NewDescendant newDescendant}){

    return    Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 3),
      child: Row(
        children: [

          Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child:   CircleAvatar(
                  backgroundColor: ReUseAble().getButtonColor(),
                  radius: 20,
                  child: newDescendant.avatar_url != null?Image.network(newDescendant.avatar_url ):Icon(Icons.person,color: Colors.white, size: 20))
          ),
          Spacer(),
          Text("${newDescendant.display_name}",style: TextStyle(color: Color(0xff707070),fontFamily:'PoppinsBook',fontSize: 12 ),),
          Spacer(),
          Text("lV.${newDescendant.level}",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsBook',fontSize: 12 ),)


        ],
      ),
    );
  }





}
