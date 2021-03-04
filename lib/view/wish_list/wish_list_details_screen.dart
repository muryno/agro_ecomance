





import 'package:agro_ecomance/entity/db/database.dart';
import 'package:agro_ecomance/entity/myEntity/WishEntity.dart';
import 'package:agro_ecomance/entity/responds/WishBaskResp.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/wish_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/cart/cart_screen_details.dart';
import 'package:agro_ecomance/view/wish_list/wish_screen_details.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';








class WishListItemDetailsScreen extends StatefulWidget{

  final WishBaskData wishBaskData;
  WishListItemDetailsScreen({this.wishBaskData });

  @override
  _WishListItemDetailsScreen createState()  =>  _WishListItemDetailsScreen();


}


class _WishListItemDetailsScreen extends State<WishListItemDetailsScreen>{


  @override
  void initState() {
    wishBloc.getBasketWishe(widget?.wishBaskData?.id);
    super.initState();
  }



  @override
  void dispose() {

    wishBloc.dispose();
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


                        SizedBox(width: 5,),
                      ],
                    ),



                    SizedBox(height: 30,),




                    Text("Shopping for ${widget?.wishBaskData?.title}",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 30,color: Color(0xff3ABB16)),),





                    StreamBuilder(
                      stream:    AppDatabase?.getInstance()?.wishDataDao?.findAllWish(),
                      builder: (context, AsyncSnapshot< List<Wishe> >  snapshot){
                        if(snapshot.hasData ){


                          return   Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context,index){
                                    return WishDetailsScreen( dat : snapshot.data[index] );
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


