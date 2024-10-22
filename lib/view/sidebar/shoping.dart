





import 'package:agro_ecomance/entity/db/database.dart';
import 'package:agro_ecomance/entity/responds/ProductCategory.dart';
import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/addCartResp/CategoryDataResp.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/products_slider_bloc.dart';
import 'package:agro_ecomance/server/retrofit_clients.dart';
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
import 'package:agro_ecomance/view/sidebar/wishList.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'logout.dart';







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

            (value )=>
            {
              if(value != null )
                {
                  setState((){
                    userProfileData = value;
                  }),

                  cartBloc.getCart()

                }
            }
    );

    productsBloc.getProduce();
    productsBloc.getSlider();
    productsBloc.getCategory();

    super.initState();
  }





@override
void dispose() {

  productsBloc.dispose();
  cartBloc.dispose();
  super.dispose();
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

                   InkWell(

                    onTap: (){
                      if(userProfileData?.email!= null) {
                        RetrofitClientInstance.getInstance().reset();
                        _scaffoldKey.currentState.openDrawer();
                      }else{
                        Navigator.of(context).pushNamed(PageRouteConstants.view_page);
                      }
                    },

                    child: Container(
                      child:    Image.asset(
                        'assets/images/menu.png',
                        width: 24,height: 24,color: Colors.black,
                      ),
                    )

                  ),




                  Spacer(),
                  InkWell(

                    onTap: (){
                      if(userProfileData?.email!= null) {
                        Navigator.of(context).push(
                            ReUseAble().getTransition(SettingScreen(userProfileData:userProfileData))
                        );
                      }else{
                        Navigator.of(context).pushNamed(PageRouteConstants.view_page);
                      }
                    },

                    child:  Icon(Icons.person,color: Colors.black,size: 24,),

                  ),

                  SizedBox(width: 10,),

                  InkWell(
                    onTap: (){

                      if(userProfileData?.email!= null) {
                        RetrofitClientInstance.getInstance().reset();
                        Navigator.of(context).pushNamed(PageRouteConstants.cartScreen);
                      }else{
                        Navigator.of(context).pushNamed(PageRouteConstants.view_page);
                      }


                    },
                    child:             StreamBuilder(
                      stream:AppDatabase?.getInstance()?.cartDataDao?.findAllCart(),
                      builder: (context, AsyncSnapshot< List<CartDataa> >  snapshot){
                        if(snapshot.hasData ){


                          return     Badge(
                            badgeColor: Colors.green,
                            badgeContent: Text('${snapshot.data.length}',style: TextStyle(color: Colors.white),),
                            child:  Icon(Icons.shopping_basket,color: Colors.green,),
                          );
                        }

                        return    Badge(
                          badgeColor: Colors.green,
                          badgeContent: Text('0',style: TextStyle(color: Colors.white),),
                          child:  Icon(Icons.shopping_basket,color: Colors.green,),
                        );
                      },
                    ),




                  ),
                  SizedBox(width: 5,),
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


              StreamBuilder(
                stream: productsBloc.fetchSlider,
                builder: (context, AsyncSnapshot< List<SliderData> >  snapshot){
                  if(snapshot.hasData ){


                    if(snapshot.data.length > 0) {
                      return   CarouselSlider(
                          items: snapshot.data.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),

                                    child: Image.network(i.image, fit:BoxFit.cover ,)
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

                      ));
                    }else{
                      return CarouselSlider(
                          items: [
                            'assets/images/banner.png',
                            'assets/images/banana.png',
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),

                                    child: Image.asset(i, fit:BoxFit.cover ,)
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 150,
                            aspectRatio: 16/9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,


                            scrollDirection: Axis.horizontal,

                          ));
                    }

                  }

                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text("Category",style: TextStyle(color: Colors.black,fontFamily: "PoppinsMedium",fontSize: 22),),




                ],
              ),
              SizedBox(height: 10,),
              Container(

                height: 70,
                alignment: Alignment.center,

                child:   StreamBuilder(
                  stream: productsBloc.fetchCategory,
                  builder: (context, AsyncSnapshot< List<CategoryData> >  snapshot){
                    if(snapshot.hasData ){

                      if(snapshot.data.length > 0) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,

                            itemCount: snapshot.data.length,


                            itemBuilder: (context,
                                index) {
                              return   ReUseAble().homeCategoryItem(snapshot.data[index],context);
                            });
                      }else{

                        return Center(child: Text("No Category available"),);

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




                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),


              ),

              SizedBox(height: 25,),
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

                child:   StreamBuilder(
                  stream: productsBloc.fetchProduce,
                  builder: (context, AsyncSnapshot< List<ProductRespData> >  snapshot){
                    if(snapshot.hasData ){

                      if(snapshot.data.length > 0) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,


                            itemBuilder: (context,
                                index) {
                              return   ReUseAble().homeProductItem(snapshot.data[index],context);
                            });
                      }else{

                        return Center(child: Text("No Product available"),);

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






                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
              ),

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

                height: 250,

                child:   StreamBuilder(
                  stream: productsBloc.fetchProduce,
                  builder: (context, AsyncSnapshot< List<ProductRespData> >  snapshot){
                    if(snapshot.hasData ){

                      if(snapshot.data.length > 0) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,


                            itemBuilder: (context,
                                index) {
                              return   ReUseAble().homeProductItem(snapshot.data[index],context);
                            });
                      }else{

                        return Center(child: Text("No Product available"),);

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






                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
              ),


            ],
          )
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
                              ReUseAble().drawerItem(title: "Profile",icon: Icons.person, ),
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
                              ReUseAble().drawerItem(isActive: true , title: "Continue Shopping",icon: Icons.arrow_back, ),
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


