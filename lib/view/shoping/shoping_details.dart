





import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:agro_ecomance/view/sidebar/wishList.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';





int _index = 0;
class ShopingDetails extends StatefulWidget{


  @override
  _ItemDashBoardDetailsScreen createState()  =>  _ItemDashBoardDetailsScreen();


}


class _ItemDashBoardDetailsScreen extends State<ShopingDetails>{

  int _index = 100;
  int quatity ;

  ProductRespData  productRespData;



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




    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    productRespData = ModalRoute.of(context).settings.arguments;


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

                        if(userProfileData?.email!= null) {
                          RetrofitClientInstance.getInstance().reset();
                          Navigator.of(context).pushNamed(PageRouteConstants.cartScreen);
                        }else{
                          Navigator.of(context).pushNamed(PageRouteConstants.view_page);
                        }


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


                Container(
                  width: size.width,height: 238,
                  child:     CachedNetworkImage(
                    imageUrl: '${ productRespData.featured_image.file_url}',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter:
                            ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>Center(child:  CircularProgressIndicator(),),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),

                Text(productRespData.name,style: TextStyle(color: Colors.black,fontFamily: "PoppinsRegular",fontSize: 25),),

                SizedBox(height: 10,),


                Row(
                  children: [
                    Text("NGN ${productRespData.discount}",style: TextStyle(color: Color(0xff3ABC16),fontFamily: "PoppinsRegular",fontSize: 20),),

                    SizedBox(width: 20,),
                    Text("NGN ${productRespData.price}",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 16,decoration: TextDecoration.lineThrough),),

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
                  child:    Text(productRespData.description ,style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 14,color: Colors.black),),
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


                    Container(   height: 50,
                      child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:  productRespData.price_distribution.length,
                          physics: NeverScrollableScrollPhysics(),

                          itemBuilder: (context,
                              index) {
                            return  weigh(priceDistribution: productRespData.price_distribution[index],indexClicked: index);
                          }),),

                  ],

                ),

                SizedBox(height: 40,),


                Row(
                  children: [

                    Expanded(


                      child: Container(
                        height: 55,
                        child: RaisedButton(



                            onPressed: () {

                              if(userProfileData?.email!= null) {
                                Navigator.of(context).push(
                                    ReUseAble().getTransition(WishListScreen())
                                );
                              }else{
                                Navigator.of(context).pushNamed(PageRouteConstants.view_page);}


                            },





                            child: Text("ADD TO WISH",style: TextStyle(
                                color: Colors.white
                            ),),
                            color: Colors.grey
                        ),
                      )
                    ),

                    Expanded(


                      child:Container(
                        height: 55,
                        child:  RaisedButton(





                            onPressed: () {

                              if(userProfileData?.email!= null) {
                                RetrofitClientInstance.getInstance().reset();
                                cartBloc.addCartData(productRespData.id, quatity, context);
                              }else{
                                Navigator.of(context).pushNamed(PageRouteConstants.view_page);}


                            },




                            child: Text("ADD TO CART",style: TextStyle(
                                color: Colors.white
                            ),),
                            color: Color(0xff3ABC16)
                        ),
                      )
                    ),
                  ],
                ),

                SizedBox(height: 10,),
              ]
          ),







        ),
      )
    );

  }

  weigh({PriceDistribution priceDistribution,int indexClicked}){


    return    InkWell(
        onTap: (){
      setState(() {
        _index = indexClicked;
        quatity = int.parse(priceDistribution.weight?? 0) ;
      });

    },
    child:   Container(

      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,


      child: Text("${ priceDistribution.weight}${ priceDistribution.unit} ", style: TextStyle(
          color: _index == indexClicked ? Colors.white : Colors
              .black),),
      decoration: BoxDecoration(
          color: _index == indexClicked ? Color(0xff3ABB16) : Colors
              .grey.withOpacity(0.2),
          border: Border.all(
            color: _index == indexClicked ? Color(0xff3ABB16) : Colors
                .grey.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
    ));
  }


}


