



import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/products_slider_bloc.dart';
import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';






class CategoryItemScreenScreen extends StatefulWidget{
  @override
  _CategoryItemScreenScreen createState()  =>  _CategoryItemScreenScreen();

}


class _CategoryItemScreenScreen extends State<CategoryItemScreenScreen>{

  UserProfileData userProfileData;

  



  @override
  void dispose() {

    productsBloc.dispose();
    super.dispose();
  }



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
                    InkWell(
                      onTap: (){

                        if(userProfileData?.email!= null) {
                          RetrofitClientInstance.getInstance().reset();
                          Navigator.of(context).pushNamed(PageRouteConstants.cartScreen);
                        }else{
                          Navigator.of(context).pushNamed(PageRouteConstants.view_page);
                        }


                      },
                      child:        StreamBuilder(
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
                  child:     StreamBuilder(
                    stream: productsBloc.fetchProduce,
                    builder: (context, AsyncSnapshot< List<ProductRespData> >  snapshot){
                      if(snapshot.hasData ){

                        if(snapshot.data.length > 0) {
                          return GridView.builder(
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400,
                                  childAspectRatio: 3/ 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext ctx, index) {
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
                )

              ]
          ),





        )
    );

  }




}
