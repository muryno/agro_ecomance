





import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';






class DashBoardScreen extends StatefulWidget{


  @override
  _DashBoardScreen createState()  =>  _DashBoardScreen();

}


class _DashBoardScreen extends State<DashBoardScreen>{


  @override
  Widget build(BuildContext context) {




    return Scaffold(


      body: SingleChildScrollView(
        child: Container(
          color: Colors.white54,
          padding: EdgeInsets.only(top:60,right: 16,left: 16 ),


          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  
                  Icon(Icons.menu,color: Colors.black,),

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
    );

  }




}


