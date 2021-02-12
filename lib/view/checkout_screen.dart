import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';








class  CheckOutScreen extends StatefulWidget{


  @override
  _CheckOutScreen createState()  =>  _CheckOutScreen();

}


class _CheckOutScreen extends State<CheckOutScreen>{

  final progressKey = GlobalKey();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;






    final formKey = GlobalKey<FormState>();



    return Scaffold(


      body:  Stack(


        children: <Widget>[

        SingleChildScrollView(
          child:   Form(
            key: formKey,
            child: Container (
                width: size.width,
                height: size.height,
                margin: EdgeInsets.only(top: 50,left: 16,right: 16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 35,),

                    InkWell(
                      child:    Icon(
                        Icons.arrow_back_outlined,

                        size: 25,
                      ),
                      onTap: (){
                        Navigator.of(context).pop();

                      },
                    ),

                    SizedBox(height: 20,),

                    Text("Check Out",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsRegular' ,fontSize: 25),),



                    SizedBox(height: 20,),
                    ...List.generate(2, (index) =>   Container(

                      height: 140,

                      padding: EdgeInsets.symmetric(vertical: 10),
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
                    SizedBox(height: 21,),

                    Container(
                      child: Row(
                        children: [
                          Text("11 Kajola esstate\nebutte meta",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 14),),

                          Spacer(),


                          Icon(Icons.my_location,color: Color(0xff3ABC16),)

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Text("Sub Total",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                        Spacer(),
                        Text("NGN 5000",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),
                    SizedBox(height: 5,),

                    Row(
                      children: [
                        Text("Discount",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                        Spacer(),
                        Text("5%",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),

                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Text("Shipping",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                        Spacer(),
                        Text("NGN400",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),

                    SizedBox(height: 10,),

                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Total",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                        Spacer(),
                        Text("NGN5400",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),
                    Spacer(),





                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: RaisedGradientButton(
                          child: Text(
                            'Buy',
                            style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                          ),
                          onPressed: (){
                            Navigator.of(context).pushNamed(PageRouteConstants.confirmPaymentScreen);

                          }
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )

                  ],
                )
            ),
          )
        )

        ],


      )
    );




  }


}//
