





import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';






class CartScreen extends StatefulWidget{


  @override
  _CartScreen createState()  =>  _CartScreen();


}


class _CartScreen extends State<CartScreen>{


int count = 0;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(


      body:SingleChildScrollView(
        child:  Container(
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

                    Icon(Icons.shopping_basket,color: Colors.black,)
                  ],
                ),



                SizedBox(height: 30,),




                    Text("Cart",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 30,color: Color(0xff3ABB16)),),




                ...List.generate(3, (index) =>   Container(

                  height: 140,

                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset(

                          'assets/images/banana.png',
                          width: 90,height: 100,fit: BoxFit.fill,
                        ),
                        SizedBox(width: 15,),

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Text("Basket of Tomatoes",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 14),),


                                  // InkWell(
                                  //   onTap: (){},
                                  //   child:  Align(
                                  //     alignment: Alignment.topRight,
                                  //     child:
                                  //     Icon(Icons.clear),
                                  //   ),
                                  // )


                                ],
                              ),

                              Text("NGN 500",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 15,color: Color(0xff3ABB16)),),



                              SizedBox(height: 10,),
                              Expanded(
                                child:    Container(
                                  color: Colors.grey.withOpacity(0.2),

                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  height: 150,
                                  child:     Row(

                                    children: [


                                      InkWell(
                                        onTap: (){
                                          if(count>  0) {
                                            setState(() {
                                              count = count - 1;
                                            });
                                          }
                                        },
                                        child:  Icon(Icons.remove,size: 12,),
                                      ),
                                      SizedBox(width: 10,),
                                      Text("$count"),


                                      SizedBox(width: 10,),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            count = count + 1;
                                          });
                                        },
                                        child:   Icon(Icons.add,size: 12,),
                                      ),


                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],

                    ),
                  ),
                )),



                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: RaisedGradientButton(
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed(PageRouteConstants.addressScreen);

                      }
                  ),
                ),

              ]
          ),







        ),
      )
    );

  }


}


