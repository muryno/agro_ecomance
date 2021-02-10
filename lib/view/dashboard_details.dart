





import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';






class DashBoardDetailsScreen extends StatefulWidget{


  @override
  _DashBoardDetailsScreen createState()  =>  _DashBoardDetailsScreen();

}


class _DashBoardDetailsScreen extends State<DashBoardDetailsScreen>{


  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body: Container(
        color: Colors.white54,
        padding: EdgeInsets.only(top:60,right: 16,left: 16 ),


        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Row(
                children: [


                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back,color: Colors.black,),
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


              Text("Featured",style: TextStyle(color: Colors.black,fontFamily: "PoppinsMedium",fontSize: 30),),

              Expanded(
                  child:      GridView.count(
                    crossAxisCount: 2,

                    childAspectRatio: 8.0 / 9.0,
                    mainAxisSpacing:8,
                    crossAxisSpacing: 8,

                    children: <Widget>[

                      homeProductItem(img: "img1.png",context: context),
                      homeProductItem(img: "img2.png",context: context),
                      homeProductItem(img: "img3.png",context: context),
                      homeProductItem(img: "img4.png",context: context),
                      homeProductItem(img: "img5.png",context: context),
                      homeProductItem(img: "img6.png",context: context),
                      homeProductItem(img: "img3.png",context: context),


                    ],
                  ),
              )

            ]
        ),





      )
    );

  }


  homeProductItem({String img,BuildContext context}){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset(
            'assets/images/$img',
            fit:BoxFit.fill ,
            height: 150,
            width: MediaQuery.of(context).size.width/2-50,
          ),


          SizedBox(height: 3,),
          Text("NGN 5000",style: TextStyle(color: Color(0xff434343),fontFamily: "PoppinsBold",fontSize: 18),),

          SizedBox(height: 5,),

          Text("Bunch of Banana",style: TextStyle(color: Color(0xff656565),fontFamily: "PoppinsRegular",fontSize: 14),)
        ],
      ),);
  }

}


