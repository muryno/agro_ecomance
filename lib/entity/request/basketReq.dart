




import 'package:agro_ecomance/entity/responds/DeliveryAddressResp.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

class BasketReq{


  List<CartDataa>   snapshotData;
  DeliveryAddres  deliveryAddres;

  BasketReq(  List<CartDataa>   snapshotData, DeliveryAddres  deliveryAddres){
    this.snapshotData = snapshotData;
    this.deliveryAddres = deliveryAddres ;
  }

  getMyData(){
    List<dynamic> dfr = [];
    dfr.add(snapshotData);
    dfr.add(deliveryAddres);

  }

}