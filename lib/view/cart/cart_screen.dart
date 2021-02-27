





import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'cart_screen_details.dart';






class CartScreen extends StatefulWidget{


  @override
  _CartScreen createState()  =>  _CartScreen();


}


class _CartScreen extends State<CartScreen>{


  @override
  void initState() {
    cartBloc.getCart();
    super.initState();
  }



  @override
  void dispose() {

    cartBloc.dispose();
    super.dispose();
  }

  List<CartDataa>   snapshotData;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;



    return Scaffold(


      body: Container(
          color: Colors.white54,
          padding: EdgeInsets.only(top:60,right: 16,left: 16 ),


          child:Stack(
            children: [

              Column(
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

                        InkWell(
                          onTap: (){
                          },
                          child:             StreamBuilder(
                            stream:cartBloc.fetchCart,
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



                    SizedBox(height: 30,),




                    Text("Cart",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 30,color: Color(0xff3ABB16)),),





                    StreamBuilder(
                      stream: cartBloc.fetchCart,
                      builder: (context, AsyncSnapshot< List<CartDataa> >  snapshot){
                        if(snapshot.hasData ){

                          snapshotData = snapshot.data;
                          return   Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context,index){
                                    return CartDetailsScreen( dat : snapshot.data[index] );
                                  })
                          );


                        }else if(snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }

                        return Center(child: CircularProgressIndicator(),);
                      },
                    ),

                  ]
              ),


              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: RaisedGradientButton(
                      height: 55,
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                      ),
                      onPressed: (){

                        snapshotData.forEach((element) {
                          if(element!= null && element.quantity>0){
                            Navigator.of(context).pushNamed(PageRouteConstants.addressScreen,arguments:snapshotData );
                          }else{

                            Helper.toastError("Select number of quantity you want");
                          }
                        });



                      }
                  ),
                ),
              )


            ],
          )







      ),
    );

  }





}


