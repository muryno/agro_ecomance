


import 'dart:convert';
import 'dart:typed_data';





import 'package:agro_ecomance/entity/db/database.dart';
import 'package:agro_ecomance/entity/myEntity/WishEntity.dart';
import 'package:agro_ecomance/entity/request/AddCart.dart';
import 'package:agro_ecomance/entity/request/AddWishBasket.dart';
import 'package:agro_ecomance/entity/responds/WishBaskResp.dart';
import 'package:agro_ecomance/entity/responds/WishListBasketDetails.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class WishBloc {

   var  CartCount = 0 ;
  final apiProvider = RetrofitClientInstance.getInstance();




  final _basketData = PublishSubject<List<WishBaskData> >();
  Stream<List<WishBaskData>> get fetchbasket => _basketData.stream;



   var myData = List<Wishe>();


//addWishBasket

  addWishList( String wish , BuildContext context) {



    var addBask = {"title":wish};

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addNewWishList(addBask).then((value)=>{


        if(value.status_code == 200 ||value.status_code == 201 ){
          Helper.loadingSuccessful(value.message),
          fetchWishBasket(),
          Navigator.of(context).pop(),

        } else

          Helper.loadingFailed("Can't add wishes  ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  addWishToBasket( String uuid, int quantity, int weight, int product_id , BuildContext context) {




    var addBask = AddWishBasket();
    addBask.quantity = quantity;
    addBask.weight = weight;
    addBask.product_id = product_id;

    Helper.startLoading(context);


    try {


      RetrofitClientInstance.getInstance().getDataService().addWishBasket(uuid,addBask).then((value)=>{


        if(value.status_code == 200 ||value.status_code == 201  ){
          Helper.loadingSuccessful(value.message),
          fetchWishBasket(),


        } else

          Helper.loadingFailed("Can't add wishes  ")


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }


  fetchWishBasket() async{
    WishBaskResp item = await apiProvider.getDataService().getBaskets();
    _basketData.sink.add(item.wishBaskData);
  }


  getBasketWishe(int id) async{
    WishListBasketDetails item = await apiProvider.getDataService().getBasketWishes(id);


    item.wishes.forEach((element) {
      element.thumbnail_url =  element.product.featured_image.thumbnail_url;
      element.name =  element.product.name;
      element.price =  element.price;
      element.parentUuid =  item.basket.uuid;
    });


    myData = item.wishes;
    AppDatabase.getInstance()?.wishDataDao?.nukeWishe();
    AppDatabase.getInstance()?.wishDataDao?.insertAllWishe(myData);

  }

  convertWishToCarts(String uuid, BuildContext context) {

    Helper.startLoading(context);
    try {



      RetrofitClientInstance.getInstance().getDataService().convertWishToCart(uuid).then((value)=>{

        if (value !=null ) {

          Helper.loadingSuccessful("Items added to cart successfully"),



        }  else
          {

            Helper.loadingFailed("Items adding to cart failed")
          }


      }).catchError(onError);
    }catch(e){

      Helper.loadingFailed(e.toString());
    }
  }





  dispose() {

    _basketData.drain();

  }

  onError(e) {

  var ad =  jsonDecode(e.toString());
    Helper.loadingFailed(ad["message"] ?? "");


  }



}

final wishBloc = WishBloc();



