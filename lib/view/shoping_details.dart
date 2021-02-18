





import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';






class ShopingDetails extends StatefulWidget{


  @override
  _ItemDashBoardDetailsScreen createState()  =>  _ItemDashBoardDetailsScreen();


}


class _ItemDashBoardDetailsScreen extends State<ShopingDetails>{

  int _index = 0;

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
//cartScreen

                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(PageRouteConstants.cartScreen);
                    },
                    child:        Icon(Icons.shopping_basket,color: Colors.black,),
                  )
                  ],
                ),



                SizedBox(height: 30,),


                Image.asset(

                  'assets/images/banana.png',
                  width: size.width,height: 238,
                ),

                Text("Bunch of Banana",style: TextStyle(color: Colors.black,fontFamily: "PoppinsRegular",fontSize: 25),),

                SizedBox(height: 10,),


                Row(
                  children: [
                    Text("NGN 50,000",style: TextStyle(color: Color(0xff3ABC16),fontFamily: "PoppinsRegular",fontSize: 20),),

                    SizedBox(width: 20,),
                    Text("NGN 75000",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 16,decoration: TextDecoration.lineThrough),),

                  ],
                ),

                SizedBox(height: 20,),

                Container(
                  width: size.width,
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),

                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(

                      alignment: Alignment.center,

                      width:55,
                      height: 40,

                      child: Text("4.5",style: TextStyle(color: Colors.white),),
                      decoration: BoxDecoration(
                          color: Color(0xff3ABB16),
                          border: Border.all(
                            color: Color(0xff3ABB16),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                    ),

                    SizedBox(width: 20,),
                    Text("Very Good",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 14,color: Colors.black),),

                    Spacer(),
                    Text("49 Review",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 14,color: Colors.black),),
                    Icon(Icons.flag,color: Colors.green,),


                  ],

                ),


                SizedBox(height: 20,),
                Container(
                  width: size.width,
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),

                SizedBox(height: 20,),
                Text("Description",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 14,color: Colors.black),),
                SizedBox(height: 5,),

                Container(
                  child:    Text("A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 14,color: Colors.black),),
                ),
                SizedBox(height: 20,),


                Container(
                  alignment: Alignment.center,
                  child: Text("Select Size",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 18,color: Colors.black),),
                ),


                SizedBox(height: 20,),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [






                    InkWell(
                      onTap: (){
                        setState(() {
                          _index = 0;
                        });

                      },
                      child:  Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,

                        width:55,
                        height: 50,

                        child: Text("1KG",style: TextStyle(color:   _index == 0? Colors.white : Colors.black  ),),
                        decoration: BoxDecoration(
                            color: _index == 0?  Color(0xff3ABB16):   Colors.grey.withOpacity(0.2) ,
                            border: Border.all(
                              color: _index == 0?  Color(0xff3ABB16):   Colors.grey.withOpacity(0.2) ,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                    ),


                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _index = 1;
                        });

                      },
                      child:  Container(

                        alignment: Alignment.center,

                        width:55,
                        height: 50,

                        child: Text("5KG",style: TextStyle(color:   _index == 1? Colors.white : Colors.black  ),),
                        decoration: BoxDecoration(
                            color: _index == 1?  Color(0xff3ABB16):   Colors.grey.withOpacity(0.2) ,
                            border: Border.all(
                              color: _index == 1?  Color(0xff3ABB16):   Colors.grey.withOpacity(0.2) ,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                    ),


                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _index = 2;
                        });

                      },
                      child:  Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,

                        width:55,
                        height: 50,

                        child: Text("10KG",style: TextStyle(color:   _index == 2? Colors.white : Colors.black),),
                        decoration: BoxDecoration(
                            color: _index == 2?  Color(0xff3ABB16):  Colors.grey.withOpacity(0.2) ,
                            border: Border.all(
                              color: _index == 2?  Color(0xff3ABB16):   Colors.grey.withOpacity(0.2) ,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _index = 3;
                        });

                      },
                      child:  Container(

                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,

                        width:55,
                        height: 50,

                        child: Text("25KG",style: TextStyle(color:   _index == 3? Colors.white : Colors.black ),),
                        decoration: BoxDecoration(
                            color: _index == 3?  Color(0xff3ABB16):  Colors.grey.withOpacity(0.2) ,
                            border: Border.all(
                              color: _index == 3?  Color(0xff3ABB16):  Colors.grey.withOpacity(0.2) ,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                      ),
                    ),
                  ],

                ),

                SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(

                      child: RaisedButton(



                          onPressed: () {


                          },




                          child: Text("ADD TO CART",style: TextStyle(
                              color: Colors.black
                          ),),
                          color: Colors.grey
                      ),
                    ),
                    Expanded(

                      child: RaisedButton(



                          onPressed: () {

                          },




                          child: Text("BUY NOW",style: TextStyle(
                              color: Colors.white
                          ),),
                          color: Color(0xff3ABC16)
                      ),
                    ),
                  ],
                )
              ]
          ),







        ),
      )
    );

  }


}


