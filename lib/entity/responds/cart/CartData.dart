
import '../../startSignup.dart';
import 'CartDataa.dart';

class CartData {
    List<CartDataa> dataa;

    CartData({this.dataa});

    factory CartData.fromJson(Map<String, dynamic> json) {
        return CartData(
            dataa: json['data'] != null ? (json['data'] as List).map((i) => CartDataa.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.dataa != null) {
            data['data'] = this.dataa.map((v) => v.toJson()).toList();
        }
        return data;
    }
}