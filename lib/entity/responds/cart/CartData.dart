
import '../../startSignup.dart';
import 'CartDataa.dart';

class CartData {
    List<CartDataa> dataa;

    CartData({this.dataa});

    factory CartData.fromJson(Map<String, dynamic> json) {
        return CartData(
            dataa: json['dataa'] != null ? (json['dataa'] as List).map((i) => CartDataa.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.dataa != null) {
            data['dataa'] = this.dataa.map((v) => v.toJson()).toList();
        }
        return data;
    }
}