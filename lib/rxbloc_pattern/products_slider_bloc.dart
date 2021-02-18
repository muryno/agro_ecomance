


import 'dart:convert';





import 'package:agro_ecomance/entity/responds/ProductResp.dart';
import 'package:agro_ecomance/entity/responds/Slider.dart';

import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class ProductsBloc {
  // ignore: close_sinks


  final apiProvider = RetrofitClientInstance.getInstance();




  final _productArrayResp = PublishSubject<List<ProductRespData>>();
  Stream<List<ProductRespData>> get fetchProduce => _productArrayResp.stream;




  final _sliderData = PublishSubject<List<SliderData>>();
  Stream<List<SliderData>> get fetchSlider => _sliderData.stream;



  getProduce() async{
    ProductResp item = await apiProvider.getDataService().getFeaturedProduct();
    _productArrayResp.sink.add(item.data);
  }


  getSlider() async{
    Sliders item = await apiProvider.getDataService().getSlider();
    _sliderData.sink.add(item.data);
  }










  dispose() {
    _productArrayResp.drain();
    _sliderData.drain();
  }

  onError(e) {
  var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed(ad["message"]);
  }



}

final productsBloc = ProductsBloc();



